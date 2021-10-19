<?php

  $chart = new Components\Chart("pie");
  $chart->labels(['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange']);
  $chart->data([12, 19, 3, 5, 2, 3]);
  $chart->label("XXX");

  $dia->template("
    {$chart->show()}
  ")->render();