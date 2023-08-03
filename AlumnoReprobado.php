<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;


class AlumnoReprobado extends Model
{
    public $timestamps = false;

    protected $primaryKey = 'IdAlumno_reprobados';
    use HasFactory;
    protected $fillable = ['Alumno_id','Materia_id','Calif_Final_id','Maestro_id','Semestre_id','Año_id','carrera_id', 'turnos', 'salones'];

    //Creamos una funcion se relaciona con tabla users
    public function alumnos(){
        return $this->belongsTo(User::class, 'Alumno_id', 'id');
    }
    //Creamos una funcion se relaciona con tabla materias
    public function materias(){
        return $this->belongsTo(materia::class, 'Materia_id', 'IdMaterias');
    }
    //Creamos una funcion se relaciona con tabla calificacion columna calficacion_final
    public function calffinales(){
        return $this->belongsTo(calificacion::class, 'Calif_Final_id', 'IdCalificacions');
    }
     //Creamos una funcion se relaciona con tabla maestros
     public function maestros(){
        return $this->belongsTo(calificacion::class, 'Maestro_id', 'IdCalificacions');
    }
    //Creamos una funcion se relaciona con tabla semestres
    public function semestres(){
        return $this->belongsTo(semestre::class, 'Semestre_id', 'IdSemestres');
    }
    //Creamos una funcion se relaciona con tabla año de curso
    public function añosemestres(){
        return $this->belongsTo(añosemestre::class, 'Año_id', 'IdAño_semestres');
    }
    //Creamos una funcion se relaciona con tabla carreras
    public function carreras(){
        return $this->belongsTo(carrera::class, 'carrera_id', 'IdCarreras');
    }
    public function horarios()
    {
        return $this->belongsTo(Calificacion::class, 'IdCalificacions','turnos');
    }

    public function salones()
    {
        return $this->belongsTo(Calificacion::class, 'IdCalificacions','salones');
    }

    public function formatos()
{
    return $this->hasMany(FormatoAnexo19::class, 'alumno_id');
}
}
