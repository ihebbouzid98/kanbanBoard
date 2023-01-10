<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Token extends Model
{
    use HasFactory;
    protected $fillable = [
        'token',
        'dead_line'
    ];

    static function seeder()
    {
        if (empty(Token::where('token', 'testToken')->first())) {
            Token::create(['token' => 'testToken', 'dead_line' => Carbon::now()->addYear(1)]);
        }
    }
}
