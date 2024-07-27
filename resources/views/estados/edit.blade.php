@extends('layouts.app')

@section('titulo', 'Estados')

@section('contenido')

    <h1>Editar estado</h1>

    <a href="{{ route('estados.index') }}" class="btn btn-sm btn-warning">Regresar</a>

    @if (session()->has('error'))
        {{ session('error') }}
    @endif

    <form action="{{ route('estado.update', $estado) }}" method="POST" novalidate>
        @csrf
        @method('PUT')
        <div>
            <label for="nombre_estado">Nombre del estado</label>
            <input 
                type="text" 
                class="form-control" 
                name="nombre_estado" 
                id="nombre_estado"
                value="{{ $estado->nombre_estado }}"
            >
            <x-input-error :messages="$errors->get('nombre_estado')" class="mt-2" />
        </div>
        <div>
            <label for="descripcion_estado">Descripcion del estado</label>
            <input 
                type="text" 
                class="form-control" 
                name="descripcion_estado" 
                id="descripcion_estado"
                value="{{ $estado->descripcion_estado }}"
            >
            <x-input-error :messages="$errors->get('descripcion_estado')" class="mt-2" />
        </div>
        <div class="mt-3">
            <button 
                type="submit" 
                class="btn btn-sm btn-success"
            >
                Editar estado
            </button>
        </div>
    </form>
@endsection