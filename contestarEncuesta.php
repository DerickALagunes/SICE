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

include './Plantillas/EncuestaDao.php';
head("SICE-Contestar");

if(!isset($_GET['id'])) {
	header("Location: ./error.php");
}

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
        <div id="navbar" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right" action="Plantillas/logout.php" method="POST">
                <div class="form-group">
                    <?php echo '<input type="text" name="user" value="' . $_SESSION['user'] . '" class="form-control" disabled>';?>
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
            <h1><?php echo $_GET['nombre'];?></h1>
            <hr>
        </div>
        <div class="col-md-12">
        		<form class="form-horizontal" method="GET" action="Plantillas/registrarRespuestas.php"><!-- manejar meter resultados a bd -->
					<fieldset>
					<!-- Form Name -->
						<legend>Contesta:</legend>
					
        				<?php 
							popularPreguntas($_GET['id']);        		
        				?>		        
        		        	<!--boton-->
        		        	<br/>
		            <div style="text-align: center">
                		<button id="reg" name="reg" class="btn btn-success">Registrar pregunta</button>
                		<br/>
               		<br/>
                		<br/>
            		</div>
        			</fieldset>	
				</form>
        </div>
    </div>

    <hr>

    <footer>
        <p>MechSolutions</p>
    </footer>
</div> 


<?php
ender();

