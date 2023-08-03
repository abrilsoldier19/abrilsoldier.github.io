<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Calificacion;
use App\Models\User;
use App\Models\Alumno;
use App\Models\Maestro;
use App\Models\Materia;
use App\Models\Semestre;
use App\Models\Carrera;
use App\Models\AñoSemestre;
use App\Models\AlumnoReprobado;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Arr;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Auth;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;


class AlumnoReprobadoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
{
    $filtroAlumno = $request->input('alummo');
    $filtroCarrera = $request->input('carrera');
    $filtroSemestre = $request->input('Semestre_id');
    $filtroSalon = $request->input('salon');
    $filtroTurno = $request->input('turno');

    $user = Auth::user();


    $alumnoReprobados = DB::table('calificacions')
    ->select(
        'users.name AS nombre_alumno',
        'materias.NombreMateria AS nombre_materia',
        'carreras.NombreCarrera AS nombre_carrera',
        'Semester',
        'Maestro',
        'Añosemestre',
        'calificacions.Carrera_id',
        'turno',
        'salon',
        DB::raw("IF(U1 < 6.9, U1, '') AS U1"),
        DB::raw("IF(U2 < 6.9, U2, '') AS U2"),
        DB::raw("IF(U3 < 6.9, U3, '') AS U3"),
        DB::raw("IF(U4 < 6.9, U4, '') AS U4"),
        DB::raw("IF(U5 < 6.9, U5, '') AS U5"),
        DB::raw("IF(U6 < 6.9, U6, '') AS U6"),
        DB::raw("IF(U7 < 6.9, U7, '') AS U7"),
        DB::raw("IF(U8 < 6.9, U8, '') AS U8"),
        DB::raw("IF(U9 < 6.9, U9, '') AS U9"),
        DB::raw("IF(U10 < 6.9, U10, '') AS U10"),
        DB::raw("IF(U11 < 6.9, U11, '') AS U11"),
        DB::raw("IF(U12 < 6.9, U12, '') AS U12"),
        'Materia_id'
    )
    ->join('users', 'calificacions.Alumno_id', '=', 'users.id')
    ->join('materias', 'calificacions.Materia_id', '=', 'materias.IdMaterias')
    ->join('carreras', 'calificacions.Carrera_id', '=', 'carreras.IdCarreras')
    ->where(function ($query) {
        for ($i = 1; $i <= 12; $i++) {
            $query->orWhere("U{$i}", '<', 6.9);
        }
    })
    ->where(function ($query) {
        $query->where('materias.IdMaterias', 5)->orWhere('materias.IdMaterias', '<>', 5);
    })
    ->where('Calificacion_Final', '<', 6.9);



 // Filtrar calificacion de unidades menores a 6.9 (reprobados)
        
        if ($filtroCarrera) {
            $alumnoReprobados->where('carreras.IdCarreras', $filtroCarrera);
        }
        if ($filtroSemestre) {
            $alumnoReprobados->where('calificacions.Semester', $filtroSemestre);
        }
    
        if ($filtroSalon) {
            $alumnoReprobados->where('calificacions.salon', $filtroSalon);
        }
        if ($filtroTurno) {
            $alumnoReprobados->where('calificacions.turno',$filtroTurno);
        }

        if (auth()->user()->hasRole('Maestro')) {
            // Filtrar solo los alumnos asignados al maestro actual
            $alumnoReprobados->where('calificacions.Maestro', auth()->user()->name);
        }
        $calificaciones = DB::table('calificacions')->get();
        $carreras = DB::table('carreras')->get();
        $semestres = DB::table('semestres')->get();
        $alumnos = $alumnoReprobados->get();

        $alumnoReprobados = $alumnoReprobados->paginate(7);


    return view('AlumnosReprobados.index', compact('semestres','alumnoReprobados', 'filtroAlumno', 'filtroCarrera', 'filtroSemestre', 'filtroSalon', 'filtroTurno', 'carreras', 'alumnos', 'calificaciones'));
}

    public function filtrar(Request $request)
    { 
         $user = Auth::user();

        // Obtener los parámetros de búsqueda del formulario
        $alumno = $request->input('Alumno');
        $semestre = $request->input('Semestre');
        $carrera = $request->input('Carrera');
        $turnos = $request->input('turno');
        $salones = $request->input('salon');

        // Obtener las calificaciones según los filtros
        $query = AlumnoReprobado::query();

        if ($user->hasRole('Maestro')) {
        // Si el usuario es un maestro, mostrar solo las calificaciones asignadas a él
        $query->where('Maestro', $user->name);
        } elseif ($user->hasRole('Alumno')) {
        // Si el usuario es un alumno, mostrar solo las calificaciones asignadas a él
        $query->where('Alumno_id', $user->id);
        }

        if (!empty($alumno)) {
            $query->where('Alumno_id', $alumno);
            }
    
           if (!empty($semestre)) {
            $query->where('Semestre_id', $semestre);
           }
    
           if (!empty($carrera)) {
            $query->where('carrera_id', $carrera);
           }
    
           if (!empty($turno)) {
            $query->where('turnos', $turno);
           }
    
           if (!empty($salon)) {
            $query->where('salones', $salon);
           }


       $alumnoReprobados =  $query->paginate(10);

       return view('AlumnosReprobados.index', compact('alumnoReprobados'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
   
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $alumnoReprobados = AlumnoReprobado::find($id);
        return redirect()->route('AlumnosReprobados.index', compact('alumnoReprobados'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    
}
