<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [LoginController::class, 'index'])->name('login');

Route::get('/register', [RegisterController::class, 'index'])->name('register');
Route::get('/dashboard', function () {
    return view('dashboard');
});

Route::post('/register/validate_email',[RegisterController::class, 'validate_email'])->name('register.validate_email');
Route::post('register/new_user',[RegisterController::class, 'new_user'])->name('register.new_user');
