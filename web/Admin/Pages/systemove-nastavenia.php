<?php

$dia->template(
  $dia->card("
    <h3 class='card-title color-dark'>Správa navigačného menu stránky</h3>
    <p class='card-text'>Správa navigačného menu stránky</p>
    <a href='nastavenia-menu?previous_page=systemove-nastavenia' class='btn btn-dark'>Spravovať</a>
  ")
  ."<div class='mt-5'></div>".
  $dia->card("
    <h3 class='card-title color-red'>Správa admin menu</h3>
    <p class='card-text'>Upravovanie navigačného menu pre administrácie</p>
    <a href='nastavenia-navigacia?previous_page=systemove-nastavenia' class='btn btn-danger'>Spravovať</a>
  ")
  ."<div class='mt-5'></div>".
  $dia->card("
    <h3 class='card-title color-yellow'>Správa štruktúr tabuľiek</h3>
    <p class='card-text'>Upravovanie štrukúry systémových tabuľiek</p>
    <a href='json?previous_page=systemove-nastavenia' class='btn btn-warning'>Spravovať</a>
  ")
  ."<div class='mt-5'></div>".
  $dia->card("
    <h3 class='card-title color-secondary'>Dropzone test</h3>
    <p class='card-text'></p>
    <a href='pisomka?previous_page=systemove-nastavenia' class='btn btn-secondary'>Otvoriť</a>
  ")
)->render();

?>