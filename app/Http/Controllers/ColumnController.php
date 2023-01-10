<?php

namespace App\Http\Controllers;

use App\Http\Requests\columnRequest;
use App\Http\Resources\columnResource;
use App\Models\Column;
use Illuminate\Http\Request;

class ColumnController extends Controller
{
    public function index(Request $request)
    {
        $columns = Column::with(['cards'])->get();
        if ($columns->isEmpty()) {
            return response(['message' => 'there is no columns in data base'], 404);
        }
        return response(['data' => columnResource::collection($columns)], 200);
    }

    public function create(columnRequest $request)
    {
        if (!$this->unique($request)) {
            return response(['message' => 'this column already exist'], 422);
        }
        $column = Column::create($request->all());
        return response(['data' => new columnResource($column)], 200);
    }

    public function update(columnRequest $request, $id)
    {
        if (!$this->unique($request, $id)) {
            return response(['message' => 'this column already exist'], 422);
        }
        $column = Column::with(['cards'])->where('id', $id)->first();
        $column->update($request->all());
        return response(['data' => new columnResource($column)], 200);
    }

    public function delete($id)
    {
        $column = Column::find($id);
        $column->delete();
        return response(['message' => 'column deleted successfully'], 200);
    }

    public function unique($request, $id = null)
    {
        $check = Column::where('name', $request->name);
        if ($id != null) {
            $check->where('id', '!=', $id);
        }
        $check = $check->first();
        return empty($check) ? true : false;
    }
}
