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

include 'tools.php';

function newPoll($idUser, $nombre) {

    $con = mysqli_connect('localhost', 'php', 'php', 'encuestas') or die('Connection failed' . mysqli_error());

    $query = "CALL nuevaEncuesta('$idUser','$nombre');";

    if (mysqli_query($con, $query)) {
        $con->close();
        return "done";
    } else {
        $con->close();
        return "error";
    }
}

function getPollId($nombreEncuesta, $userId) {

    $mysqli = new mysqli('localhost', 'php', 'php', 'encuestas');

    $call = $mysqli->prepare('CALL getEncuestaId(?, ?, @idEnc)');
    $call->bind_param('si', $nombreEncuesta, $userId);
    $call->execute();

    $select = $mysqli->query('SELECT @idEnc');
    $result = $select->fetch_assoc();

    $encuestaId = $result['@idEnc'];

    $mysqli->close();
    return $encuestaId;
}

function getQuestionId($idEncuesta, $descripcion) {

    $mysqli = new mysqli('localhost', 'php', 'php', 'encuestas');

    $call = $mysqli->prepare('CALL getPreguntaId(?, ?, @id)');
    $call->bind_param('is', $idEncuesta, $descripcion);
    $call->execute();

    $select = $mysqli->query('SELECT @id');
    $result = $select->fetch_assoc();

    $preguntaId = $result['@id'];

    $mysqli->close();
    return $preguntaId;
}

function setPregunta($idEncuesta, $tipoPregunta, $numero, $descripcion) {
    $con = mysqli_connect('localhost', 'php', 'php', 'encuestas') or die('Connection failed' . mysqli_error());
    $query = "CALL nuevaPregunta('$idEncuesta','$tipoPregunta','$numero','$descripcion');";

    if (mysqli_query($con, $query)) {
        $con->close();
        return "done";
    } else {
        $con->close();
        return "error";
    }
}

function setOpcion($idPregunta, $descripcion) {
    $con = mysqli_connect('localhost', 'php', 'php', 'encuestas') or die('Connection failed' . mysqli_error());
    $query = "CALL nuevasOpciones('$idPregunta','$descripcion');";

    if (mysqli_query($con, $query)) {
        $con->close();
        return "done";
    } else {
        $con->close();
        return "error";
    }
}

/**
 * Metodo que regrsa todas las encuestas para los usuarios
 * @return string
 */
function popularEncuestas() {

    echo '<ul>';

    $con = mysqli_connect('localhost', 'php', 'php', 'encuestas') or die('Connection failed' . mysqli_error());
    $sql = "SELECT * from encuesta;";
    
    if ($result = mysqli_query($con, $sql)) {
        
        // Fetch one and one row
        while ($row = mysqli_fetch_row($result)) {
            echo '<li><a href="contestarEncuesta.php?nombre='. $row[1] .'&id='. $row[0] .'">'. $row[1] .'</a></li>';
        } 
        
        // Free result set
        mysqli_free_result($result);
    }
    mysqli_close($con);
    
    echo '</ul>';
}

/**
 * Metodo que regresa todas las las preguntas de una encuesta
 * @return string
 */
function popularPreguntas($idEncuesta) {
	
	 $count = 1;

	 //primera consulta, get pregunta
    $con = mysqli_connect('localhost', 'php', 'php', 'encuestas') or die('Connection failed' . mysqli_error());
    $sql = "SELECT * from pregunta where fk_idEncuesta='$idEncuesta';";
    
    if ($result = mysqli_query($con, $sql)) {  
		     
        while ($row = mysqli_fetch_row($result)) {
        	
        	   echo '<div class="form-group">';	
        	   echo '<h4>Pregunta'.$count.'</h4>';
        	   echo '<label class="col-md-4 control-label" for="respuesta'.$count.'">'.$row[4].'</label>';
        	   echo '<div class="col-md-4">';      	   

				//si es de tipo opción o selección				
				if($row[2] == 2 || $row[2] == 3) {
					//segunda consulta, get opciones
					$con2 = mysqli_connect('localhost', 'php', 'php', 'encuestas') or die('Connection failed' . mysqli_error());
    				$sql2 = "SELECT * from opciones where fk_idPregunta='$row[0]';";
    				
    				if($result2 = mysqli_query($con2, $sql2)) {
    					$optionCount = 0;
        				while ($row2 = mysqli_fetch_row($result2)) {
							//manejar opciones de la pregunta
							        		
							echo '<div class="radio" name="respuesta'.$count.'">';
                  	echo '<label for="radios-'.$optionCount.'">';
                  	echo '<input type="radio" name="respuesta'.$count.'" value="'.$row2[0].'">';
                  	echo $row2[2];
                  	echo '</label>';
	               	echo '</div>';					        		
							        								        				
        				}
    				
    				mysqli_free_result($result2);
    				}
    				
				} else { //es abierta: nombre= respuestax
				
					echo '<input id="respuesta'.$count.'" name="respuesta'.$count.'" class="form-control input-md" type="text">';
				
				}       
								
				echo '</div>';
		      echo '</div>';
		      echo '<hr>';
        	

			$count++;
        }         	         
               
        // Free result set
        mysqli_free_result($result);
    }
    mysqli_close($con);
	 mysqli_close($con2);
    
}



/**
 * Método que regresa todas las encuestas para el usuario
 * solo cambia la condición de la consulta :v
 * @return string
 */
function popularEncuestasDeUser($idUser) {

    echo '<ul>';

    $con = mysqli_connect('localhost', 'php', 'php', 'encuestas') or die('Connection failed' . mysqli_error());
    $sql = "SELECT * FROM encuesta WHERE fk_idUsuario='$idUser';";
    
    if ($result = mysqli_query($con, $sql)) {
        
        // Fetch one and one row
        while ($row = mysqli_fetch_row($result)) {
            echo '<li><a href="resultadoEncuesta.php?nombre='. $row[1] .'&id='. $row[0] .'">'. $row[1] .'</a></li>';
        } 
        
        // Free result set
        mysqli_free_result($result);
    }
    mysqli_close($con);
    
    echo '</ul>';
}

