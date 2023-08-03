<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCalificacionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('calificacions', function (Blueprint $table) {
            $table->id('IdCalificacions');
            $table->unsignedBigInteger('Alumno_id')->constrained('alumnos'); 
            $table->unsignedBigInteger('Materia_id'); //agregamos id materia
            $table->text('comentarios')->nullable();
            $table->double('U1');
            $table->double('U2');
            $table->double('U3');
            $table->double('U4');
            $table->double('U5');
            $table->double('U6');
            $table->double('U7');
            $table->double('U8');
            $table->double('U9');
            $table->double('U10');
            $table->double('U11');
            $table->double('U12');
            $table->double('Calificacion_Final');
            $table->string('Semester'); //relacion semestre
            $table->string('Maestro'); //relacion maestro
            $table->year('Añosemestre');  //relacion año
            $table->string('Carrera_id');  //relacion carrera
            $table->string('turno');  //relacion turno
            $table->string('salon');  //relacion turno

            $table->foreign('Alumno_id') //Con estas lineas se relaciona el id de la tabla carreras
            ->references('IdAlumnos')
            ->on('alumnos')
            ->onDelete('cascade');
            $table->foreign('Materia_id') //Con estas lineas se relaciona el id de la tabla carreras
            ->references('IdMaterias')
            ->on('materias')
            ->onDelete('cascade');
            $table->foreign('Carrera_id') //Con estas lineas se relaciona el id de la tabla carreras
            ->references('IdCarreras')
            ->on('carreras')
            ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('calificacions');
    }
}
