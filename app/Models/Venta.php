<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{
    use HasFactory;

    protected $fillable = [
        'documento_venta',
        'total_venta',
        'fecha_venta',
        'fecha_entrega',
        'id_tipo_documento',
        'id_medio_pago',
        'id_usuario',
        'id_persona',
        'id_tipoventa',
    ];


    public function tipo_documento(){
        return $this->belongsTo( TipoDocumento::class, 'id_tipo_documento');
    }

    //public function metodo_pago(){
      //  return $this->belongsTo(MetodoPago::class,'id_medio_pago');
    //}

    /*public function usuario(){
        return $this->belongsTo(User::class,'id_usuario');         //tablas aun no creadas por karin
    }*/

    //public function persona(){
      //  return $this->belongsTo(Persona::class,'id_persona');
    //}

    public function tipoventa(){
        return $this->belongsTo(TipoVenta::class,'id_tipoventa');
    }

}
