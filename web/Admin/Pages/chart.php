<?php

  $chart = new Components\Chart("pie");
  $chart->labels(['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange']);
  $chart->data([12, 19, 3, 5, 2, 3]);
  $chart->label("XXX");
  $chart->backgroundColor([
    'rgba(255, 99, 132, 0.2)',
    'rgba(54, 162, 235, 0.2)',
    'rgba(255, 206, 86, 0.2)',
    'rgba(75, 192, 192, 0.2)',
    'rgba(153, 102, 255, 0.2)',
    'rgba(255, 159, 64, 0.2)'
  ]);
  $chart->borderColor([
    'rgba(255, 99, 132, 1)',
    'rgba(54, 162, 235, 1)',
    'rgba(255, 206, 86, 1)',
    'rgba(75, 192, 192, 1)',
    'rgba(153, 102, 255, 1)',
    'rgba(255, 159, 64, 1)'
  ]);

  $dia->template("
    <div class='row'>
      <div class='col-6'>
        {$chart->show()}
      </div>
      <div class='col-6'>
      </div>
    </div>
  ")->render();