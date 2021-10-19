<?php

  $chart = new Components\Chart("pie");

  $dia->template("
    {$chart->show()}
  ")->render();