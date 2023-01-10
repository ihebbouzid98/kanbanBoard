<?php

namespace App\Http\Controllers;

use App\Models\Token;
use Illuminate\Http\Request;

class TokenController extends Controller
{
    public function verify($token)
    {
        return empty(Token::where('token', $token)->where('dead_line', '>=', now())->first()) ? false : true;
    }
}
