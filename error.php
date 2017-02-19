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
head("SICE-Error");
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
    </div>
</nav>
<div class="jumbotron">
    <div class="container">
        <h1>
            ¡Error!
        </h1>
        <div style="text-align: center">
            <img src="imagenes/error.png" alt="" width="40%" />
        </div>
        <br />
        <p>Algo salio mal</p>
        <p><a class="btn btn-primary btn-lg" href="index.php" role="button">Regresar</a></p>
    </div>
</div>

    <footer>
        <p>MechSolutions</p>
    </footer>
</div> 

<?php
ender();



