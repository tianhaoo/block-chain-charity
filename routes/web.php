<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('/index');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/index', 'indexController@index');

Route::get('/give', function () {
    return view('give');
});

Route::get('/who-give', 'indexController@index');

Route::get('/who-need', function () {
    return view('who-need');
});

Route::get('/rank', function () {
    return view('rank');
});

Route::get('/about', function () {
    return view('about');
});
