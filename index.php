<!DOCTYPE html>
<?php
/*
 * Copyright (C) 2017 AXEL LAGUNES
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

include './Plantillas/tools.php';
head("SICE-Inicio");
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
        <?php        
        echo '<div id="navbar" class="navbar-collapse collapse">';       
        if (isset($_SESSION['user'])) {       
            echo '<form class="navbar-form navbar-right" action="Plantillas/logout.php" method="POST">';
            echo '<div class="form-group">';
            echo '<input type="text" name="user" value="'.$_SESSION['user'].'" class="form-control" disabled>';
            echo '</div>';
            echo '<button type="submit" class="btn btn-success">Logout</button>';
        }else{          
            echo '<form class="navbar-form navbar-right" action="Plantillas/login.php" method="POST">';
            echo '<div class="form-group">';
            echo '<input type="text" name="user" placeholder="Correo" class="form-control">';
            echo '</div>';
            echo '<div class="form-group">';
            echo '<input type="password" name="contra" placeholder="Contraseña" class="form-control">';
            echo '</div>';
            echo '<button type="submit" class="btn btn-success">Login</button>';           
        }     
        echo '</form>';
        echo '</div><!--/.navbar-collapse -->';
        ?>
  
    </div>
</nav>



<div class="jumbotron">
    <div class="container">
        <h1>
            ¡Bienvenido a SICE!
        </h1>
        <div style="text-align: center">
            <img src="imagenes/worldmap-dotted.png" alt="" width="60%" />
        </div>
        <br />
        <p>Este sistema permite la creación y aplicación de encuestas, para comenzar registrate aquí:</p>
        <p><a class="btn btn-primary btn-lg" href="registro.php" role="button">Registrarme</a></p>
    </div>
</div>

<div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-12">
            <h4>
                Caracteristicas de SICE
            </h4>
            <hr>
        </div>
        <div class="col-md-4">
            <img src="imagenes/encuestas.png" alt="" width="100%"/>
            <h2>Participa en encuestas</h2>
            <p>Participa en las encuestas que tu quieras, navega en tu cuenta para ver las encuestas que te interesen y contestalas para ayudar a la investigación del encuestador.</p>
        </div>
        <div class="col-md-4">
            <img src="imagenes/crear.png" alt="" width="76%"/>
            <h2>Crea encuestas</h2>
            <p>Con una cuenta de administrador de encuestas podrás crear tus propias encuestas, no hay limite en la cantidad de preguntas y estas pueden ser de cualquier tipo(abiertas, opción múltiple, selección múltiple). </p>
            <p><a class="btn btn-default" href="registro.php" role="button">Registrarse &raquo;</a></p>
        </div>
        <div class="col-md-4">
            <img src="imagenes/grafica.png" alt="" width="100%"/>
            <h2>Resultados estadísticos</h2>
            <p>Ve los resultados de tus encuestas en forma de estadísticas con gráficas y datos útiles. </p>
        </div>
    </div>

    <hr>

    <footer>
        <p>MechSolutions</p>
    </footer>
</div> 

<?php
ender();
