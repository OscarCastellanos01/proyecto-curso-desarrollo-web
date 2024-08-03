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
        Schema::create('venta__detalles', function (Blueprint $table) {
            $table->id();
            $table->int('cantidad_venta_detalle');
            $table->decimal('descuento_venta_detalle', 10, 2);
            $table->decimal('subtotal_venta_detalle',10,2);
            $table->foreignId('id_venta')->references('id')->on('ventas');
            $table->foreignId('id_producto')->references('id')->on('productos');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('venta__detalles');
    }
};
