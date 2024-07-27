@extends('layouts.app')

@section('titulo', 'Estados')

@section('contenido')

    <h1>Estados</h1>

    <a 
        href="{{ route('estado.create') }}" 
        class="btn btn-sm btn-primary"
    >
        Crear estado
    </a>

    @if (session()->has('mensaje'))
        {{ session('mensaje') }}
    @endif

    <table class="table">
        <thead>
            <tr>
                <td>Nombre Estado</td>
                <td>Descripcion estado</td>
                <td></td>
            </tr>
        </thead>
        <tbody>
            @forelse ($estados as $estado)
                <tr>
                    <td>{{ $estado->nombre_estado }}</td>
                    <td>{{ $estado->descripcion_estado }}</td>
                    <td>
                        <a 
                            href="{{ route('estado.edit', $estado) }}" 
                            class="btn btn-sm btn-warning"
                        >
                            Editar
                        </a>
                    </td>
                </tr>
            @empty
                <tr>
                    <td 
                        colspan="2" 
                        class="text-center"
                    >
                        No se encontro ningun resultado
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
@endsection