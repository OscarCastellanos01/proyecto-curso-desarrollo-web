<?php

namespace App\Http\Controllers;

use App\Models\Estado;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EstadoController extends Controller
{
    public function index()
    {
        $estados = Estado::all();

        return view('estados.index', [
            'estados' => $estados
        ]);
    }

    public function create()
    {
        return view('estados.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'nombre_estado' => 'required|max:25',
            'descripcion_estado' => 'required'
        ]);

        DB::beginTransaction();

        try {
            Estado::create([
                'nombre_estado' => $request->nombre_estado,
                'descripcion_estado' => $request->descripcion_estado
            ]);

            DB::commit();

            session()->flash('mensaje', 'Estado creado correctamente.');

            return to_route('estados.index');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', 'Error al crear el estado: ' . $th);
        }
    }

    public function edit(Estado $estado)
    {
        return view('estados.edit', [
            'estado' => $estado
        ]);
    }

    public function update(Request $request, Estado $estado)
    {
        $this->validate($request, [
            'nombre_estado' => 'required|max:25',
            'descripcion_estado' => 'required'
        ]);

        DB::beginTransaction();

        try {
            $estado->update([
                'nombre_estado' => $request->nombre_estado,
                'descripcion_estado' => $request->descripcion_estado
            ]);

            DB::commit();

            session()->flash('mensaje', 'Estado editado correctamente.');

            return to_route('estados.index');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', 'Error al editar el estado: ' . $th);
        }
    }
}
