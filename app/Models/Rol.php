<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rol extends Model
{
    use HasFactory;

    protected $table = [
        'nombre_rol',
        'descripcion_rol',
        'id_estado'
    ];

    public function estado()
    {
        return $this->belongsTo(Estado::class,'id_estado');
    }
}
