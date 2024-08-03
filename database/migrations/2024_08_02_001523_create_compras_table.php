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
        Schema::create('compras', function (Blueprint $table) {
            $table->id();
            $table->date('fecha_compra');
            $table->decimal('monto_total_compra',10,2);
            $table->string('descripccion_compra');
            $table->string('referencia');
            $table->foreignId('id_metodo_pago')->references('id')->on('metodo_pagos');
            $table->foreignId('id_estado')->references('id')->on('estados');
            $table->foreignId('id_tipocompra')->references('id')->on('tipo_compras');
            //$table->foreignId('id_usuario')->references('id')->on('usuarios');   //no esta creada la tb usuario
            //$table->foreignId('id_persona')->references('id')->on('personas'); //no esta creada la tbl persona
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('compras');
    }
};
