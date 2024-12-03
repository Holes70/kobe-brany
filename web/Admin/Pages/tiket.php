<?php

$tiket = new Component\Tiket();
$tiket->data([
  [
    'name' => 'Item 1',
    'desc' => 'Item 1 description'
  ],
  [
    'name' => 'Item 2',
    'desc' => 'Item 2 description'
  ],
  [
    'name' => 'Item 3',
    'desc' => 'Item 3 description'
  ],
  [
    'name' => 'Item 4',
    'desc' => 'Item 4 description'
  ]
]);
$tiket->title('name');
$tiket->desc('desc');
$tiket->render();