<?php
  global $db, $dia;

  $dia->template("
    <body>
      <div class='wrapper'>
        <nav id='sidebar' class='bg-white'>
          <div class='sidebar-header'>
            <h3>Bootstrap Sidebar</h3>
            <strong>BS</strong>
          </div>
          <ul class='list-unstyled components'>
            <li class='active'>
              <a href='#homeSubmenu' data-toggle='collapse' aria-expanded='false' class='dropdown-toggle'>
                <i class='fas fa-home'></i>
                Home
              </a>
              <ul class='collapse list-unstyled' id='homeSubmenu'>
                <li>
                  <a href='#'>Home 1</a>
                </li>
                <li>
                  <a href='#'>Home 2</a>
                </li>
                <li>
                  <a href='#'>Home 3</a>
                </li>
              </ul>
            </li>
            <li>
              <a href='#'>
                <i class='fas fa-briefcase'></i>
                About
              </a>
              <a href='#pageSubmenu' data-toggle='collapse' aria-expanded='false' class='dropdown-toggle'>
                <i class='fas fa-copy'></i>
                Pages
              </a>
              <ul class='collapse list-unstyled' id='pageSubmenu'>
                <li>
                  <a href='#'>Page 1</a>
                </li>
                <li>
                  <a href='#'>Page 2</a>
                </li>
                <li>
                  <a href='#'>Page 3</a>
                </li>
              </ul>
            </li>
            <li>
              <a href='#'>
                <i class='fas fa-image'></i>
                Portfolio
              </a>
            </li>
            <li>
              <a href='#'>
                <i class='fas fa-question'></i>
                FAQ
              </a>
            </li>
            <li>
              <a href='#'>
                <i class='fas fa-paper-plane'></i>
              </a>
            </li>
          </ul>
          <ul class='list-unstyled CTAs'>
            <li>
              <a href='https://bootstrapious.com/tutorial/files/sidebar.zip' class='download'>Download source</a>
            </li>
            <li>
              <a href='https://bootstrapious.com/p/bootstrap-sidebar' class='article'>Back to article</a>
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
  //$timer->render();

  //$elasticSearch = new Components\Elasticsearch("logstash_test");

  // SET field which will use for search
  //$elasticSearch->searchFields(['title', 'content']);

  /*$navbar_list = $db->select('dia_navbar');
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
      <nav class='navbar navbar-expand-lg'>
        <a class='navbar-brand' href='#'>DIA</a>    
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
      </div>
    </div>
    </header>
    <div class='body'>
  ";

  $dia->html($html)->render();*/

?>