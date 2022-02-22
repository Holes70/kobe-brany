<?php

$tableName = \Core\Controllers\WebController::getParam("tableName");

$stringJson = file_get_contents(
	\Core\Controllers\WebController::getConfig()['dir']['web']
	. "/Tables/".ucfirst($tableName).".json"
);

echo $stringJson;