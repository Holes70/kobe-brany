<?php
  /*
    Zavolanie vlastnej komponenty 
    Default: $config['web']['vue_components'] = 'components'
    Dir: web/components/NazovKomponenty.vue

    Volanie:
    $dia->vue("nazov_komponenty_z_precinku");

  */

  $dia->vue("testParams"); // web/components/testParams.vue

  $dia->vue("testParams2"); // web/components/testParams2.vue
  // Mozem dosadit parametre zapisom:
  // $nazov_komponenty['params']['lubovolny_nazov_premennej'] = blablabla;
  $testParams2['params']['cislo'] = 5 + 8;
  $vypis = "";
  for($i = 0;$i < 5; $i++) {
    $vypis .= "A_";
  }
  $testParams2['params']['textA'] = $vypis; // retazec

  $pole = [1, 5, 7, 4.5];
  $testParams2['params']['cisla'] = $pole;

  echo "Tento text sa nezobrazi!!!"; // Text sa nezobrazuje kvoli tomu, ze Vue sa stara o to ze HTML DOM sa cely prepise
?>

<h1>Ani tento text sa nezobrazi!</h1>

<?php

  $dia->vue("<h1>Tento text sa zobrazi konecne :)</h1>");

?>