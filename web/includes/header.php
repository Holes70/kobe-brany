<?php
  global $db, $dia;

  $timer = new \Components\Timer();
  //$timer->render();

  //$elasticSearch = new Components\Elasticsearch("logstash_test");

  // SET field which will use for search
  //$elasticSearch->searchFields(['title', 'content']);

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

  $html = "
    <header>
      <nav class='navbar navbar-expand-lg navbar-light bg-light bg-primary'>
        <a class='navbar-brand' href='#'>Sequel-D</a>    
          <div class='collapse navbar-collapse bg-primary'>
            <ul class='navbar-nav mr-auto'>
  ";

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

  $html .= "
        </ul>
      </div>
      {$timer->show()}
    </nav>
    <div class='second_nav'>
      <div class='row'>
        <div class='col-9'>dsadas</div>
        <div class='col-3'>LOGIN</div>
      </div>
    </div>
    </header>
  ";

  $dia->html($html)->render();

?>