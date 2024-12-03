<?php

  $e = new Form\Component("employees");

  $e_table = new Table\Component("employees");
  $e_table->columns(['id' => 'id', 'first_name' => 'Meno', 'last_name' => 'Priezvisko']);
  $e_table->buttons(['delete', 'edit']);

  $dia->vue("<strong>Treba opravit ak v columns nie je id nejde mazat! Tak isto treba dorobit moznost bez columns</strong>");