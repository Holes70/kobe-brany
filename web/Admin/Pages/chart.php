<?php

  $chart = new Components\Chart("pie");
  $chart->labels(['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange']);
  $chart->data([12, 19, 3, 5, 2, 3]);

  $dia->template("
    <div class='row'>
      <div class='col-6'>
        {$chart->show()}
      </div>
      <div class='col-6'>
      </div>
    </div>
  ")->render();