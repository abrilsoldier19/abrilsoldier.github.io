<?php

use App\Http\Controllers\AlumnoReprobadoController;
use Illuminate\Support\Facades\Route;

//agregamos los siguientes controladores
use App\Http\Controllers\HomeController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\CalificacionController;
use App\Http\Controllers\CarreraController;
use App\Http\Controllers\MateriaController;
use App\Http\Controllers\SemestreController;
use App\Http\Controllers\MaestroController;
use App\Http\Controllers\FormatoController;
use App\Http\Controllers\FormatoAnexo19Controller;
use App\Http\Controllers\FormatoAnexo14Controller;
use App\Http\Controllers\FormatoAnexo19MensualController;
use App\Http\Controllers\ArchivosController;
use App\Http\Controllers\auth\RegisterController;

/*
|--------------------------------------------------------------------------
<?php

use App\Http\Controllers\AlumnoReprobadoController;
use Illuminate\Support\Facades\Route;

//agregamos los siguientes controladores
use App\Http\Controllers\HomeController;
use App\Http\Controllers\homeAlumnoController;
use App\Http\Controllers\homeAdminController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\CalificacionController;
use App\Http\Controllers\CarreraController;
use App\Http\Controllers\MateriaController;
use App\Http\Controllers\SemestreController;
use App\Http\Controllers\MaestroController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () 
{
    $user = Auth::user();
    if (Auth::check())
        if ($user->esAdmin())
            echo "Eres usuario administrador.";
        else
            echo "Eres estudiante.";
        
    return view('/auth/login');
});


Route::get('/Calificaciones', function () {
     return view('/homeAlumno');
 });

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home.index');

//Vista de home alumnos
Route::get('/homeAlumno', [App\Http\Controllers\homeAlumnoController::class, 'index'])->name('homeAlumno.index');

Route::get('/homeAdmin', [App\Http\Controllers\homeAdminController::class, 'index'])->name('homeAdmin.index');

//y creamos un grupo de rutas protegidas para los controladores
Route::group(['middleware' => ['auth']], function() {
    Route::resource('roles', RolController::class);
    Route::resource('usuarios', UsuarioController::class);
    Route::resource('blogs', BlogController::class);
    Route::resource('Carreras', CarreraController::class);

    //ruta register
    Route::resource('auth',RegisterController::class);
    Route::get('/auth/create',[ RegisterController::class, 'create'])->name('auth.create');
    
    //ruta de calificaciones
    Route::resource('Calificaciones', CalificacionController::class);
    Route::get('/Calificaciones/filtrar', [CalificacionController::class, 'filtrar'])->name('Calificaciones.filtrar');
    Route::get('/Calificaciones', [CalificacionController::class, 'index'])->name('Calificaciones.index');
    Route::post('/Calificaciones/create', [CalificacionController::class, 'create'])->name('Calificaciones.create');
    Route::post('/Calificaciones/store', [CalificacionController::class, 'store'])->name('Calificaciones.store');
    Route::post('/Calificaciones/agregarComentarios', [CalificacionController::class, 'agregarComentarios'])->name('Calificaciones.agregarComentarios');
    Route::get('/Calificaciones/{id}/edit', [CalificacionController::class, 'edit'])->name('Calificaciones.edit');
    Route::put('/Calificaciones/{id}/update', [CalificacionController::class, 'update'])->name('Calificaciones.update');
    Route::put('/Calificaciones/{id}/show', [CalificacionController::class, 'show'])->name('Calificaciones.show');
    Route::delete('Calificaciones/{id}', [CalificacionController::class, 'destroy'])->name('Calificaciones.destroy');
    
    //ruta materias
    Route::resource('Materias', MateriaController::class);
    Route::get('/Materias',[ MateriaController::class, 'index'])->name('Materias.index');
    Route::post('/Materias/create', [MateriaController::class, 'create'])->name('Materias.create');
    Route::post('/Materias/store', [MateriaController::class, 'store'])->name('Materias.store');
    Route::get('/Materias/{id}/edit', [MateriaController::class, 'edit'])->name('Materias.edit');
    Route::put('/Materias/{id}/update', [MateriaController::class, 'update'])->name('Materias.update');
    Route::delete('/Materias/{id}', [MateriaController::class, 'destroy'])->name('Materias.destroy');


    Route::resource('Semestres', SemestreController::class);
    Route::resource('AlumnosReprobados', AlumnoReprobadoController::class);

    //ruta de maestros
    Route::resource('Maestros', MaestroController::class);
    Route::get('/Maestros',[ MaestroController::class, 'index'])->name('Maestros.index');
    Route::post('/Maestros/create', [MaestroController::class, 'create'])->name('Maestros.create');
    Route::post('/Maestros/store', [MaestroController::class, 'store'])->name('Maestros.store');
    Route::get('/Maestros/{id}/edit', [MaestroController::class, 'edit'])->name('Maestros.edit');
    Route::put('/Maestros/{id}/update', [MaestroController::class, 'update'])->name('Maestros.update');
    Route::delete('/Maestros/{id}', [MaestroController::class, 'destroy'])->name('Maestros.destroy');

    //ruta de alumnos reprobados
    Route::resource('AlumnosReprobados', AlumnoReprobadoController::class);
    Route::get('/AlumnosReprobados',[ AlumnoReprobadoController::class, 'index'])->name('AlumnosReprobados.index');
    Route::put('/AlumnosReprobados/{id}/show', [AlumnoReprobadoController::class, 'show'])->name('AlumnosReprobados.show');
    Route::delete('AlumnosReprobados/{id}', [AlumnoReprobadoController::class, 'destroy'])->name('AlumnosReprobados.destroy');

    //ruta de formatos
    Route::resource('Formatos', FormatoController::class);
    //Route::get('/Formatos/filtrar',[ FormatoController::class, 'filtrar'])->name('Formatos.filtrar');
    Route::get('/Formatos',[ FormatoController::class, 'index'])->name('Formatos.index');
    //Route::post('/Formatos/guardarAsignaturas',[ FormatoController::class, 'guardarAsignaturas'])->name('Formatos.guardarAsignaturas');
    //Route::post('/Formatos/agregarFilas',[ FormatoController::class, 'agregarFilas'])->name('Formatos.agregarFilas');
    //Route::post('/Formatos/create',[ FormatoController::class, 'create'])->name('Formatos.create');
    //Route::post('/Formatos/store',[ FormatoController::class, 'store'])->name('Formatos.store');
    Route::post('/Formatos/guardarTabla',[ FormatoController::class, 'guardarTabla'])->name('Formatos.guardarTabla');
    Route::post('/Formatos/agregarComentarios', [FormatoController::class, 'agregarComentarios'])->name('Formatos.agregarComentarios');
    Route::get('/Formatos/{id}/edit', [FormatoController::class, 'edit'])->name('Formatos.edit');
    //Route::put('/Formatos/{id}/update', [FormatoController::class, 'update'])->name('Formatos.update');
    //Route::post('/Formatos/actualizarUnidades', [FormatoController::class, 'actualizarUnidades'])->name('Formatos.actualizarUnidades');
    Route::get('/Formatos/{id}/show', [FormatoController::class, 'show'])->name('Formatos.show');
    Route::delete('Formatos/{id}', [FormatoController::class, 'destroy'])->name('Formatos.destroy');

    //ruta de formatos
    Route::resource('FormatoAnexo19', FormatoAnexo19Controller::class);
    Route::get('/FormatoAnexo19/filtrar',[ FormatoAnexo19Controller::class, 'filtrar'])->name('FormatoAnexo19.filtrar');
    Route::get('/FormatoAnexo19',[ FormatoAnexo19Controller::class, 'index'])->name('FormatoAnexo19.index');
    Route::get('/FormatoAnexo19/filtrarAlumnos',[ FormatoAnexo19Controller::class, 'filtrarAlumnos'])->name('FormatoAnexo19.filtrarAlumnos');
    Route::post('/FormatoAnexo19/guardarCheckpoints',[ FormatoAnexo19Controller::class, 'guardarCheckpoints'])->name('FormatoAnexo19.guardarCheckpoints');
    Route::post('/FormatoAnexo19/create',[ FormatoAnexo19Controller::class, 'create'])->name('FormatoAnexo19.create');
    Route::post('/FormatoAnexo19/store',[ FormatoAnexo19Controller::class, 'store'])->name('FormatoAnexo19.store');
    Route::post('/FormatoAnexo19/guardarTabla',[ FormatoAnexo19Controller::class, 'guardarTabla'])->name('FormatoAnexo19.guardarTabla');
    Route::post('FormatoAnexo19/agregarComentarios', [FormatoAnexo19Controller::class, 'agregarComentarios'])->name('FormatoAnexo19.agregarComentarios');
    Route::get('/FormatoAnexo19/{id}/edit', [FormatoAnexo19Controller::class, 'edit'])->name('FormatoAnexo19.edit');
    Route::put('/FormatoAnexo19/{id}/update', [FormatoAnexo19Controller::class, 'update'])->name('FormatoAnexo19.update');
    Route::get('/FormatoAnexo19/{id}/show', [FormatoAnexo19Controller::class, 'show'])->name('FormatoAnexo19.show');
    Route::delete('FormatoAnexo19/{id}', [FormatoAnexo19Controllerr::class, 'destroy'])->name('FormatoAnexo19.destroy');

    //ruta de formatos
    Route::resource('FormatoAnexo19Mensual', FormatoAnexo19MensualController::class);
    Route::get('/FormatoAnexo19Mensual/filtrar',[ FormatoAnexo19MensualController::class, 'filtrar'])->name('FormatoAnexo19Mensual.filtrar');
    Route::get('/FormatoAnexo19Mensual',[ FormatoAnexo19MensualController::class, 'index'])->name('FormatoAnexo19Mensual.index');
    Route::get('/FormatoAnexo19Mensual/filtrarAlumnos',[ FormatoAnexo19MensualController::class, 'filtrarAlumnos'])->name('FormatoAnexo19Mensual.filtrarAlumnos');
    Route::post('/FormatoAnexo19Mensual/guardarCheckpoints',[ FormatoAnexo19MensualController::class, 'guardarCheckpoints'])->name('FormatoAnexo19Mensual.guardarCheckpoints');
    Route::post('/FormatoAnexo19Mensual/create',[ FormatoAnexo19MensualController::class, 'create'])->name('FormatoAnexo19Mensual.create');
    Route::post('/FormatoAnexo19Mensual/store',[ FormatoAnexo19MensualController::class, 'store'])->name('FormatoAnexo19Mensual.store');
    Route::post('/FormatoAnexo19Mensual/guardarTabla',[ FormatoAnexo19MensualController::class, 'guardarTabla'])->name('FormatoAnexo19Mensual.guardarTabla');
    Route::post('FormatoAnexo19Mensual/agregarComentarios', [FormatoAnexo19MensualController::class, 'agregarComentarios'])->name('FormatoAnexo19Mensual.agregarComentarios');
    Route::get('/FormatoAnexo19Mensual/{id}/edit', [FormatoAnexo19MensualController::class, 'edit'])->name('FormatoAnexo19Mensual.edit');
    Route::put('/FormatoAnexo19Mensual/{id}/update', [FormatoAnexo19MensualController::class, 'update'])->name('FormatoAnexo19Mensual.update');
    Route::get('/FormatoAnexo19Mensual/{id}/show', [FormatoAnexo19MensualController::class, 'show'])->name('FormatoAnexo19Mensual.show');
    Route::delete('FormatoAnexo19Mensual/{id}', [FormatoAnexo19MensualControllerr::class, 'destroy'])->name('FormatoAnexo19Mensual.destroy');

    //ruta de formatos
    Route::resource('FormatoAnexo14', FormatoAnexo14Controller::class);
    Route::get('/FormatoAnexo14/filtrar',[ FormatoAnexo14Controller::class, 'filtrar'])->name('FormatoAnexo14.filtrar');
    Route::get('/FormatoAnexo14',[ FormatoAnexo14Controller::class, 'index'])->name('FormatoAnexo14.index');
    //Route::get('/FormatoAnexo14/vista',[ FormatoAnexo14Controller::class, 'vista'])->name('FormatoAnexo14.vista');
    Route::get('/FormatoAnexo14/filtrarAlumnos',[ FormatoAnexo14Controller::class, 'filtrarAlumnos'])->name('FormatoAnexo14.filtrarAlumnos');
    Route::post('/FormatoAnexo14/create',[ FormatoAnexo14Controller::class, 'create'])->name('FormatoAnexo14.create');
    Route::post('/FormatoAnexo14/store',[ FormatoAnexo14Controller::class, 'store'])->name('FormatoAnexo14.store');
    Route::post('FormatoAnexo14/agregarComentarios', [FormatoAnexo14Controller::class, 'agregarComentarios'])->name('FormatoAnexo14.agregarComentarios');
    Route::get('/FormatoAnexo14/{id}/edit', [FormatoAnexo14Controller::class, 'edit'])->name('FormatoAnexo14.edit');
    Route::put('/FormatoAnexo14/{id}/update', [FormatoAnexo14Controller::class, 'update'])->name('FormatoAnexo14.update');
    Route::get('/FormatoAnexo14/{id}/show', [FormatoAnexo14Controller::class, 'show'])->name('FormatoAnexo14.show');
    Route::delete('FormatoAnexo14/{id}', [FormatoAnexo14Controllerr::class, 'destroy'])->name('FormatoAnexo14.destroy');


     //ruta de archivos
     Route::resource('Archivos', ArchivosController::class);
     Route::get('Archivos', [ArchivosController::class, 'index'])->name('Archivos.index');
     //Route::post('/Archivos/upload', [ArchivosController::class, 'upload'])->name('Archivos.upload');
     Route::post('/Archivos/create', [ArchivosController::class, 'create'])->name('Archivos.create');
     Route::post('/Archivos/store',[ ArchivosController::class, 'store'])->name('Archivos.store');
     Route::get('/Archivos/{id}/show', [ArchivosController::class, 'show'])->name('Archivos.show');
     Route::get('/Archivos/edit', [ArchivosController::class, 'edit'])->name('Archivos.edit');
    Route::put('/Archivos/update', [ArchivosController::class, 'update'])->name('Archivos.update');
     Route::get('/Archivos/{id}/descargar', [ArchivosController::class, 'descargar'])->name('Archivos.descargar');
     Route::delete('/Archivos/{id}', [ArchivosController::class, 'destroy'])->name('Archivos.destroy');
     

});

// Rutas para alumnos
Route::get('/homeAlumno', function () {
    return view('homeAlumno');
})->middleware(['auth', 'role:Alumno']);











