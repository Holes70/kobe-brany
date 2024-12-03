<?php

$idComplaint = \Core\Controllers\WebController::getParam("id");

$dropzone = new Component\Dropzone("complaints_documents");
$dropzone->conditions([
	"where" => [
		'id_complaint' => $idComplaint
	]
]);

$dia->template(
	$dia->cardBook(
		$dropzone->show()
	)
)->render();