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
function popularTablasEncuestas() {

    echo '<ul>';

    $con = mysqli_connect('localhost', 'php', 'php', 'encuestas') or die('Connection failed' . mysqli_error());
    $sql = "SELECT * from encuesta;";
    
    if ($result = mysqli_query($con, $sql)) {
        
        // Fetch one and one row
        $array = array();
        while ($row = mysqli_fetch_row($result)) {
            echo '<li><a href="contestarEncuesta?nombre='. $row[1] .'&id='. $row[0] .'">'. $row[1] .'</a></li>';
        } 
        
        foreach ($array as $x){
            
        }
        
        // Free result set
        mysqli_free_result($result);
    }
    mysqli_close($con);
    
    echo '</ul>';
}
