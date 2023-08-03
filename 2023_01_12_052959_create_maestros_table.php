<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMaestrosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('maestros', function (Blueprint $table) {
            $table->id('IdMaestros');
            $table->string('NombreMaestro');
            $table->string('Correos'); 
            $table->string('carrera_id'); //agregamos el campo donde se visualizara la relacion
            $table->timestamps();
            
            $table->foreign('carrera_id') //Con estas lineas se relaciona el id de la tabla carreras
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
        Schema::dropIfExists('maestros');
    }
}
