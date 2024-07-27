<?php

use App\Http\Controllers\EstadoController;
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
    return view('welcome');
});

// Estados
Route::get('/estados', [EstadoController::class, 'index'])->name('estados.index');
Route::get('/estados/create', [EstadoController::class, 'create'])->name('estado.create');
Route::post('/estados/create/store', [EstadoController::class, 'store'])->name('estado.store');
Route::get('/estados/{estado}/edit', [EstadoController::class, 'edit'])->name('estado.edit');
Route::put('/estados/{estado}/update', [EstadoController::class, 'update'])->name('estado.update');