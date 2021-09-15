<?php

  // DATABAZOVE NASTAVENIA
  $config['db']['host']         = "localhost";
  $config['db']['db']           = "eshop";
  $config['db']['user']         = "root";
  $config['db']['password']     = "";

  $config['dia_tables']         = "dia_tables";

  // SUBOROVE NASTAVENIA
  $config['dir']['root']        = dirname(__FILE__);

  // NASTAVENIA DIE
  $config['web']['includes']    = "includes";
  $config['web']['pages']       = "pages";
  $config['web']['actions']     = "actions";
  $config['web']['home']        = "home";
  $config['web']['files']       = "files";
  $config['web']['bootstrap']   = TRUE;
  $config['web']['vue']         = TRUE;
  $config['web']['vega']        = TRUE;
  $config['web']['vue_components'] = "components";
  $config['web']['elasticsearch'] = TRUE;

  // NASTAVENA HLAVICKY
  $config['head']['lang']       = "sk";
  $config['head']['charset']    = "utf-8";
  $config['head']['css']        = ['sweetalert.css', /*'materialize.css'*/ 'prosql.css'];
  $config['head']['script']     = ['sweetalert.js', 'jquery.js', /*'materialize.js'*/];

?>