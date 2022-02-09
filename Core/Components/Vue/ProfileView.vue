<template>
  <div class='container'>
    <div class='main-body'>
      <div class='row gutters-sm'>
        <div class='col-md-4 mb-3'>
          <div class='card'>
            <div class='card-body'>
              <div class='d-flex flex-column align-items-center text-center'>
                <img 
                  :src="'http://localhost/'+ this.dir +'/files/'  + this.fileDir + '/' + data['avatar']" 
                  class='rounded-circle' width='150'
                />
                <div class='mt-3'>
                  <h4>{{ data.first_name }} {{ data.last_name }}</h4>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class='col-md-8'>
          <div class='card mb-3'>
            <div class='card-body'>
              <div class='row'>
                <div class='col-sm-3'>
                  <h6 class='mb-0'>Meno</h6>
                </div>
                <div class='col-sm-9 text-secondary'>
                  {{ data.first_name }}
                </div>
              </div>
              <hr>
              <div class='row'>
                <div class='col-sm-3'>
                  <h6 class='mb-0'>Priezvisko</h6>
                </div>
                <div class='col-sm-9 text-secondary'>
                   {{ data.last_name }}
                </div>
              </div>
              <hr>
              <div class='row'>
                <div class='col-sm-3'>
                  <h6 class='mb-0'>E-mail</h6>
                </div>
                <div class='col-sm-9 text-secondary'>
                   {{ data.email }}
                </div>
              </div>
              <hr>
              <div class='row'>
                <div class='col-sm-12'>
                  <a class='btn btn-info ' target='__blank' href='https://www.bootdey.com/snippets/view/profile-edit-data-and-skills'>Edit</a>
                </div>
              </div>
            </div>
          </div>

          <div class='row gutters-sm'>
            <div class='col-sm-6 mb-3'>
              <div class='card h-100'>
                <div class='card-body'>
                  <h6 class='d-flex align-items-center mb-3'><i class='material-icons text-info mr-2'>assignment</i>Project Status</h6>
                  <small>Web Design</small>
                  <div class='progress mb-3' style='height: 5px'>
                    <div class='progress-bar bg-primary' role='progressbar' style='width: 80%' aria-valuenow='80' aria-valuemin='0' aria-valuemax='100'></div>
                  </div>
                  <small>Website Markup</small>
                  <div class='progress mb-3' style='height: 5px'>
                    <div class='progress-bar bg-primary' role='progressbar' style='width: 72%' aria-valuenow='72' aria-valuemin='0' aria-valuemax='100'></div>
                  </div>
                  <small>One Page</small>
                  <div class='progress mb-3' style='height: 5px'>
                    <div class='progress-bar bg-primary' role='progressbar' style='width: 89%' aria-valuenow='89' aria-valuemin='0' aria-valuemax='100'></div>
                  </div>
                  <small>Mobile Template</small>
                  <div class='progress mb-3' style='height: 5px'>
                    <div class='progress-bar bg-primary' role='progressbar' style='width: 55%' aria-valuenow='55' aria-valuemin='0' aria-valuemax='100'></div>
                  </div>
                  <small>Backend API</small>
                  <div class='progress mb-3' style='height: 5px'>
                    <div class='progress-bar bg-primary' role='progressbar' style='width: 66%' aria-valuenow='66' aria-valuemin='0' aria-valuemax='100'></div>
                  </div>
                </div>
              </div>
            </div>
            <div class='col-sm-6 mb-3'>
              <div class='card h-100'>
                <div class='card-body'>
                  <h6 class='d-flex align-items-center mb-3'><i class='material-icons text-info mr-2'>assignment</i>Project Status</h6>
                  <small>Web Design</small>
                  <div class='progress mb-3' style='height: 5px'>
                    <div class='progress-bar bg-primary' role='progressbar' style='width: 80%' aria-valuenow='80' aria-valuemin='0' aria-valuemax='100'></div>
                  </div>
                  <small>Website Markup</small>
                  <div class='progress mb-3' style='height: 5px'>
                    <div class='progress-bar bg-primary' role='progressbar' style='width: 72%' aria-valuenow='72' aria-valuemin='0' aria-valuemax='100'></div>
                  </div>
                  <small>One Page</small>
                  <div class='progress mb-3' style='height: 5px'>
                    <div class='progress-bar bg-primary' role='progressbar' style='width: 89%' aria-valuenow='89' aria-valuemin='0' aria-valuemax='100'></div>
                  </div>
                  <small>Mobile Template</small>
                  <div class='progress mb-3' style='height: 5px'>
                    <div class='progress-bar bg-primary' role='progressbar' style='width: 55%' aria-valuenow='55' aria-valuemin='0' aria-valuemax='100'></div>
                  </div>
                  <small>Backend API</small>
                  <div class='progress mb-3' style='height: 5px'>
                    <div class='progress-bar bg-primary' role='progressbar' style='width: 66%' aria-valuenow='66' aria-valuemin='0' aria-valuemax='100'></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

var diaProfileView = Object();

export default {
  props: ['params'],
  data() {
    return Object.assign(diaProfileView, {
    })
  },
  beforeCreate() {
    diaProfileView = new Dia();
  },
  beforeMount() {
    diaProfileView.setComponentParams(this);
    diaProfileView.setComponentData(this, 'dia_logged_user');
  }
}
</script>