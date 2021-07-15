<?php
  global $db;

  $navbar_list = $db->select('dia_navbar');
  array_pop($navbar_list);

  foreach ($navbar_list as $flatItem) {
    if ($flatItem['id_parent'] == 0) {
      $children = [];
      foreach ($navbar_list as $flatItemSub) {
        if ($flatItemSub['id_parent'] == $flatItem['id']) {
          $children[] = [
            "name" => $flatItemSub['name'],
            "link" => $flatItemSub['link'],
          ];
        }
      }

      $menuItems[] = [
        "name" => $flatItem['name'],
        "link" => $flatItem['link'],
        "childrens" => $children,
      ];
    }
  }

?>

<header>
  <nav class="navbar navbar-expand-lg navbar-light bg-light bg-primary">
    <a class="navbar-brand" href="#">Sequel-D</a>    
    <div class="collapse navbar-collapse bg-primary">
      <ul class="navbar-nav mr-auto">
        <?php
          $html = "";
          foreach ($menuItems as $item) {
            if (count($item['childrens']) > 0) {
              $html .= "
                <li class='nav-item dropdown'>
                <a 
                  class='nav-link 
                  dropdown-toggle' 
                  href='index.php?page={$item['link']}' 
                  id='navbarDropdown' 
                  role='button' 
                  data-toggle='dropdown' 
                  aria-haspopup='true' 
                  aria-expanded='false'
                >{$item['name']}</a>
                <div class='dropdown-menu' aria-labelledby='navbarDropdown'>
              ";
              foreach ($item['childrens'] as $children) {
                $html .= "
                  <a 
                    class='dropdown-item' 
                    href='index.php?page={$children['link']}'>
                    {$children['name']}
                  </a>
                ";
              }
              $html .= "</div></li>";
            } else {
              $html .="
                <li class='nav-item'>
                  <a class='nav-link' href='index.php?page={$item['link']}'>{$item['name']}</a>
                </li>
              ";
            }
          }

          echo $html;
        ?>
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