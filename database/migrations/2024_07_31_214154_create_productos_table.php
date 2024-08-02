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
        Schema::create('productos', function (Blueprint $table) {
            $table->id();
            $table->string('sku_producto');
            $table->string('cod_barra');
            $table->string('nombre_producto');
            $table->string('descripcion_producto')->nullable();
            $table->date('vencimiento_producto')->nullable();
            $table->decimal('precio_compra_producto', 10, 2);
            $table->decimal('precio_venta_producto', 10, 2);
            $table->foreignId('id_marca')->references('id')->on('marcas');
            $table->foreignId('id_categoria')->references('id')->on('categorias');
            $table->foreignId('id_estado')->references('id')->on('estados');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('productos');
    }
};
