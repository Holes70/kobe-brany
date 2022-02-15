<?php

$idUser = 2; // TODO

$profileView = new Component\ProfileView("users");

$dia->template("
  <div class='mt-5'>
    {$profileView->show()}
  </div>
")->render();