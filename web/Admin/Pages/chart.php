<?php

  $chart = new Component\Chart("pie");
  $chart->labels(['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange']);
  $chart->data([12, 19, 3, 5, 2, 3]);
  $chart->table("users");

  $dia->template("
    <div class='row'>
      <div class='col-6'>
        {$chart->show()}
      </div>
      <div class='col-6'>
      </div>
    </div>
  ")->render();