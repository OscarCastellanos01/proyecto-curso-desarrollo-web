<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Municipio extends Model
{
    use HasFactory;

    protected $fillable = [
        'nombre_municipio',
        'id_departamento'
    ];

    public function departamento()
    {
        return $this->belongsTo(Municipio::class,'id_departamento');
    }
}
