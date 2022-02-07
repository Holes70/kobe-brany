<?php

$chart = new Component\Chart("pie");
$chart->labels(['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange']);
$chart->data([12, 19, 3, 5, 2, 3]);

$table_products = new Component\Table("products");
$table_products->columns(['id' => 'ID', 'name' => 'Meno', 'price|$' => 'Cena'])->buttons(['edit', 'delete']);

$timer = new Component\Timer();

$test_tiket = new Component\Tiket();

$dia->template("
  <div class='row'>
    <div class='col-6'>
      <div class='card'>
        <h4 class='card-header text-center'>Tržby</h4>
        <div class='card-body'>
          {$chart->show()}
        </div>
      </div>
    </div>
    <div class='col-6'>
      <div class='d-flex flex-column'>
        <div class='p-2'>
          <div class='alert alert-primary' role='alert'>
            This is a primary alert—check it out!
          </div>
          <div class='alert alert-secondary' role='alert'>
            This is a secondary alert—check it out!
          </div>
          <div class='alert alert-success' role='alert'>
            This is a success alert—check it out!
          </div>
          <div class='alert alert-danger' role='alert'>
            This is a danger alert—check it out!
          </div>
          <div class='alert alert-warning' role='alert'>
            This is a warning alert—check it out!
          </div>
          <div class='alert alert-info' role='alert'>
            This is a info alert—check it out!
          </div>
          <div class='alert alert-light' role='alert'>
            This is a light alert—check it out!
          </div>
          <div class='alert alert-dark' role='alert'>
            This is a dark alert—check it out!
          </div>
        </div>
        <div class='p-2'>
          <div class='card' style='height:250px;overflow:hidden'>
            {$timer->show()}
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class='line'></div>

  <div class='row mb-5 ml-1 mr-1'>
    <div class='card'>
      <div class='card-body'>
        <h4 id='specific-markup-required-for-dismiss-on-next-click'>Specific markup required for dismiss-on-next-click</h4>
        
        <p>For proper cross-browser and cross-platform behavior, you must use the <code class='highlighter-rouge'>&lt;a&gt;</code> tag, <em>not</em> the <code class='highlighter-rouge'>&lt;button&gt;</code> tag, and you also must include a <a href='https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex'><code class='highlighter-rouge'>tabindex</code></a> attribute.</p>
      </div>
    </div>
  </div>

  <div class='row'>
    <div class='col-9'>
      <div class='card'>
        <div clas='card-body'>
          {$table_products->show()}
        </div>
      </div>
    </div>
    <div class='col-3'>
      {$test_tiket->show()}
    </div>
  </div>

  <div class='line'></div>

  <h2>Lorem Ipsum Dolor</h2>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
")->render();