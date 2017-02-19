<!DOCTYPE html>
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
include './Plantillas/tools.php';
head("SICE-Registro");
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
<br/>
<div class="container">
    <br/>
    <br/>

    <form class="form-horizontal col-md-6" action='Plantillas/registro.php' method="POST">
        <fieldset>
            <div id="legend">
                <h3>Registro de usuario</h3>
            </div>

            <div class="control-group">
                <!-- E-mail -->
                <label class="control-label" for="email">E-mail</label>
                <div class="controls">
                    <input type="text" id="email" name="email" placeholder="" class="input-xlarge">
                </div>
            </div><br/>

            <!-- Multiple Radios -->
            <div class="control-group">
                <label class="control-label" for="radios">Tipo de cuenta</label>
                <div class="radio">
                    <label for="radios-0">
                        <input type="radio" name="radios" id="radios-0" value="1" checked="checked">                                
                        Usuario (permite contestar encuestas)
                    </label>
                </div>
                <div class="radio">
                    <label for="radios-1">
                        <input type="radio" name="radios" id="radios-1" value="2">
                        Administrador (permite crear encuestas)
                    </label>
                </div>
            </div><br/>

            <div class="control-group">
                <!-- Password-->
                <label class="control-label" for="password">Contraseña</label>
                <div class="controls">
                    <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
                </div>
            </div><br/>

            <div class="control-group">
                <!-- Password -->
                <label class="control-label"  for="password_confirm">Contraseña (Confirmación)</label>
                <div class="controls">
                    <input type="password" id="password_confirm" name="passwordC" placeholder="" class="input-xlarge">
                </div>
            </div><br/>

            <div class="control-group">
                <!-- Button -->
                <div class="controls">
                    <button class="btn btn-success">Registro</button>
                </div>
            </div>
        </fieldset>
    </form>

    <img id="char" src="imagenes/registerU.png" alt="" class="col-md-6"/>

    <footer>
        <p>MechSolutions</p>
    </footer>

</div> 

<script type="text/javascript">

    $(document).ready(function () {
        $("#radios-0").click(function () {
            console.log('click');
            $('#char').attr('src', "imagenes/registerU.png");
        });

        $("#radios-1").click(function () {
            $('#char').attr('src', "imagenes/registerA.png");
        });
    });

</script>


<?php
ender();
