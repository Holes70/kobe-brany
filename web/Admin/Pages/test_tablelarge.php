<?php

$tableLarge = new Components\TableLarge("products");
//var_dump($tableLarge->tableStructure); exit();
$dia->template("{$tableLarge->show()}")->render();