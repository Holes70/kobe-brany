<?php

$login = new Components\Login("users");
$login->loginInput("email");
$login->passwordInput("password");
$login->render();