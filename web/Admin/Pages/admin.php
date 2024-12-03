<?php


  $jumbotron = new Component\Jumbotron();
  $jumbotron
    ->title("Administračný panel")
    ->body("xxx")
  ;

  $navbar_form = new Component\Form("dia_navbar");
  //$navbar_form->inputs(['name', 'link', 'description']);

  //$navbar_table = new Table\Component("dia_navbar");
  //$navbar_table->columns(["id" => "id", "link" => "link"]);

  $navbar_table1 = new Component\Table("dia_navbar");
  $navbar_table1->buttons(['edit', 'delete']);
  //print_r($GLOBALS['dia_vue_components']); exit();

  $table_users = new Component\Table("users");
  $table_users->buttons(['edit']);