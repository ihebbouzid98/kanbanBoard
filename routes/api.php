<?php

use App\Http\Controllers\CardController;
use App\Http\Controllers\ColumnController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//columns
Route::get('columns', [ColumnController::class, 'index']);
Route::post('columns/{id}', [ColumnController::class, 'update']);
Route::post('columns', [ColumnController::class, 'create']);
Route::delete('columns/{id}', [ColumnController::class, 'delete']);

//cards
Route::get('list-cards', [CardController::class, 'index']);
Route::post('card/{id}', [CardController::class, 'update']);
Route::post('card/move/{id}', [CardController::class, 'move']);
Route::post('card', [CardController::class, 'create']);
Route::delete('card/{id}', [CardController::class, 'delete']);
