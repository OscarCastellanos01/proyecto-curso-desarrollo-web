@extends('layouts.app')

@section('titulo', 'Estados')

@section('contenido')

    <h1>Crear estado</h1>

    <a href="{{ route('estados.index') }}" class="btn btn-sm btn-warning">Regresar</a>

    @if (session()->has('error'))
        {{ session('error') }}
    @endif

    <form action="{{ route('estado.store') }}" method="POST" novalidate>
        @csrf
        <div>
            <label for="nombre_estado">Nombre del estado</label>
            <input 
                type="text" 
                class="form-control" 
                name="nombre_estado" 
                id="nombre_estado"
                value="{{ old('nombre_estado') }}"
            >
            @error('nombre_estado')
                {{ $message }}
            @enderror
        </div>
        <div>
            <label for="descripcion_estado">Descripcion del estado</label>
            <input 
                type="text" 
                class="form-control" 
                name="descripcion_estado" 
                id="descripcion_estado"
                value="{{ old('nombre_estado') }}"
            >
            @error('descripcion_estado')
                {{ $message }}
            @enderror
        </div>
        <div class="mt-3">
            <button 
                type="submit" 
                class="btn btn-sm btn-success"
            >
                Crear estado
            </button>
        </div>
    </form>
@endsection