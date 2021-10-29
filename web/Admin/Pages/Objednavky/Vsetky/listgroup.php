<?php
  $uid = \Core\Bice::getUID();

  ${$uid. '_timer'} = new Components\Timer();
  $tableCard = new Components\TableCard();
  $orderHtml = "";

  foreach($orders_types as $order) {
    $orderHtml .= "
      <div class='card'>
        <div class='card-header' id=\"heading_{$order['id']}\">
          <h5 class='mb-0'>
            <button class='btn btn-link' data-toggle='collapse' data-target=\"#collapse_{$order['id']}\" aria-expanded='false' aria-controls=\"collapse_{$order['id']}\">
              {$order['name']}
            </button>
          </h5>
        </div>

        <div id=\"collapse_{$order['id']}\" class='collapse' aria-labelledby=\"heading_{$order['id']}\" data-parent='#accordion'>
          <div class='card-body'>
           {$tableCard->show()}
          </div>
        </div>
      </div>
    ";
  }

  $html = "
    <div id='accordion'>
      {$orderHtml}
    </div>
  ";

  return $html;