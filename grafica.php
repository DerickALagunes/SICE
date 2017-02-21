<?php

/**
* Esto es un método para java script para crear graficas ver params y opciones
* Usa api de graficas de google
* PieChart
* BarChart
* columna1 de tipo string
* columna2 de tipo number
*/
function grafica($arregloRelacional, $tipo, $columna1, $columna2, $titulo, $altura, $ancho, $idDeDiv){
	echo <<< YOP
	
	// Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', '$columna1');
        data.addColumn('number', '$columna2');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);
        // Set chart options
        var options = {'title':'$titulo',
                       'width':$ancho,
                       'height':$altura};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.$tipo(document.getElementById('$idDeDiv'));
        chart.draw(data, options);
      }	
	
YOP;
}



?>