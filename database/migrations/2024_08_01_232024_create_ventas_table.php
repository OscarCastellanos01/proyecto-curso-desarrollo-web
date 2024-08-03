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
        Schema::create('ventas', function (Blueprint $table) {
            $table->id();
            $table->string('documento_venta');
            $table->decimal('total_venta');
            $table->date('fecha_venta');
            $table->date('fecha_entrega');
            $table->foreignId('id_tipo_documento')->references('id')->on('tipo_documentos');
            //$table->foreignId('id_medio_pago')->references('id')->on('metodo_pagos');
            //$table->foreignId('id_usuario')->references('id')->on('usuarios'); //tbl no creadas usuarios, personas, metodo pagos
            //$table->foreignId('id_persona')->references('id')->on('personas');
            $table->foreignId('id_tipoventa')->references('id')->on('tipo_ventas');

            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ventas');
    }
};
