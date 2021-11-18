<?php
$jsonEditor = new Components\JsonEditor("dia_tables");
$dia->template("{$jsonEditor->show()}")->render(); 