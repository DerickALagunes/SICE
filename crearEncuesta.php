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
head("SICE-Crear");
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
    <br/>

    <form class="form-horizontal" action="Plantillas/registrarEncuesta.php" method="POST">
        <fieldset>

            <!-- Form Name -->
            <legend>Creación de encuesta</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Nombre de la encuesta:</label>  
                <div class="col-md-4">
                    <input id="textinput" name="nombreEncuesta" type="text"  class="form-control input-md">
                </div>
            </div>

            <!--agregar-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="button1id">Agregar Pregunta:</label>
                <div class="col-md-8">
                    <a id="button1id" name="button1id" class="btn btn-default">Abierta</a>
                    <a id="button2id" name="button2id" class="btn btn-default">Opción múltiple</a>
                    <a id="button3id" name="button3id" class="btn btn-default">Selección múltiple</a>
                    <br/>
                </div>
                <hr class="col-md-12">

            </div>

            <!--generar-->
            <div id="preguntas">

            </div>

            <!--boton-->
            <div style="text-align: center">
                <button class="btn btn-success">Registrar encuesta</button>
                <br/>
                <br/>
                <br/>
            </div>

        </fieldset>
    </form>

</div> 


<script type="text/javascript">

    $(document).ready(function () {

        var wrap = $('#preguntas');
        var count = 1;

        $("#button1id").click(function () {
            var genAbierta = '<div class="form-group" id="PreguntaAbierta' + count + '"><label class="col-md-4 control-label" for="pregunta' + count + '">Pregunta' + count + '</label><div class="col-md-4"><input id="pregunta' + count + '" name="abierta' + count + '" type="text" class="form-control input-md"></div></div><br /><hr>';
            $(wrap).append(genAbierta);
            count++;
        });

        $("#button2id").click(function () {

            var addOp = '<div class="form-group" id="PreguntaOpMul' + count + '">\n\
                            <label class="col-md-4 control-label" for="pregunta' + count + '">Pregunta' + count + '</label>\n\
                            <div class="col-md-4">\n\
                                <input id="pregunta' + count + '" name="opcion' + count + '" type="text" class="form-control input-md">\n\
                            </div>\n\
                        </div>\n\
                        <div class="form-group">\n\
                            <label class="col-md-4 control-label" for="opcion1">Opción 1</label>\n\
                            <div class="col-md-4">\n\
                                <input id="opcion1" name="op' + count + '1" type="text" class="form-control input-md">\n\
                            </div>\n\
                        </div>\n\
                        <div class="form-group">\n\
                            <label class="col-md-4 control-label" for="opcion2">Opción 2</label>\n\
                            <div class="col-md-4">\n\
                                <input id="opcion2" name="op' + count + '2" type="text" class="form-control input-md">\n\
                            </div>\n\
                        </div>\n\
                        <div class="form-group">\n\
                            <label class="col-md-4 control-label" for="opcion3">Opción 3</label>\n\
                            <div class="col-md-4">\n\
                                <input id="opcion3" name="op' + count + '3" type="text" class="form-control input-md">\n\
                            </div>\n\
                        </div>\n\
                        <div class="form-group">\n\
                            <label class="col-md-4 control-label" for="opcion1">Opción 4</label>\n\
                            <div class="col-md-4">\n\
                                <input id="opcion4" name="op' + count + '4" type="text" class="form-control input-md">\n\
                            </div>\n\
                        </div>\n\
                        <br />\n\
                        <hr>';
            $(wrap).append(addOp);//agrega from para llenar las opciones y nombre de la pregunta

            count++;
        });

        $("#button3id").click(function () {

            var addOp = '<div class="form-group" id="PreguntaSelMul' + count + '">\n\
                            <label class="col-md-4 control-label" for="pregunta' + count + '">Pregunta' + count + '</label>\n\
                            <div class="col-md-4">\n\
                                <input id="pregunta' + count + '" name="seleccion' + count + '" type="text" class="form-control input-md">\n\
                            </div>\n\
                        </div>\n\
                        <div class="form-group">\n\
                            <label class="col-md-4 control-label" for="opcion1">Opción 1</label>\n\
                            <div class="col-md-4">\n\
                                <input id="opcion1" name="sel' + count + '1" type="text" class="form-control input-md">\n\
                            </div>\n\
                        </div>\n\
                        <div class="form-group">\n\
                            <label class="col-md-4 control-label" for="opcion2">Opción 2</label>\n\
                            <div class="col-md-4">\n\
                                <input id="opcion2" name="sel' + count + '2" type="text" class="form-control input-md">\n\
                            </div>\n\
                        </div>\n\
                        <div class="form-group">\n\
                            <label class="col-md-4 control-label" for="opcion3">Opción 3</label>\n\
                            <div class="col-md-4">\n\
                                <input id="opcion3" name="sel' + count + '3" type="text" class="form-control input-md">\n\
                            </div>\n\
                        </div>\n\
                        <div class="form-group">\n\
                            <label class="col-md-4 control-label" for="opcion1">Opción 4</label>\n\
                            <div class="col-md-4">\n\
                                <input id="opcion4" name="sel' + count + '4" type="text" class="form-control input-md">\n\
                            </div>\n\
                        </div>\n\
                        <br />\n\
                        <hr>';
            $(wrap).append(addOp);//agrega from para llenar las opciones y nombre de la pregunta

            count++;
        });
    });

</script>


<?php
ender();
