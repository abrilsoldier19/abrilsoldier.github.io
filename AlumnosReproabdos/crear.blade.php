@can('crear-rol')
@extends('layouts.app')

@section('content')
<section class="section">
  <div class="section-header">
      <h3 class="page__heading">Crear Alumnos Reprobados</h3>
  </div>
      <div class="section-body">
          <div class="row">
              <div class="col-lg-12">
                  <div class="card">
                      <div class="card-body">
                      @if (session('success'))
                         <div class="alert alert-success">
                             {{ session('success') }}
                         </div>
                      @endif
                      @if (session('error'))
                         <div class="alert alert-danger">
                             {{ session('error') }}
                         </div>
                      @endif
                      <form method="POST" action="{{ route('AlumnosReprobados.store') }}">
                      @if ($errors->any())
                          <div class="alert alert-danger">
                              <ul>
                                  @foreach ($errors->all() as $error)
                                      <li>{{ $error }}</li>
                                  @endforeach
                              </ul>
                          </div>
                      @endif
                              @csrf
                              <div class="form-group">
                                  <label for="Alumno_id">Alumno:</label>
                                  <select class="form-control" id="Alumno_id" name="Alumno_id">
                                    @foreach($alumnos as $alumno)
                                        @if($alumno)
                                              <option value="{{ $alumno->id }}">{{ $alumno->name }}</option>
                                        @endif
                                    @endforeach
                                  </select>
                              </div>   
                                 
                              <div class="form-group">
                                  <label for="Materia_id">Materia:</label>
                                  <select class="form-control" id="Materia_id" name="Materia_id">
                                    @foreach($materias as $materia)
                                        <option value="{{ $materia->IdMaterias }}">{{ $materia->NombreMateria }}</option>
                                    @endforeach
                                  </select>
                              </div>  
                              <div class="form-group">
                                  <label for="Calif_Final_id">Calificacion final:</label>
                                  <select class="form-control" id="Calif_Final_id" name="Calif_Final_id">
                                    @foreach($calffinales as $calffinal)
                                        <option value="{{ $calffinal->IdCalificacions }}">{{ $calffinal->Calificacion_Final }}</option>
                                    @endforeach
                                  </select>
                              </div>
                              <div class="form-group">
                                  <label for="Maestro_id">Maestro:</label>
                                  <select class="form-control" id="Maestro_id" name="Maestro_id">
                                    @foreach($maestros as $maestro)
                                        <option value="{{ $maestro->IdCalificacions  }}">{{ $maestro->IdCalificacions  }}</option>
                                    @endforeach
                                  </select>
                              </div>
                              
                              <div class="form-group">
                                  <label for="Semestre_id">Semestre:</label>
                                  <select class="form-control" id="Semestre_id" name="Semestre_id">
                                    @foreach($semestres as $semestre)
                                        <option value="{{ $semestre->IdSemestres }}">{{ $semestre->Semestre }}</option>
                                    @endforeach
                                  </select>
                              </div>
                             
                              <div class="form-group">
                                  <label for="Año_id">Año semestre:</label>
                                  <select class="form-control" id="Año_id" name="Año_id">
                                    @foreach($añosemestres as $añosemestre)
                                        <option value="{{ $añosemestre->IdAño_semestres }}">{{ $añosemestre->Año }}</option>
                                    @endforeach
                                  </select>
                              </div>
                              <div class="form-group">
                                  <label for="carrera_id">Carrera:</label>
                                  <select class="form-control" id="carrera_id" name="carrera_id">
                                    @foreach($carreras as $carrera)
                                        <option value="{{ $carrera->IdCarreras }}">{{ $carrera->NombreCarrera }}</option>
                                    @endforeach
                                  </select>
                              </div>
                              <div class="form-group">
                                  <label for="turnos">Horario:</label>
                                  <select class="form-control" id="turnos" name="turnos">
                                      <option value="Matutino">Matutino</option>
                                      <option value="Vespertino">Vespertino</option>
                                  </select>
                              </div>
                              <div class="form-group">
                                  <label for="salones">Salon:</label>
                                  <select class="form-control" id="salones" name="salones">
                                      <option value="Salon A">Salon A</option>
                                      <option value="Salon B">Salon B</option>
                                      <option value="Salon C">Salon C</option>
                                      <option value="Salon D">Salon D</option>
                                      <option value="Salon E">Salon E</option>
                                      <option value="Salon F">Salon F</option>
                                      <option value="Salon G">Salon G</option>
                                      <option value="Salon H">Salon H</option>
                                  </select>
                              </div>
                              <button type="submit" class="btn btn-primary">Guardar</button>
                        </form>             
                      </div>
                  </div>
              </div>
          </div>
      </div>
    </section>
@endsection
@endcan