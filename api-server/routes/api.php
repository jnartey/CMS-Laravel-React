<?php

use Illuminate\Http\Request;

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

//Register User
//Route::post('register', 'API\RegisterController@register');

//Login
//Route::post('login', 'API\LoginController@login');


// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::post('login', 'API\LoginController@login');
Route::post('register', 'API\RegisterController@register');
Route::get('logout', 'API\LoginController@logout');

Route::group([
    'middleware' => 'auth:api'
], function() {
    //Users
    Route::get('users', 'API\UserController@index');
    Route::get('user/{id}', 'API\UserController@show');
    Route::get('roles', 'API\UserController@getRoles');
    Route::post('adduser', 'API\UserController@store');

    Route::put('user/{id}', 'API\UserController@update');
    Route::delete('delete-user/{user}', 'API\UserController@delete');
});
