<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sucursal extends Model
{
    use HasFactory;

    protected $fillable = [
        'nombre_sucursal',
        'id_pais',
        'id_departamento',
        'id_municipio',
        'telefono_sucursal',
        'email_sucursal',
        'id_estado'
    ];

    public function pais()
    {
        return $this->belongsTo(Pais::class,'id_pais');
    }

    public function departamento()
    {
        return $this->belongsTo(Departamento::class,'id_departamento');
    }

    public function municipio()
    {
        return $this->belongsTo(Municipio::class,'id_municipio');
    }

    public function estado()
    {
        return $this->belongsTo(Estado::class,'id_estado');
    }
}
