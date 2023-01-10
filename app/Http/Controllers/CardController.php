<?php

namespace App\Http\Controllers;

use App\Http\Requests\cardRequest;
use App\Http\Requests\moveRequest;
use App\Http\Resources\cardResource;
use App\Models\Card;
use Illuminate\Http\Request;

class CardController extends Controller
{
    public function index(Request $request)
    {
        $request->validate(
            [
                'Creation_date' => 'nullable',
                'Status' => 'nullable|in:1,0',
                'access_token' => 'required'
            ]
        );

        $tokenController = new TokenController;
        if (!$tokenController->verify($request->access_token)) {
            return response(['error' => 'access token is not valid or expired'], 401);
        }
        $cards = Card::query();
        if ($request->column) {
            $cards->where('column_id', $request->column)->orderby('order');
        }
        if ($request->Creation_date) {
            $cards->where('created_at', 'like', '%' . date('Y-m-d', strtotime($request->Creation_date)) . '%');
        }
        if (array_key_exists('Status', $request->all())) {
            if ($request->Status == 0) {
                $cards->onlyTrashed();
            } else {
                $cards->withTrashed();
            }
        }

        $cards = $cards->get();
        return response(['data' => cardResource::collection($cards)], 200);
    }
    public function create(cardRequest $request)
    {
        $card = Card::create($request->all());
        //note there is an observer that handle card ordering
        return response(['data' => new cardResource($card)], 200);
    }
    public function update(cardRequest $request, $id)
    {
        $card = Card::find($id);
        $card->update($request->all());
        return response(['data' => new cardResource($card)], 200);
    }
    public function move(moveRequest $request, $id)
    {
        $card = Card::find($id);
        $card->update(['column_id' => $request->new_column_id, 'order' => $request->order]);
        //reordering old and new column cards
        $old_column_cards = Card::where('column_id', $request->old_column_id)->where('order', '>=', $request->order)->get();
        $new_column_cards = Card::where('column_id', $request->new_column_id)->where('order', '>=', $request->order)->where('id', '!=', $card->id)->get();
        $this->reorder($old_column_cards, false);
        $this->reorder($new_column_cards, true);

        return response(['message' => 'done'], 200);
    }
    public function delete($id)
    {
        $card = Card::find($id);
        $card->delete();
        $column_cards = Card::where('column_id', $card->column_id)->where('order', '>=', $card->order)->get();
        $this->reorder($column_cards, false);
        return response(['message' => 'card deleted successfully'], 200);
    }

    public function reorder($cards, $increment)
    {
        foreach ($cards as $card) {
            $order = $increment == true ? ($card->order + 1) : ($card->order - 1);
            $card->update(['order' => $order]);
        }
    }
}
