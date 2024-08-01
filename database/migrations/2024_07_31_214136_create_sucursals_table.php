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
        Schema::create('sucursals', function (Blueprint $table) {
            $table->id();
            $table->string('nombre_sucursal');
            $table->foreignId('id_pais')->references('id')->on('pais');
            $table->foreignId('id_departamento')->references('id')->on('departamentos');
            $table->foreignId('id_municipio')->references('id')->on('municipios');
            $table->string('telefono_sucursal');
            $table->string('email_sucursal');
            $table->foreignId('id_estado')->references('id')->on('estados');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sucursals');
    }
};
