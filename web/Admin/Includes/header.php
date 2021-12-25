<?php
  global $db, $dia;

  $memory = new Components\Memory();

  $elasticSearch = new Components\Elasticsearch("test_index_1");
  $elasticSearch->searchFields(['title', 'content']);

  $profileCard = new Components\ProfileCard("users");

  // Nacitaj Navbar
  $navbarList = $db->dbSelect(
    tableName: 'dia_navbar',
    conditions: [
      "order_by" => "order_index ASC"
    ]
  );

  // Vytvorim si logiku v usporiadani navbaru
  // Vytvorim si viacrozmerne pole
  foreach ($navbarList as $flatItem) {
    if ($flatItem['id_parent'] == 0) {
      $children = [];
      foreach ($navbarList as $flatItemSub) {
        if ($flatItemSub['id_parent'] == $flatItem['id']) {
          $children[] = [
            "name" => $flatItemSub['name'],
            "link" => $flatItemSub['link'],
            "icon" => $flatItemSub['icon'],
          ];
        }
      }

      $menuItems[] = [
        "name" => $flatItem['name'],
        "link" => $flatItem['link'],
        "icon" => $flatItem['icon'],
        "is_enabled" => $flatItem['is_enabled'],
        "childrens" => $children,
      ];
    }
  }

  // Pouzijem foreach na vyskladanie HTML pre navigaciu
  $navigationHTML = "";

  foreach ($menuItems as $menuItem) {
    if (count($menuItem['childrens']) > 0) {
      $childrensHTML = "";
      foreach ($menuItem['childrens'] as $childrenItem) {
        $childrensHTML .= " 
          <li>
            <a href='{$childrenItem['link']}'>{$childrenItem['name']}</a>
          </li>
        ";
      } 
      $navigationHTML .= "
        <li class='active'>
          <a href='#menu_{$menuItem['link']}' data-toggle='collapse' aria-expanded='false' class='dropdown-toggle'>
            <i class='fas fa-{$menuItem['icon']}'></i>
            {$menuItem['name']}
          </a>
          <ul class='collapse list-unstyled' id='menu_{$menuItem['link']}'>
            {$childrensHTML}
          </ul>
        </li>
      ";
    } else {
      $navigationHTML .= "
        <li>
          <a 
            href='{$menuItem['link']}'
            ".($menuItem['is_enabled'] == 0 ? 'class=\'disabled-nav\'' : '')."
          >
            <i class='fas fa-{$menuItem['icon']}'></i>
            {$menuItem['name']}
          </a>
        </li>
      ";
    }
  }

  //print_r($menuItems); exit();
  $dia->template("
    <nav id='sidebar' class='bg-white'>
      <div class='sidebar-header'>
        <h3 class='color-secondary'>Admin</h3>
        <strong>Admin</strong>
      </div>
      <ul class='list-unstyled components'>
        {$navigationHTML}
      </ul>
      <ul class='list-unstyled CTAs'>
        <li>
          <a href='systemove-nastavenia' class='system-settings'>Systémové nastavenia</a>
        </li>
      </ul>
    </nav>
    <div id='content'>
      <nav class='navbar navbar-expand-lg navbar-light bg-white'>
        <div class='container-fluid'>
          <button type='button' id='sidebarCollapse' class='btn btn-primary'>
            <i class='fas fa-arrow-left color-secondary'></i>
          </button>
          <button class='btn btn-dark d-inline-block d-lg-none ml-auto' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>
            <i class='fas fa-align-justify'></i>
          </button>
          <div class='ml-3'>
            {$elasticSearch->show()}
          </div>
          <div class='collapse navbar-collapse' id='navbarSupportedContent'>
            <ul class='nav navbar-nav ml-auto'>
              <li class='nav-item'>
                <a href=''>
                  <i class='fas fa-comments'></i>
                </a>
              </li>
              <li class='nav-item'>
                <a href=''>
                  <i class='fas fa-envelope'></i>
                </a>
              </li>
              <li class='nav-item pl-4 pr-2'>
                <div class='divider-v'></div>
              </li>
              <li class='nav-item'>
                {$profileCard->show()}
              </li>
            </ul>
          </div>
        </div>
      </nav>
      {$memory->show()}
      <div id='loader' style='display:none'>
        <div class='loader'>
          <svg viewBox='0 0 80 80'>
            <circle id='test' cx='40' cy='40' r='32'></circle>
          </svg>
        </div>
    
        <div class='loader triangle'>
          <svg viewBox='0 0 86 80'>
            <polygon points='43 8 79 72 7 72'></polygon>
          </svg>
        </div>
    
        <div class='loader'>
          <svg viewBox='0 0 80 80'>
            <rect x='8' y='8' width='64' height='64'></rect>
          </svg>
        </div>
      </div>
      <div class='page-content' style='display:none'>
  ")->render();

  //$elasticSearch = new Components\Elasticsearch("logstash_test");

  // SET field which will use for search
  //$elasticSearch->searchFields(['title', 'content']);

?>