<?php

/*
|--------------------------------------------------------------------------
| Routes File
|--------------------------------------------------------------------------
|
| Here is where you will register all of the routes in an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

//Route::get('/', function () {
//    return view('index/index');
//});


/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/

Route::group(['middleware' => ['web']], function () {
    Route::any('logout',['uses'=>'UserController@logout']);
    Route::any('login',['uses'=>'UserController@login']);
    Route::any('createuser',['uses'=>'UserController@createUser']);
    Route::any('createcontent',['uses'=>'TextsController@createContent']);
    Route::any('createcomment',['uses'=>'CommentController@createComment']);
    Route::any('updatecontent/{id?}',['uses'=>'TextsController@updateContent']);
    Route::any('deletecontent/{id}',['uses'=>'TextsController@deleteContent']);
    Route::any('/{id?}',['uses'=>'TextsController@showLists']);
    Route::any('showcontent/{id?}',['uses'=>'TextsController@showContent']);
});
