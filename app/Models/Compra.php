<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Compra extends Model
{
    use HasFactory;
    protected $fillable = [
        'fecha_compra',
        'monto_total_compra',
        'descripccion_compra',
        'referencia',
        'id_metodo_pago',
        'id_estado',
        'id_tipocompra',
        'id_usuario',
        'id_persona',
    ];

    //public function metodo_pago()
    //{
      //  return $this->belongsTo(MetodoPago::class,'id_metodo_pago');     //metodo pago no esta creada
    //}

    public function estado()
    {
        return $this->belongsTo(Estado::class,'id_estado');
    }

    public function tipocompra()
    {
        return $this->belongsTo(Tipocompra::class,'id_tipocompra');
    }

   /* public function usuario()
    {
        return $this->belongsTo(Usuario::class,'id_usuario'); //usuario no esta creado
    }*/

    /*public function persona()
    {
        return $this->belongsTo(Persona::class,'id_persona'); //tbl persona no creada
    }
        */

}
