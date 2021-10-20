<?php
  global $db, $dia;

  // Nacitaj Navbar
  $navbarList = $db->select('dia_navbar');

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
            <i class='fas fa-home'></i>
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
          <a href='{$menuItem['link']}'>
            <i class='fas fa-image'></i>
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
        <h3 class='color-secondary'>Dia administration</h3>
        <strong>BS</strong>
      </div>
      <ul class='list-unstyled components'>
        {$navigationHTML}
      </ul>
      <ul class='list-unstyled CTAs'>
        <li>
          <a href='https://bootstrapious.com/tutorial/files/sidebar.zip' class='download'>Download source</a>
        </li>
        <li>
          <a href='https://bootstrapious.com/p/bootstrap-sidebar' class='article'>Back to article</a>
        </li>
        <li>
          <a href='https://bootstrapious.com/p/bootstrap-sidebar' class='system-settings'>Systémové nastavenia</a>
        </li>
      </ul>
    </nav>
    <div id='content'>
          <nav class='navbar navbar-expand-lg navbar-light bg-primary'>
            <div class='container-fluid'>
              <button type='button' id='sidebarCollapse' class='btn btn-info'>
                <i class='fas fa-align-left'></i>
                <span>Toggle Sidebar</span>
              </button>
              <button class='btn btn-dark d-inline-block d-lg-none ml-auto' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>
                <i class='fas fa-align-justify'></i>
              </button>

              <div class='collapse navbar-collapse' id='navbarSupportedContent'>
                <ul class='nav navbar-nav ml-auto'>
                  <li class='nav-item active'>
                    <a class='nav-link' href='#'>Page</a>
                  </li>
                  <li class='nav-item'>
                    <a class='nav-link' href='#'>Page</a>
                  </li>
                  <li class='nav-item'>
                    <a class='nav-link' href='#'>Page</a>
                  </li>
                  <li class='nav-item'>
                    <a class='nav-link' href='#'>Page</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
  ")->render();

  //$elasticSearch = new Components\Elasticsearch("logstash_test");

  // SET field which will use for search
  //$elasticSearch->searchFields(['title', 'content']);

?>