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

Route::get('/dashboard/profile', [ProfileController::class, 'show_profile'])->name('dashboard.profile');

Route::get('/dashboard/users', [ProfileController::class, 'show_users'])->name('dashboard.users');
Route::get('/dashboard/users/search_users', [ProfileController::class, 'search_users'])->name('dashboard.users.search_users');
Route::get('/dashboard/users/profile/edit_profile/{id}', [ProfileController::class, 'edit_profile'])->name('dashboard.users.edit_profile');
Route::get('/dashboard/users/profile/view_user/{id}', [ProfileController::class, 'view_user'])->name('dashboard.users.view_user');
Route::post('/dashboard/users/profile/edit_profile/save_changes', [ProfileController::class, 'save_changes'])->name('dashboard.users.save_changes');
Route::post('/dashboard/users/delete', [ProfileController::class, 'delete_user'])->name('dashboard.users.delete');
Route::get('/dashboard/users/edit_profile/change_password/{id}', [ProfileController::class, 'change_password'])->name('dashboard.users.change_password');
Route::post('/dashboard/users/edit_profile/change_password/save_changes', [ProfileController::class, 'save_changes_password'])->name('dashboard.users.change_password.save_changes');
Route::get('/dashboard/users/new_user', [ProfileController::class, 'new_user'])->name('dashboard.users.new_user');
Route::post('/dashboard/users/new_user/save_user', [ProfileController::class, 'save_user'])->name('dashboard.users.save_user');

Route::get('/dashboard/tickets', [ProfileController::class, 'show_tickets'])->name('dashboard.tickets');
Route::get('/dashboard/tickets/show_tickets_filter_search', [ProfileController::class, 'show_tickets_filter_search'])->name('dashboard.show_tickets_filter_search');
Route::get('/dashboard/tickets/create', [ProfileController::class, 'create_ticket'])->name('dashboard.tickets.create');
Route::get('/dashboard/tickets/get_id/{id}', [ProfileController::class, 'get_id'])->name('dashboard.tickets.get_id');
Route::post('/dashboard/tickets/state', [ProfileController::class, 'state'])->name('dashboard.tickets.state');
Route::post('/dashboard/tickets/delete_ticket', [ProfileController::class, 'delete_ticket'])->name('dashboard.tickets.delete_ticket');
Route::get('/dashboard/tickets/ticket_detail/{id}', [ProfileController::class, 'ticket_detail'])->name('dashboard.tickets.ticket_detail');
Route::get('/dashboard/tickets/edit_ticket/{id}', [ProfileController::class, 'edit_ticket'])->name('dashboard.tickets.edit_ticket');
Route::post('/dashboard/tickets/edit_ticket/save_changes_ticket', [ProfileController::class, 'save_changes_ticket'])->name('dashboard.tickets.save_changes_ticket');
Route::post('/dashboard/tickets/create/save_ticket', [ProfileController::class, 'save_ticket'])->name('dashboard.tickets.save_ticket');
Route::post('/dashboard/tickets/comment_create', [ProfileController::class, 'comment_create'])->name('dashboard.tickets.comment_create');
Route::post('/dashboard/tickets/calification_ticket', [ProfileController::class, 'calification_ticket'])->name('dashboard.tickets.calification_ticket');
Route::post('/dashboard/tickets/comment_delete', [ProfileController::class, 'comment_delete'])->name('dashboard.tickets.comment_delete');
Route::get('/recover', [RecoveryPasswordController::class, 'index'])->name('recover');
Route::post('/recover/sendcode',[RecoveryPasswordController::class, 'sendcode'])->name('recover.sendcode');
Route::post('/recover/validecode',[RecoveryPasswordController::class, 'validecode'])->name('recover.validecode');
Route::post('/recover/changepassword',[RecoveryPasswordController::class, 'changepassword'])->name('recover.changepassword');

Route::get('/register', [RegisterController::class, 'index'])->name('register');
Route::post('/register/validate_email',[RegisterController::class, 'validate_email'])->name('register.validate_email');
Route::post('/register/new_user',[RegisterController::class, 'new_user'])->name('register.new_user');

Route::post('/login/logueo',[LoginController::class, 'logueo'])->name('login.logueo');
Route::post('/login/logout',[LoginController::class, 'logout'])->name('login.logout');

Route::get('/dashboard/directories', [ProfileController::class, 'show_directories'])->name('dashboard.directories');
Route::get('/dashboard/directories/search', [ProfileController::class, 'show_directories_search'])->name('dashboard.directories.search');
Route::get('/dashboard/directories/create_repository', [ProfileController::class, 'create_repository'])->name('dashboard.create_repository');
Route::post('/dashboard/directories/create_repository/save_directory', [ProfileController::class, 'save_directory'])->name('dashboard.create_repository.save_directory');
Route::get('/dashboard/directories/view_directory', [ProfileController::class, 'view_directory'])->name('dashboard.view_directory');
Route::get('/dashboard/directories/view_directory/search', [ProfileController::class, 'view_directory_search'])->name('dashboard.view_directory.search');
Route::post('/dashboard/directories/delete_directory', [ProfileController::class, 'delete_directory'])->name('dashboard.delete_directory');
Route::post('/dashboard/directories/delete_file', [ProfileController::class, 'delete_file'])->name('dashboard.delete_file');
Route::get('/dashboard/directories/create_file/{id}', [ProfileController::class, 'create_file'])->name('dashboard.create_file');
Route::post('/dashboard/directories/create_file/save_file', [ProfileController::class, 'save_file'])->name('dashboard.save_file');
Route::get('/dashboard/directories/view_file', [ProfileController::class, 'view_file'])->name('dashboard.view_file');
Route::post('/dashboard/directories/view_file/edit_file', [ProfileController::class, 'edit_file'])->name('dashboard.edit_file');

Route::get('/dashboard/reports', [ProfileController::class, 'show_reports'])->name('dashboard.resports');

Route::get('/dashboard/permissions', [ProfileController::class, 'show_permissions'])->name('dashboard.permissions');
Route::get('/dashboard/permissions/view_permission/{id}', [ProfileController::class, 'view_permission'])->name('dashboard.permissions.view_permission');
Route::get('/dashboard/permissions/create', [ProfileController::class, 'create_permission'])->name('dashboard.permissions.create');
Route::post('/dashboard/permissions/create/save', [ProfileController::class, 'save_permission'])->name('dashboard.permissions.create.save');
Route::post('/dashboard/permissions/delete', [ProfileController::class, 'delete_permission'])->name('dashboard.permissions.delete');
Route::post('/dashboard/permissions/view_permission/approve', [ProfileController::class, 'permission_approve'])->name('dashboard.permissions.view_permission.permission_approve');
Route::post('/dashboard/permissions/view_permission/disapprove', [ProfileController::class, 'permission_disapprove'])->name('dashboard.permissions.view_permission.permission_disapprove');
Route::post('/dashboard/permissions/view_permission/user_exit', [ProfileController::class, 'permission_user_exit'])->name('dashboard.permissions.view_permission.permission_user_exit');
Route::post('/dashboard/permissions/view_permission/user_return', [ProfileController::class, 'permission_user_return'])->name('dashboard.permissions.view_permission.permission_user_return');

Route::get('/dashboard/certificates', [ProfileController::class, 'show_certificates'])->name('dashboard.certificates');
Route::get('/dashboard/certificates/create', [ProfileController::class, 'create_certificate'])->name('dashboard.certificates.create');
Route::post('/dashboard/certificates/create/save', [ProfileController::class, 'save_certificate'])->name('dashboard.certificates.create.save');
Route::post('/dashboard/certificates/delete', [ProfileController::class, 'delete_certificate'])->name('dashboard.certificates.delete');
Route::post('/dashboard/certificates/create/save_rows', [ProfileController::class, 'save_rows_certificate'])->name('dashboard.certificates.create.save_rows');
Route::get('/dashboard/certificates/create/get_users_areas/{id}', [ProfileController::class, 'get_users_areas'])->name('dashboard.certificates.create.get_users_areas');
Route::get('/dashboard/certificates/view_certificate/{id}', [ProfileController::class, 'view_certificate'])->name('dashboard.certificates.view_certificate');
Route::post('/dashboard/certificates/view_certificate/state_certificate', [ProfileController::class, 'state_certificate'])->name('dashboard.certificates.view_certificate.state_certificate');
