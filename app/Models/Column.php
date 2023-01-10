<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Column extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = [
        'name'
    ];

    public function cards()
    {
        return $this->hasMany(Card::class)->orderBy('order');
    }

    static function seeder()
    {
        $columns = [
            'To Do',
            'In Progress',
            'Done'
        ];
        foreach ($columns as  $column) {
            if (empty(Column::where('name', $column)->first())) {
                Column::create(['name' => $column]);
            }
        }
    }
}
