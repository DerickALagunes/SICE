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

session_start();

function head($titulo){
echo <<< YOP
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset =utf-8">
            
            <!-- Bootstrap core CSS -->
            <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

            <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
            <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

            <!-- Custom styles for this template -->
            <link href="jumbotron-narrow.css" rel="stylesheet">

            <title>
                $titulo
            </title>
        </head>
        <body>
YOP;
}

function ender(){
echo <<< YOP
    </body>
</html>

YOP;
}

/*
 * Función de conexion a un servidor MySQL 
 * Requires $host, $dbNAme, $user and $pass params
 * 
 * For now, not handling errors
 */
function conexion($host, $dbName,$user, $pass){
    if($pdo = new PDO('mysql:host='+$host+';dbname='+$dbName, $user, $pass)){
        return $pdo;
    }  else {
        //handle error
    }
}
        
        