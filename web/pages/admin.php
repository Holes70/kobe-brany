<?php


  $jumbotron = new Jumbotron\Component();
  $jumbotron
    ->title("Administračný panel")
    ->body("xxx")
  ;

  $navbar_form = new Form\Component("dia_navbar");
  //$navbar_form->inputs(['name', 'link', 'description']);

  //$navbar_table = new Table\Component("dia_navbar");
  //$navbar_table->columns(["id" => "id", "link" => "link"]);

  $navbar_table1 = new TableVue\Component("dia_navbar");
  $navbar_table1->buttons(['edit', 'delete']);
  //print_r($GLOBALS['dia_vue_components']); exit();

  $table_users = new TableVue\Component("users");
  $table_users->buttons(['edit']);