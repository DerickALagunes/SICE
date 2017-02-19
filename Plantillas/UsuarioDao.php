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

function newUser($userName, $pass, $tipo) {

    $con = mysqli_connect('localhost', 'php', 'php', 'encuestas') or die('Connection failed' . mysqli_error());

    $query = "CALL insertarUsuario('$userName','$pass','$tipo');";

    if (mysqli_query($con, $query)) {
        return "done";
    } else {
        return "error";
    }
    $con->close();
}

function logIn($userName, $pass) {

    $mysqli = new mysqli('localhost', 'php', 'php', 'encuestas');

    $call = $mysqli->prepare('CALL verificarUsuario(?, ?, @existe, @tipo)');
    $call->bind_param('ss', $userName, $pass);
    $call->execute();

    $select = $mysqli->query('SELECT @existe, @tipo');
    $result = $select->fetch_assoc();
    
    
    $tipo = $result['@tipo'];
        
    if ($result['@existe']){
        return $tipo;
    }else {
        return 0;
    }
}
