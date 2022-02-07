<?php

$checkError = (bool)\Core\Controllers\WebController::getParam("error");

$login = new Component\Login("users");
$login->loginInput("email");
$login->passwordInput("password");
$login->error($checkError);

$dia->template("
  <div style='width:100%'>
    {$login->show()}
  </div>
")->render();