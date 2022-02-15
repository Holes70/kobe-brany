<?php

$dropzone = new Component\Dropzone("complaints_documents");
$dropzone->conditions([
	"where" => [
		'id_complaint' => 1
	]
]);

$dia->template(
	$dia->cardBook(
		$dropzone->show()
	)
)->render();