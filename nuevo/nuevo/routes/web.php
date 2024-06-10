<?php

use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;

Route::get('/login', function () {
    return view('auth.login');
});


Route::get('/', [HomeController::class, 'index'])->name('home');
