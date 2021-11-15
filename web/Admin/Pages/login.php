<?php

$login = new Components\Login("users");
$login->loginInput("email");
$login->render();