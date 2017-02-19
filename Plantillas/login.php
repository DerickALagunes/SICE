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

include 'UsuarioDao.php';

$user = $_POST["user"];
$pass = $_POST["contra"];

$result = logIn($user, $pass);


if ($result > 0) {
    
    echo 'Bienvenido'.$user;
    sleep(7);
    
    $_SESSION['user']=$user;
    
    if ($result == 2) {
        $_SESSION['tipo']="admin";
    }  else {
        $_SESSION['tipo']="user";
    }
    
    header("Location: ../index.php");  
    
}else{
    echo 'El usuario no existe, cree una cuenta';
    sleep(7);
    header("Location: ../registro.php");
}