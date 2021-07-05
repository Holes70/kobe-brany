<?php
  global $db;

  $navbar_list = $db->select('dia_navbar');
  array_pop($navbar_list);

  $navbar = [];
  foreach ($navbar_list as $item) {
    foreach ($item as $key => $val) {
      if ($key == 'id_parent' && $item['id_parent'] != NULL) {
        $navbar[$item['id_parent']]['main'] = $item;
       // array_push($navbar[$item['id_parent']], $item);
        $item_id = $item['id'];
        $navbar[$item['id_parent']]['childrens'][$item['id']] = [];
        foreach ($item as $c_key => $c_val) {
          if ($c_key == 'id' && $item_id == $c_val) {
            $navbar[$item['id_parent']]['childrens'][$item_id] = $item;
          }
        }
      }
    }
  }
print_r($navbar);
  
?>

<header>
  <nav class="navbar navbar-expand-lg navbar-light bg-light bg-primary">
    <a class="navbar-brand" href="#">Sequel-D</a>    
    <div class="collapse navbar-collapse bg-primary">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.php?page=home">⌂ Domov</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Učebné texty
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#"></a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <!--<li class="nav-item">
          <a class="nav-link" href="index.php?page=vue_table">Vue_table</a>
        </li>
        <li class="nav-item"> 
          <a class="nav-link" href="index.php?page=vue_form">Vue_form</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="index.php?page=vue_params">Vue_params</a>
        </li>-->
      </ul>
    </div>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </nav>
  <div class="second_nav">
    <div class="row">
      <div class="col-9">dsadas</div>
      <div class="col-3">LOGIN</div>
    </div>
  </div>
</header>


<div class='container'>