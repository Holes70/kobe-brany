<template>
  <div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
    <div id="detail" class="services section">
      <div class="container m-5 p-3">
        <div :id="'katalog-item-' + data.id">
          <div class="service-item first-service">
            <div class="row">
              <div class="col-5">
                <div class="katalog-item-img">
                  <img :src="'http://localhost/holes/kobe-brany/files/products/' + data.image"/>
                </div>
              </div>
              <div class="col-1">
                <div class="d-flex flex-column">
                  <div class="pb-3">
                    <div class="katalog-item-img">
                      <img :src="'http://localhost/holes/kobe-brany/files/products/' + data.image"/>
                    </div>
                  </div>
                  <div class="pb-3">
                    <div class="katalog-item-img">
                      <img :src="'http://localhost/holes/kobe-brany/files/products/' + data.image"/>
                    </div>
                  </div>
                  <div class="pb-3">
                    <div class="katalog-item-img">
                      <img :src="'http://localhost/holes/kobe-brany/files/products/' + data.image"/>
                    </div>
                  </div>
                  <div class="pb-3">
                    <div class="katalog-item-img">
                      <img :src="'http://localhost/holes/kobe-brany/files/products/' + data.image"/>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-6">
                <h2>{{ data.name }}</h2>
                <h3 class="mt-3">{{ data.price }} €</h3>
                <p>{{ data.description }}</p>
                {{ this.$route.params.itemId }}
                <div class="gold-button">
                  <button>Pridať do košíka</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</template>
