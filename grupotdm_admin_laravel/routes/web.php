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
Route::get('/dashboard/users/profile/edit_profile/{id}', [ProfileController::class, 'edit_profile'])->name('dashboard.users.edit_profile');
Route::post('/dashboard/users/profile/edit_profile/save_changes', [ProfileController::class, 'save_changes'])->name('dashboard.users.save_changes');
Route::post('/dashboard/users/delete', [ProfileController::class, 'delete_user'])->name('dashboard.users.delete');
Route::get('/dashboard/users/edit_profile/change_password/{id}', [ProfileController::class, 'change_password'])->name('dashboard.users.change_password');
Route::post('/dashboard/users/edit_profile/change_password/save_changes', [ProfileController::class, 'save_changes_password'])->name('dashboard.users.change_password.save_changes');
Route::get('/dashboard/users/new_user', [ProfileController::class, 'new_user'])->name('dashboard.users.new_user');
Route::post('/dashboard/users/new_user/save_user', [ProfileController::class, 'save_user'])->name('dashboard.users.save_user');

Route::get('/dashboard/tickets', [ProfileController::class, 'show_tickets'])->name('dashboard.tickets');
Route::get('/dashboard/tickets/create', [ProfileController::class, 'create_ticket'])->name('dashboard.tickets.create');
Route::get('/dashboard/tickets/get_id/{id}', [ProfileController::class, 'get_id'])->name('dashboard.tickets.get_id');
Route::post('/dashboard/tickets/state', [ProfileController::class, 'state'])->name('dashboard.tickets.state');

Route::post('/dashboard/tickets/create/save_ticket', [ProfileController::class, 'save_ticket'])->name('dashboard.tickets.save_ticket');
Route::get('/recover', [RecoveryPasswordController::class, 'index'])->name('recover');
Route::post('/recover/sendcode',[RecoveryPasswordController::class, 'sendcode'])->name('recover.sendcode');
Route::post('/recover/validecode',[RecoveryPasswordController::class, 'validecode'])->name('recover.validecode');
Route::post('/recover/changepassword',[RecoveryPasswordController::class, 'changepassword'])->name('recover.changepassword');

Route::get('/register', [RegisterController::class, 'index'])->name('register');
Route::post('/register/validate_email',[RegisterController::class, 'validate_email'])->name('register.validate_email');
Route::post('/register/new_user',[RegisterController::class, 'new_user'])->name('register.new_user');

Route::post('/login/logueo',[LoginController::class, 'logueo'])->name('login.logueo');
Route::post('/login/logout',[LoginController::class, 'logout'])->name('login.logout');
