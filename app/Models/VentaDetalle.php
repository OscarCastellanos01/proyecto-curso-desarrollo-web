<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VentaDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'id_venta',
        'id_producto',
        'cantidad_venta_detalle',
        'descuento_venta_detalle',
        'subtotal_venta_detalle',
    ];

    public function venta(){
        return $this->belongsTo(VentaDetalle::class,'id_venta');
    }

    public function producto(){
        return $this->belongsTo(Producto::class,'id_producto');
    }

}
