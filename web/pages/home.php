<div class="card mt-5">
  <div class="card-header">
    Dôležité!
  </div>
  <div class="card-body">
    <h5 class="card-title">Pre ukážku komponent hore treba exportovať test.sql z priečinku MPJ!!!</h5>
    <p class="card-text">Test.sql obsahuje testovacie tabuľky z ktorých sa čerpajú dáta v daných komponentách.</p>
    <p><a href="#" class="btn btn-primary"></a> Modré znamenajú PHP komponenty</p>
    <p><a href="#" class="btn btn-success"></a> Zelené znamenajú PHP+Vue komponenty</p>
  </div>
</div>

<div class="card mt-5">
  <div class="card-header">
    Základné veci
  </div>
  <div class="card-body">
    <h5 class="card-title">Súborové rozdelenie</h5>
    <p class="card-text">
      MPJ čiže Dia sa skladá z 4 častí:
      <ul>
        <li><b>Core</b> (Iba pre skúsenejších tvorcov)</li>
        <li><b>Web</b> (Časť kde sa tvorí web)</li>
        <li><b>config.php</b> (Časť určená pre uživateľa, nejaké nastavenia DB a Webu)</li>
        <li><b>index.php</b> (Tu sa vyskladá celá Dia)</li>
      </ul>
    </p>
  </div>
</div>

<div class="card mt-5">
  <div class="card-header">
    Adresár Web
  </div>
  <div class="card-body">
    <h5 class="card-title">Rozdelenie Web adresáru</h5>
    <p class="card-text">
      Web sa skladá z 4 častí:
      <ul>
        <li><b>actions</b> (Akcie na ktoré smeruje Dia)</li>
        <li><b>includes</b> (Inkludované časti ako napr. header.php)</li>
        <li><b>pages</b> (Nosná časť, stránky webu. Stačí iba vytvoriť test.php a Dia su ju vie nasjť cez link index.php?page=test)</li>
        <li><b>public</b> (Všetky obrázky, css a js)</li>
      </ul>
    </p>
  </div>
</div>

<div class="card mt-5">
  <div class="card-header">
    Trieda DB
  </div>
  <div class="card-body">
    <h5 class="card-title">Trieda pre prácu s databázou CRUD</h5>
    <p class="card-text">
      <ul>
        <li><b>Select</b></li>
        <li><b>Insert</b></li>
        <li><b>Update</b></li>
        <li><b>Delete</b></li>
      </ul>
    </p>
  </div>
</div>

<div class="card mt-5">
  <div class="card-header">
    Trieda UI
  </div>
  <div class="card-body">
    <h5 class="card-title">Trieda pre prácu s vizuálom (IBA PHP)</h5>
    <p class="card-text">
      <ul>
        <li><b>Button</b></li>
        <li><b>Form</b></li>
        <li><b>Alert</b></li>
        <li><b>Table</b></li>
      </ul>
    </p>
  </div>
</div>

<div class="card mt-5">
  <div class="card-header">
    Trieda VUE
  </div>
  <div class="card-body">
    <h5 class="card-title">Trieda pre prácu s vizuálom (PHP + Vue.js)</h5>
    <p class="card-text">
      <ul>
        <li><b>Alert</b></li>
        <li><b>Table</b></li>
      </ul>
    </p>
  </div>
</div>