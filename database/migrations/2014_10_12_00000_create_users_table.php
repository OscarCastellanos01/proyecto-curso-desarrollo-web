<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('nombre_usuario');
            $table->string('direccion_usuario');
            $table->string('email_usuario')->unique();
            $table->string('telefono_usuario');
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->foreignId('id_estado')->references('id')->on('estados');
            $table->foreignId('id_rol')->references('id')->on('rols');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
