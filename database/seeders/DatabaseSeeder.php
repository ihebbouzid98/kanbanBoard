<?php

namespace Database\Seeders;

use App\Models\Column;
use App\Models\Token;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        Column::seeder();
        Token::seeder();
        \App\Models\Card::factory(10)->create();
    }
}
