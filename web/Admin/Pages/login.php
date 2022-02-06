<?php

$checkError = (bool)$webController->getParam("error");

$login = new Components\Login("users");
$login->loginInput("email");
$login->passwordInput("password");
$login->error($checkError);
$login->render();