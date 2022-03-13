<template>
  <div id="kontakt" class="the-clients">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading">
            <h4>Prezrite si naše <em>najlepšie</em> produkty</h4>
            <img src="assets/images/heading-line-dec.png" alt="">
          </div>
        </div>
        <div class="col-lg-12">
          <div class="naccs">
            <div class="grid">
              <div class="row">
                <div class="col-lg-7 align-self-center">
                  <div class="menu">
                    <div class="first-thumb active">
                      <div class="thumb">
                        <div class="row">
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>Produkt-98</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                            <span class="category">Produkt na mieru</span>
                          </div>
                          <div class="col-lg-4 col-sm-4 col-12">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <span class="rating">4.8</span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <div class="thumb">
                        <div class="row">
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>Produkt-85</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                            <span class="category">Produkt na mieru</span>
                          </div>
                          <div class="col-lg-4 col-sm-4 col-12">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <span class="rating">4.5</span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <div class="thumb">
                        <div class="row">
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>Produkt-54</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                            <span class="category">Produkt na mieru</span>
                          </div>
                          <div class="col-lg-4 col-sm-4 col-12">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <span class="rating">4.7</span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <div class="thumb">
                        <div class="row">
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>Produkt-15</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                            <span class="category">Produkt na mieru</span>
                          </div>
                          <div class="col-lg-4 col-sm-4 col-12">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <span class="rating">3.9</span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="last-thumb">
                      <div class="thumb">
                        <div class="row">
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>Produkt-5</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                            <span class="category">Produkt na mieru</span>
                          </div>
                          <div class="col-lg-4 col-sm-4 col-12">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <span class="rating">4.3</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div> 
                <div class="col-lg-5">
                  <ul class="nacc">
                    <li class="active">
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="card">
                                <div class="card-body">
                                  <img :src="'http://localhost/holes/kobe-brany/files/products/product_1.jpg'"/>
                                  <div class="row mt-3">
                                    <div class="col-6">
                                      <h4>Produkt-98</h4>
                                    </div>
                                    <div class="col-6 text-right">
                                      <div class="gradient-button-gold">
                                        <router-link class="p-2" :to="{ name: 'Detail', params: { itemId: 98 } }">Prezerať produkt</router-link>
                                      </div>
                                    </div>
                                  </div>
                                  <h4 class="mt-3">11.00 €</h4>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-12">
                             <div class="card">
                                <div class="card-body">
                                  <img :src="'http://localhost/holes/kobe-brany/files/products/product_3.jpg'"/>
                                  <div class="row mt-3">
                                    <div class="col-6">
                                      <h4>Produkt-85</h4>
                                    </div>
                                    <div class="col-6 text-right">
                                      <div class="gradient-button-gold">
                                        <router-link class="p-2" :to="{ name: 'Detail', params: { itemId: 85 } }">Prezerať produkt</router-link>
                                      </div>
                                    </div>
                                  </div>
                                  <h4 class="mt-3">763.00 €</h4>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="card">
                                <div class="card-body">
                                  <img :src="'http://localhost/holes/kobe-brany/files/products/product_3.jpg'"/>
                                  <div class="row mt-3">
                                    <div class="col-6">
                                      <h4>Produkt-54</h4>
                                    </div>
                                    <div class="col-6 text-right">
                                      <div class="gradient-button-gold">
                                        <router-link class="p-2" :to="{ name: 'Detail', params: { itemId: 54 } }">Prezerať produkt</router-link>
                                      </div>
                                    </div>
                                  </div>
                                  <h4 class="mt-3">235.00 €</h4>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-12">
                             <div class="card">
                                <div class="card-body">
                                  <img :src="'http://localhost/holes/kobe-brany/files/products/product_3.jpg'"/>
                                  <div class="row mt-3">
                                    <div class="col-6">
                                      <h4>Produkt-15</h4>
                                    </div>
                                    <div class="col-6 text-right">
                                      <div class="gradient-button-gold">
                                        <router-link class="p-2" :to="{ name: 'Detail', params: { itemId: 15 } }">Prezerať produkt</router-link>
                                      </div>
                                    </div>
                                  </div>
                                  <h4 class="mt-3">527.00 €</h4>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-12">
                             <div class="card">
                                <div class="card-body">
                                  <img :src="'http://localhost/holes/kobe-brany/files/products/product_2.jpg'"/>
                                  <div class="row mt-3">
                                    <div class="col-6">
                                      <h4>Produkt-5</h4>
                                    </div>
                                    <div class="col-6 text-right">
                                      <div class="gradient-button-gold">
                                        <router-link class="p-2" :to="{ name: 'Detail', params: { itemId: 5 } }">Prezerať produkt</router-link>
                                      </div>
                                    </div>
                                  </div>
                                  <h4 class="mt-3">405.00 €</h4>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>          
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>