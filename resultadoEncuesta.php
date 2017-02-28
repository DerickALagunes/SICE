<?php
/*
 * Copyright (C) 2017 USUARIO
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

include 'Plantillas/EncuestaDao.php';
include 'grafica.php';
head("SICE-Resultados");
?>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">SICE</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" >
            <form class="navbar-form navbar-right" action="Plantillas/logout.php" method="POST">
                <div class="form-group">
<?php echo '<input type="text" name="user" value="' . $_SESSION['user'] . '" class="form-control" disabled>'; ?>
                </div>
                <button type="submit" class="btn btn-success">Logout</button>
            </form>
        </div><!--/.navbar-collapse -->
    </div>
</nav>


<div class="jumbotron">

</div>
<div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-12">
            <h1><?php echo $_GET['nombre'] ?>:</h1>
            <hr>
        </div>

<?php
//Parte para imprimir las abiertas :v :
//get arreglo de nombres de las preguntasAbiertas:
$nombrePreguntaAbierta = getNombresAbiertas($_GET['id']);
foreach ($nombrePreguntaAbierta as $pregunta){
    
    echo '<h1>' . $pregunta . '</h1>';
    getResultadosAbiertos($_GET['id'],$pregunta);
}



//Parte de las preguntas de opciones y eso :v :
//get arreglo de id's de preguntas:
$idPreguntas = getPreguntas($_GET['id']);
//get arreglo de nombres de las preguntas:
$nombrePregunta = getNombres($_GET['id']);
//contador para los divs
$contador = 0;


foreach ($idPreguntas as $id) {

    $arreglo = getResultados($_GET['id'], $id);
    $nombre = array_shift($nombrePregunta);

    echo '<h1>' . $nombre . '</h1>';
    echo '<div class="col-md-12" id="grafica' . $contador . '">';
    echo '</div>';

    echo '<script type="text/javascript">';
    grafica($arreglo, "PieChart", $nombre, "cantidad", $nombre, 400, 600, "grafica" . $contador);
    echo '</script>';

    $contador++;
}
?>

    </div>

    <hr>

    <footer>
        <p>MechSolutions</p>
    </footer>
</div> 


<?php
ender();

