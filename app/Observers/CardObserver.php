<?php

namespace App\Observers;

use App\Models\Card;
use Illuminate\Support\Facades\Log;

class CardObserver
{
    /**
     * Handle the Card "created" event.
     *
     * @param  \App\Models\Card  $card
     * @return void
     */
    public function created(Card $card)
    {
        $order=0;
        $last_order=Card::where('column_id',$card->column_id)->orderby('order','desc')->first();
        if(!empty($last_order)){
            $order=$last_order->order+1;
        }
        $card->update(['order'=>$order]);
    }

    /**
     * Handle the Card "updated" event.
     *
     * @param  \App\Models\Card  $card
     * @return void
     */
    public function updated(Card $card)
    {
        //
    }

    /**
     * Handle the Card "deleted" event.
     *
     * @param  \App\Models\Card  $card
     * @return void
     */
    public function deleted(Card $card)
    {
        //
    }

    /**
     * Handle the Card "restored" event.
     *
     * @param  \App\Models\Card  $card
     * @return void
     */
    public function restored(Card $card)
    {
        //
    }

    /**
     * Handle the Card "force deleted" event.
     *
     * @param  \App\Models\Card  $card
     * @return void
     */
    public function forceDeleted(Card $card)
    {
        //
    }
}
