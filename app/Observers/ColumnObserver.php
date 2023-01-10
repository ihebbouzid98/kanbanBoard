<?php

namespace App\Observers;

use App\Models\Card;
use App\Models\Column;

class ColumnObserver
{
    /**
     * Handle the Column "created" event.
     *
     * @param  \App\Models\Column  $column
     * @return void
     */
    public function created(Column $column)
    {
        //
    }

    /**
     * Handle the Column "updated" event.
     *
     * @param  \App\Models\Column  $column
     * @return void
     */
    public function updated(Column $column)
    {
        //
    }

    /**
     * Handle the Column "deleted" event.
     *
     * @param  \App\Models\Column  $column
     * @return void
     */
    public function deleted(Column $column)
    {
        $cards = Card::where('column_id', $column->id)->get();
        foreach ($cards as $card) {
            $card->delete();
        }
    }

    /**
     * Handle the Column "restored" event.
     *
     * @param  \App\Models\Column  $column
     * @return void
     */
    public function restored(Column $column)
    {
        //
    }

    /**
     * Handle the Column "force deleted" event.
     *
     * @param  \App\Models\Column  $column
     * @return void
     */
    public function forceDeleted(Column $column)
    {
        //
    }
}
