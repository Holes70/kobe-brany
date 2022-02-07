<?php

$tableLarge = new Component\TableLarge("products");
//var_dump($tableLarge->tableStructure); exit();
$dia->template("{$tableLarge->show()}")->render();