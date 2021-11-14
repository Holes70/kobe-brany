<?php

$profileCard = new Components\ProfileCard();
$profileCard->name("Patrik Holes");
$profileCard->nameOnClick([
  'type' => 'href', // Type of 
  'url' => 'profile' // Link
]);
$profileCard->render();