<?php

  // DATABAZOVE NASTAVENIA
  $config['db']['host']         = "localhost";
  $config['db']['db']           = "kobe_brany";
  $config['db']['user']         = "root";
  $config['db']['password']     = "";

  $config['dia_tables']         = "dia_tables";

  $config['dia']['core']        = "{$_SERVER['HTTP_HOST']}/holes/Dia-core";

  $config['hostweb']            = "web/Admin";
  $config['host']               = $_SERVER['HTTP_HOST'] . '/holes/kobe-brany';

  // SUBOROVE NASTAVENIA
  $config['dir']['root']        = dirname(__FILE__);
  $config['dir']['web']         = dirname(__FILE__) . "/web/Admin";

  // NASTAVENIA DIE
  $config['web']['includes']    = "Includes";
  $config['web']['pages']       = "Pages";
  $config['web']['actions']     = "Actions";
  $config['web']['home']        = "home";
  $config['web']['files']       = "files";
  $config['web']['notfound']    = "404";
  $config['web']['bootstrap']   = TRUE;
  $config['web']['vue']         = TRUE;
  $config['web']['vega']        = TRUE;
  $config['web']['dropzone']    = TRUE;
  $config['web']['vue_components'] = "Components";
  $config['web']['elasticsearch'] = TRUE;
  $config['web']['admin'] = "Admin";

  // NASTAVENA HLAVICKY
  $config['head']['lang']       = "sk";
  $config['head']['charset']    = "utf-8";
  $config['head']['css']        = ['style4.css'];
  $config['head']['script']     = ['main.js'];

  $config['dir']['admin'] = "{$config['dir']['root']}/web/{$config['web']['admin']}";

  $config['urls'] = [
    "customers" => "zakaznici",
    "products" => "produkty",
    "users" => "uzivatelia",
    "complaints" => "reklamacie",
    "carts" => "kosiky",
    "dia_navbar" => "nastavenia-navigacia"
  ];
  
  $config['core']             = $_SERVER['DOCUMENT_ROOT'] . "/holes/Core";
  $config['coreUrl']          = $_SERVER['HTTP_HOST'] . '/holes/Core';
  $config['nodeModules']      = $_SERVER['DOCUMENT_ROOT'] . "/holes/node_modules";
  $config['nodeModulesUrl']   = $_SERVER['HTTP_HOST'] . '/holes/node_modules';

?>