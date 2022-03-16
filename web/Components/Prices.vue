<template>
  <div class="modal fade bd-example-modal-lg" id="modal-kontakt" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
     <div class="modal-dialog modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="model-img modal-body text-center">
            Kontakt
          </div>
        </div>
      </div>
  </div>
  <div id="cennik" class="pricing-tables">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading">
            <h4>Máme pre Vás tie <em>najlepšie</em> ceny</h4>
            <img src="assets/images/heading-line-dec.png" alt="">
          </div>
        </div>
        <div class="col-lg-4">
          <div class="pricing-item-regular">
            <span class="price">20€</span>
            <h4>Štandart</h4>
            <div class="icon">
              <img src="assets/images/pricing-table-01.png" alt="">
            </div>
            <ul>
              <li>Opravy</li>
              <li>Modifikácia</li>
              <li class="non-function">Montáž</li>
              <li class="non-function">Návrh</li>
              <li class="non-function">Obhliadka</li>
              <li class="non-function">Výmera</li>
            </ul>
            <div class="border-button">
              <a 
                href=""
                onclick="javascript.void(0)"
                data-toggle="modal" 
                data-target="#modal-kontakt" 
                class="btn"
              >Vybrať</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="pricing-item-pro">
            <span class="price">50€</span>
            <h4>Zlatá</h4>
            <div class="icon">
              <img src="assets/images/pricing-table-01.png" alt="">
            </div>
            <ul>
              <li>Opravy</li>
              <li>Modifikácia</li>
              <li>Montáž</li>
              <li>Návrh</li>
              <li class="non-function">Obhliadka</li>
              <li class="non-function">Výmera</li>
            </ul>
            <div class="border-button">
              <a 
                href=""
                onclick="javascript.void(0)"
                data-toggle="modal" 
                data-target="#modal-kontakt" 
                class="btn"
              >Vybrať</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="pricing-item-regular">
            <span class="price">100€</span>
            <h4>Prémium</h4>
            <div class="icon">
              <img src="assets/images/pricing-table-01.png" alt="">
            </div>
            <ul>
             <li>Opravy</li>
              <li>Modifikácia</li>
              <li>Montáž</li>
              <li>Návrh</li>
              <li>Obhliadka</li>
              <li>Výmera</li>
            </ul>
            <div class="border-button">
              <a 
                href=""
                onclick="javascript.void(0)"
                data-toggle="modal" 
                data-target="#modal-kontakt" 
                class="btn"
              >Vybrať</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>