<?php


  $jumbotron = new Components\Jumbotron();
  $jumbotron
    ->title("Administračný panel")
    ->body("xxx")
  ;

  $navbar_form = new Components\Form("dia_navbar");
  //$navbar_form->inputs(['name', 'link', 'description']);

  //$navbar_table = new Table\Component("dia_navbar");
  //$navbar_table->columns(["id" => "id", "link" => "link"]);

  $navbar_table1 = new Components\Table("dia_navbar");
  $navbar_table1->buttons(['edit', 'delete']);
  //print_r($GLOBALS['dia_vue_components']); exit();

  $table_users = new Components\Table("users");
  $table_users->buttons(['edit']);