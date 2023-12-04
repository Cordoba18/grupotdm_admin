<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\RecoveryPasswordController;
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

Route::get('/', function () {
    return redirect()->route('login');
})->name('home');

Route::get('/login', [LoginController::class, 'index'])->name('login');


Route::get('/dashboard', [ProfileController::class, 'index'])->name('dashboard');
Route::get('/dashboard/users', [ProfileController::class, 'show_users'])->name('dashboard.users');
Route::get('/dashboard/tickets', [ProfileController::class, 'show_tickets'])->name('dashboard.tickets');
Route::get('/dashboard/tickets/create', [ProfileController::class, 'create_ticket'])->name('dashboard.tickets.create');

Route::post('/dashboard/users/delete', [ProfileController::class, 'delete_user'])->name('dashboard.users.delete');
Route::get('/recover', [RecoveryPasswordController::class, 'index'])->name('recover');
Route::post('/recover/sendcode',[RecoveryPasswordController::class, 'sendcode'])->name('recover.sendcode');
Route::post('/recover/validecode',[RecoveryPasswordController::class, 'validecode'])->name('recover.validecode');
Route::post('/recover/changepassword',[RecoveryPasswordController::class, 'changepassword'])->name('recover.changepassword');

Route::get('/register', [RegisterController::class, 'index'])->name('register');
Route::post('/register/validate_email',[RegisterController::class, 'validate_email'])->name('register.validate_email');
Route::post('/register/new_user',[RegisterController::class, 'new_user'])->name('register.new_user');

Route::post('/login/logueo',[LoginController::class, 'logueo'])->name('login.logueo');
Route::post('/login/logout',[LoginController::class, 'logout'])->name('login.logout');
