# abrilsoldier.github.io


@can('crear-rol')

@extends('layouts.app')

@section('content')

<section class="section">
    <div class="section-header">
        <h3 class="page__heading">Alumnos Reprobados</h3>
            <div class="card-body">
                <h4>Bienvenido . {{ auth()->user()->name }} {{ auth()->user()->email }} </h4>
            </div>
    </div>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0/css/select2.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0/js/select2.min.js"></script>
  
    </head>
  <form method="GET" action="{{ route('AlumnosReprobados.index') }}">
    <div class="container">
        <div class="form-row justify-content-center">
            <div class="col-lg-3">
                <select name="carrera" id="carrera" class="form-control custom-select no-print select2">
                <option value="">Carreras</option>
                @foreach ($carreras as $carrera)
                    <option value="{{ $carrera->IdCarreras }}" {{ $filtroCarrera == $carrera->IdCarreras ? 'selected' : '' }}>{{ $carrera->NombreCarrera }}</option>
                @endforeach
                </select>
            </div>
        
            <div class="col-lg-3">
                <select name="Semestre_id" class="form-control custom-select no-print select2">
                <option value="">Semestres</option>
                    @foreach ($semestres as $semestre)
                        <option value="{{ $semestre->Semestre }}">{{ $semestre->Semestre}}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-lg-3">
                <select style="width: 100px" name="turno" class="form-control custom-select no-print select2">
                    <option value="">Turnos</option>
                    <option value="Matutino">Matutino</option>
                    <option value="Vespertino">Vespertino</option>
                </select>
            </div>
            <div class="col-lg-3">
                <select style="width: 100px" name="salon" id="highlight-select" class="form-control custom-select no-print select2" data-live-search="true">
                    <option value="Salones">Salones</option>
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
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <button type="submit" class="btn btn-primary">Filtrar</button>
            <button id="btnPrint" onclick="printTable()" class="btn btn-dark">Imprimir tabla</button>
        </div>
    </div>
</form>
      <div class="section-body">
          <div class="row">
              <div class="col-lg-12">
                  <div class="card">
                      <div class="card-body">
                            <table id="tabla_datos" class="table table-striped mt-2">
                                <tr style="background-color:#18316B"> 
                                     <th style="color:#fff;">Alumno</th> <!--Nombre de columnas -->
                                     <th style="color:#fff;">Materia</th>
                                     <th style="color:#fff;">U1</th>
                                     <th style="color:#fff;">U2</th>
                                     <th style="color:#fff;">U3</th>
                                     <th style="color:#fff;">U4</th>
                                     <th style="color:#fff;">U5</th>
                                     <th style="color:#fff;">U6</th>
                                     <th style="color:#fff;">U7</th>
                                     <th style="color:#fff;">U8</th>
                                     <th style="color:#fff;">U9</th>
                                     <th style="color:#fff;">U10</th>
                                     <th style="color:#fff;">U11</th>
                                     <th style="color:#fff;">U12</th>
                                     <th style="color:#fff;">Maestro</th>
                                     <th style="color:#fff;">Semestre</th>
                                     <th style="color:#fff;">Año Semestre</th>
                                     <th style="color:#fff;">Carrera</th>
                                     <th style="color:#fff;">Turno</th>
                                     <th style="color:#fff;">Salon</th>
                                </tr>
                                <tbody>
                                    @foreach ($alumnoReprobados as $alumnoReprobado) {{--foreach a nivel de vista  --}}
                                    
                                    <tr>
                                        <td>{{ $alumnoReprobado->nombre_alumno }}</td>
                                        <td>{{ $alumnoReprobado->nombre_materia }}</td>
                                            <td>{{ $alumnoReprobado->U1 }}</td>
                                            <td>{{ $alumnoReprobado->U2 }}</td>
                                            <td>{{ $alumnoReprobado->U3 }}</td>
                                            <td>{{ $alumnoReprobado->U4 }}</td>
                                            <td>{{ $alumnoReprobado->U5 }}</td>
                                            <td>{{ $alumnoReprobado->U6 }}</td>
                                            <td>{{ $alumnoReprobado->U7 }}</td>
                                            <td>{{ $alumnoReprobado->U8 }}</td>
                                            <td>{{ $alumnoReprobado->U9 }}</td>
                                            <td>{{ $alumnoReprobado->U10}}</td>
                                            <td>{{ $alumnoReprobado->U11 }}</td>
                                            <td>{{ $alumnoReprobado->U12 }}</td>
                                        
                                        <td>{{ $alumnoReprobado->Maestro}}</td>
                                        <td>{{ $alumnoReprobado->Semester  }}</td>
                                        <td>{{ $alumnoReprobado->Añosemestre }}</td>
                                        <td>{{ $alumnoReprobado->nombre_carrera }}</td>
                                        <td>{{ $alumnoReprobado->turno }}</td>
                                        <td>{{ $alumnoReprobado->salon }}</td>
                                        
                                    </tr>{{-- y las tr son para las filas --}}
                                    
                                    @endforeach
                                </tbody>
                            </table> 
                            @section('scripts')
                            <script>
                                function printTable()
                                {
                                    var table = document.getElementById("tabla_datos");

                                    var printWindow = document.createElement('iframe');
                                    printWindow.style.position = 'absolute';
                                    printWindow.style.top = '-10000px';
                                    printWindow.style.left = '-10000px';

                                    document.body.appendChild(printWindow);

                                    printWindow.contentDocument.write('<html><head><title>Imprimir tabla</title>');
                                    printWindow.contentDocument.write('</head><body>');
                                    printWindow.contentDocument.write('<style media="print">.no-print { display: none; }</style>');
                                    printWindow.contentDocument.write(table.outerHTML);
                                    printWindow.contentDocument.write('</body></html>');
    
                                    printWindow.contentWindow.print();

                                    setTimeout(function () 
                                    { 
                                        document.body.removeChild(printWindow);
                                    }, 1000);
                                }
                                $(document).ready(function() {
      $('#highlight-select').select2();
    });
                            </script>
                            @endsection
                            <style>

.select2-search__field {
    font-family: Century Gothic, sans-serif; 
    font-size: 14px;
    border-radius: 10px;
}

.select2-results__option {
    background-color: white; 
    color: black; 
    font-family: Century Gothic, sans-serif; 
    padding: 8px;
    
    font-size: 14px;
}

.select2-results__option:hover {
    background-color: pink; 
    font-size: 14px;
    
}


.select2-results__option[aria-selected="true"] {
      color: purple;
    }
    
.select2-container--default .select2-selection--single .select2-selection__rendered{
    color: black;
    font-family: 'Century Gothic', sans-serif;
    background-color: #ABE3FF;
    transition: border-color 0.3s ease;
    border: 2px solid white; 
    border-radius: 10px;
    font-size: 14px;
    border-radius: 11px;
  box-shadow: 2px 2px 4px ;
  height: 50px;
  width: 100% !important; 
  margin-bottom: 10px;
  
    
}

.select2-container--default .select2-selection--single .select2-selection__rendered:hover {
    color: blue;
    background-color: white; 
    font-family: 'Century Gothic', sans-serif;
    border: 2px solid blue;
    transition: border-color 0.3s ease;
    border-radius: 10px;
    font-size: 14px;
    box-shadow: 10px black;
    width: 100% !important; 
    margin-bottom: 10px;
}
.form-row.justify-content-center .col-lg-3 {
    margin-bottom: 26px;
}

.container {
        display: flex;
        align-items: center;
        width: 600px;
    }
    .form-row.justify-content-center {
        display: flex;
    }

    /* Add some spacing between the select elements */
    .form-row.justify-content-center > div {
        margin-right: 40px; /* Adjust this value as needed to control the spacing */
    }

    /* Remove the right margin from the last select element to avoid unnecessary spacing */
    .form-row.justify-content-center > div:last-child {
        margin-right: 40;
    }
                
                                
                            </style>
                            <div class="pagination justify-content-end">
                            {!! $alumnoReprobados->links() !!}
                          </div>  
                          <div class="mt-3">
                            <button type="button" class="btn btn-primary" onclick="window.location='{{ route(AlumnosReprobados.index') }}'">Anexo 15 Casos Especiales 2021</button>
                            <button type="button" class="btn btn-primary" onclick="window.location='{{ route('FormatoAnexo19.index') }}'">Anexo 19 Reporte semestral</button>
                            <button type="button" class="btn btn-primary" onclick="window.location='{{ route('FormatoAnexo19Mensual.index') }}'">Anexo 19 Reporte mensual</button>
                            <button type="button" class="btn btn-primary" onclick="window.location='{{ route('Archivos.index') }}'">Reportes alumnos Anexo 14</button>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
    </section>
@endsection
@endcan
