<?php

$idUser = 2; // TODO

$profileView = new Component\ProfileView("users");

$dia->template("
  {$profileView->show()}
")->render();