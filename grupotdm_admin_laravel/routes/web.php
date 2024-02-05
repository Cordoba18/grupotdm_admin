<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\CertificatesController;
use App\Http\Controllers\DirectoriesController;
use App\Http\Controllers\InventoriesController;
use App\Http\Controllers\PermissionsController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\ServerController;
use App\Http\Controllers\TicketsController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\RecoveryPasswordController;
use App\Http\Controllers\Mails_Controller;
use App\Http\Controllers\NotificationController;
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

Route::get('/dashboard/users', [UsersController::class, 'show_users'])->name('dashboard.users');
Route::get('/dashboard/users/search_users', [UsersController::class, 'search_users'])->name('dashboard.users.search_users');
Route::get('/dashboard/users/profile/edit_profile/{id}', [UsersController::class, 'edit_profile'])->name('dashboard.users.edit_profile');
Route::get('/dashboard/users/profile/view_user/{id}', [UsersController::class, 'view_user'])->name('dashboard.users.view_user');
Route::post('/dashboard/users/profile/edit_profile/save_changes', [UsersController::class, 'save_changes'])->name('dashboard.users.save_changes');
Route::post('/dashboard/users/delete', [UsersController::class, 'delete_user'])->name('dashboard.users.delete');
Route::get('/dashboard/users/edit_profile/change_password/{id}', [UsersController::class, 'change_password'])->name('dashboard.users.change_password');
Route::post('/dashboard/users/edit_profile/change_password/save_changes', [UsersController::class, 'save_changes_password'])->name('dashboard.users.change_password.save_changes');
Route::get('/dashboard/users/new_user', [UsersController::class, 'new_user'])->name('dashboard.users.new_user');
Route::post('/dashboard/users/new_user/save_user', [UsersController::class, 'save_user'])->name('dashboard.users.save_user');
Route::get('/dashboard/users/profile/edit_profile/getcharges/{id}', [UsersController::class, 'getcharges'])->name('dashboard.users.getcharges');
Route::get('/dashboard/users/profile/edit_profile/getshops/{id}', [UsersController::class, 'getshops'])->name('dashboard.users.getshops');


Route::get('/dashboard/tickets', [TicketsController::class, 'show_tickets'])->name('dashboard.tickets');
Route::get('/dashboard/tickets/show_tickets_filter_search', [TicketsController::class, 'show_tickets_filter_search'])->name('dashboard.show_tickets_filter_search');
Route::get('/dashboard/tickets/create', [TicketsController::class, 'create_ticket'])->name('dashboard.tickets.create');
Route::get('/dashboard/tickets/get_id/{id}', [TicketsController::class, 'get_id'])->name('dashboard.tickets.get_id');
Route::post('/dashboard/tickets/state', [TicketsController::class, 'state'])->name('dashboard.tickets.state');
Route::post('/dashboard/tickets/delete_ticket', [TicketsController::class, 'delete_ticket'])->name('dashboard.tickets.delete_ticket');
Route::get('/dashboard/tickets/ticket_detail/{id}', [TicketsController::class, 'ticket_detail'])->name('dashboard.tickets.ticket_detail');
Route::post('/dashboard/tickets/ticket_detail/writting_ticket', [TicketsController::class, 'writting_ticket'])->name('dashboard.tickets.ticket_detail.writting_ticket');
Route::get('/dashboard/tickets/edit_ticket/{id}', [TicketsController::class, 'edit_ticket'])->name('dashboard.tickets.edit_ticket');
Route::post('/dashboard/tickets/edit_ticket/save_changes_ticket', [TicketsController::class, 'save_changes_ticket'])->name('dashboard.tickets.save_changes_ticket');
Route::post('/dashboard/tickets/notificate_finish_ticket', [TicketsController::class, 'notificate_finish_ticket_mail'])->name('dashboard.tickets.notificate_finish_ticket_mail');
Route::get('/dashboard/tickets/notificate_finish_ticket/finish_ticket_mail', [TicketsController::class, 'finish_ticket_mail'])->name('dashboard.tickets.notificate_finish_ticket.finish_ticket_mail');
Route::post('/dashboard/tickets/create/save_ticket', [TicketsController::class, 'save_ticket'])->name('dashboard.tickets.save_ticket');
Route::post('/dashboard/tickets/comment_create', [TicketsController::class, 'comment_create'])->name('dashboard.tickets.comment_create');
Route::post('/dashboard/tickets/calification_ticket', [TicketsController::class, 'calification_ticket'])->name('dashboard.tickets.calification_ticket');
Route::post('/dashboard/tickets/comment_delete', [TicketsController::class, 'comment_delete'])->name('dashboard.tickets.comment_delete');

Route::get('/recover', [RecoveryPasswordController::class, 'index'])->name('recover');
Route::post('/recover/sendcode',[RecoveryPasswordController::class, 'sendcode'])->name('recover.sendcode');
Route::post('/recover/validecode',[RecoveryPasswordController::class, 'validecode'])->name('recover.validecode');
Route::post('/recover/changepassword',[RecoveryPasswordController::class, 'changepassword'])->name('recover.changepassword');

Route::get('/register', [RegisterController::class, 'index'])->name('register');
Route::post('/register/validate_email',[RegisterController::class, 'validate_email'])->name('register.validate_email');
Route::post('/register/new_user',[RegisterController::class, 'new_user'])->name('register.new_user');

Route::post('/login/logueo',[LoginController::class, 'logueo'])->name('login.logueo');
Route::post('/login/logout',[LoginController::class, 'logout'])->name('login.logout');

Route::get('/dashboard/directories', [DirectoriesController::class, 'show_directories'])->name('dashboard.directories');
Route::get('/dashboard/directories/search', [DirectoriesController::class, 'show_directories_search'])->name('dashboard.directories.search');
Route::get('/dashboard/directories/create_repository', [DirectoriesController::class, 'create_repository'])->name('dashboard.create_repository');
Route::post('/dashboard/directories/create_repository/save_directory', [DirectoriesController::class, 'save_directory'])->name('dashboard.create_repository.save_directory');
Route::get('/dashboard/directories/view_directory', [DirectoriesController::class, 'view_directory'])->name('dashboard.view_directory');
Route::get('/dashboard/directories/view_directory/search', [DirectoriesController::class, 'view_directory_search'])->name('dashboard.view_directory.search');
Route::post('/dashboard/directories/delete_directory', [DirectoriesController::class, 'delete_directory'])->name('dashboard.delete_directory');
Route::post('/dashboard/directories/delete_file', [DirectoriesController::class, 'delete_file'])->name('dashboard.delete_file');
Route::get('/dashboard/directories/create_file/{id}', [DirectoriesController::class, 'create_file'])->name('dashboard.create_file');
Route::post('/dashboard/directories/create_file/save_file', [DirectoriesController::class, 'save_file'])->name('dashboard.save_file');
Route::get('/dashboard/directories/view_file', [DirectoriesController::class, 'view_file'])->name('dashboard.view_file');
Route::post('/dashboard/directories/view_file/edit_file', [DirectoriesController::class, 'edit_file'])->name('dashboard.edit_file');

Route::get('/dashboard/reports', [ReportController::class, 'show_reports'])->name('dashboard.resports');

Route::get('/dashboard/permissions', [PermissionsController::class, 'show_permissions'])->name('dashboard.permissions');
Route::get('/dashboard/permissions/view_permission/{id}', [PermissionsController::class, 'view_permission'])->name('dashboard.permissions.view_permission');
Route::get('/dashboard/permissions/create', [PermissionsController::class, 'create_permission'])->name('dashboard.permissions.create');
Route::post('/dashboard/permissions/create/save', [PermissionsController::class, 'save_permission'])->name('dashboard.permissions.create.save');
Route::post('/dashboard/permissions/delete', [PermissionsController::class, 'delete_permission'])->name('dashboard.permissions.delete');
Route::post('/dashboard/permissions/view_permission/approve', [PermissionsController::class, 'permission_approve'])->name('dashboard.permissions.view_permission.permission_approve');
Route::post('/dashboard/permissions/view_permission/disapprove', [PermissionsController::class, 'permission_disapprove'])->name('dashboard.permissions.view_permission.permission_disapprove');
Route::post('/dashboard/permissions/view_permission/user_exit', [PermissionsController::class, 'permission_user_exit'])->name('dashboard.permissions.view_permission.permission_user_exit');
Route::post('/dashboard/permissions/view_permission/user_return', [PermissionsController::class, 'permission_user_return'])->name('dashboard.permissions.view_permission.permission_user_return');

Route::get('/dashboard/certificates', [CertificatesController::class, 'show_certificates'])->name('dashboard.certificates');
Route::get('/dashboard/certificates/create', [CertificatesController::class, 'create_certificate'])->name('dashboard.certificates.create');
Route::post('/dashboard/certificates/create/save', [CertificatesController::class, 'save_certificate'])->name('dashboard.certificates.create.save');
Route::post('/dashboard/certificates/delete', [CertificatesController::class, 'delete_certificate'])->name('dashboard.certificates.delete');
Route::post('/dashboard/certificates/create/save_rows', [CertificatesController::class, 'save_rows_certificate'])->name('dashboard.certificates.create.save_rows');
Route::get('/dashboard/certificates/create/get_users_areas/{id}', [CertificatesController::class, 'get_users_areas'])->name('dashboard.certificates.create.get_users_areas');
Route::get('/dashboard/certificates/view_certificate/{id}', [CertificatesController::class, 'view_certificate'])->name('dashboard.certificates.view_certificate');
Route::post('/dashboard/certificates/view_certificate/state_certificate', [CertificatesController::class, 'state_certificate'])->name('dashboard.certificates.view_certificate.state_certificate');
Route::get('/dashboard/certificates/create/get_dates_product/{id}', [CertificatesController::class, 'get_dates_product'])->name('dashboard.certificates.create.get_dates_product');
Route::get('/dashboard/certificates/accept_certificate', [CertificatesController::class, 'accept_certificate'])->name('dashboard.certificates.accept_certificate');
Route::get('/dashboard/certificates/view_certificate/reports_certificate/{id}', [CertificatesController::class, 'reports_certificate'])->name('dashboard.certificates.view_certificate.reports_certificate');
Route::post('/dashboard/certificates/view_certificate/reports_certificate/create', [CertificatesController::class, 'reports_certificate_create'])->name('dashboard.certificates.view_certificate.reports_certificate.create');
Route::post('/dashboard/certificates/view_certificate/reports_certificate/delete', [CertificatesController::class, 'reports_certificate_delete'])->name('dashboard.certificates.view_certificate.reports_certificate.delete');
Route::post('/dashboard/certificates/view_certificate/notificate_user_finish_certificate', [CertificatesController::class, 'notificate_user_finish_certificate'])->name('dashboard.certificates.view_certificate.notificate_user_finish_certificate');

Route::get('/dashboard/inventories', [InventoriesController::class, 'show_inventories'])->name('dashboard.inventories');
Route::get('/dashboard/inventories/create', [InventoriesController::class, 'create_product'])->name('dashboard.inventories.create');
Route::post('/dashboard/inventories/create/save', [InventoriesController::class, 'save_product'])->name('dashboard.inventories.create.save');
Route::post('/dashboard/inventories/delete', [InventoriesController::class, 'delete_product'])->name('dashboard.inventories.delete');
Route::get('/dashboard/inventories/view_product/{id}', [InventoriesController::class, 'view_product'])->name('dashboard.inventories.view_product');
Route::get('/dashboard/inventories/view_product/images_product/{id}', [InventoriesController::class, 'images_product'])->name('dashboard.inventories.view_product.images_product');
Route::post('/dashboard/inventories/view_product/images_product/save', [InventoriesController::class, 'save_image_product'])->name('dashboard.inventories.view_product.save_image_product');
Route::post('/dashboard/inventories/view_product/images_product/delete', [InventoriesController::class, 'delete_image_product'])->name('dashboard.inventories.view_product.delete_image_product');
Route::post('/dashboard/inventories/view_product/save_changes', [InventoriesController::class, 'save_changes_view_product'])->name('dashboard.inventories.view_product.save_changes_view_product');
Route::get('/dashboard/inventories/create/get_serie', [InventoriesController::class, 'get_serie'])->name('dashboard.inventories.create.get_serie');


Route::post('/dashboard/get_notifications', [NotificationController::class, 'get_notifications'])->name('dashboard.get_notifications');
Route::post('/dashboard/view_notification', [NotificationController::class, 'view_notification'])->name('dashboard.view_notification');

Route::get('/dashboard/servers', [ServerController::class, 'show_servers'])->name('dashboard.servers');
Route::get('/dashboard/servers/create', [ServerController::class, 'create_server'])->name('dashboard.servers.create');
Route::post('/dashboard/servers/create/save', [ServerController::class, 'save_server'])->name('dashboard.servers.create.save');
Route::get('/dashboard/servers/view/{id}', [ServerController::class, 'view_server'])->name('dashboard.servers.view');
Route::post('/dashboard/servers/view/save_changes', [ServerController::class, 'save_changes_server'])->name('dashboard.servers.view.save_changes');
Route::post('/dashboard/servers/view/change_state', [ServerController::class, 'change_state_server'])->name('dashboard.servers.view.change_state_server');
Route::post('/dashboard/servers/view/add_sql_licenses_server', [ServerController::class, 'add_sql_licenses_server'])->name('dashboard.servers.view.add_sql_licenses_server');
Route::post('/dashboard/servers/view/delete_sql_licenses_server', [ServerController::class, 'delete_sql_licenses_server'])->name('dashboard.servers.view.delete_sql_licenses_server');

Route::get('/dashboard/servers/sql_licenses', [ServerController::class, 'show_sql_licenses'])->name('dashboard.servers.sql_licenses');
Route::get('/dashboard/servers/sql_licenses/create', [ServerController::class, 'create_sql_licenses'])->name('dashboard.servers.sql_licenses.create');
Route::post('/dashboard/servers/sql_licenses/create/save', [ServerController::class, 'save_sql_licenses'])->name('dashboard.servers.sql_licenses.create.save');
Route::post('/dashboard/servers/sql_licenses/delete', [ServerController::class, 'delete_sql_licenses'])->name('dashboard.servers.sql_licenses.delete');


Route::get('/dashboard/servers/ip_linux_directions', [ServerController::class, 'show_ip_linux_directions'])->name('dashboard.servers.ip_linux_directions');
Route::get('/dashboard/servers/ip_linux_directions/create', [ServerController::class, 'create_ip_linux_directions'])->name('dashboard.servers.ip_linux_directions.create_ip_linux_directions');
