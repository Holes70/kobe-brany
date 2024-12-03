# Dia

Simple framework for fast web component building

##Example


```php
use Component\TableLarge;
use Component\Row;

$orders = new TableLarge("orders");

$orders->conditions([
  "where" => [
    "type" => 1
  ]
]);

$orders->emptyDataMessage("Any news orders");

$add = new Row("orders");

$dia->template("
  {$add->show()}
  ".$dia->card($orders->show())."
")->render();
```

