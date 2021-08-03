<template>
  <div class="row">
    <div class="col-7" style="background-color: #f9eac8;">
      <div class="row">
        <div class="col-3">
          <div class="logo">
            <div style=""></div>
            <img src="../assets/geversetrans.png" style="height: 110px; max-width: 150px;margin-left:110px; margin-top:15px;"/>
          </div>
        </div>
        <div class="col-9">
          <div  class="text-grey text-h4" style="margin-top:60px;margin-bottom:20px">
            <div>
              GEVERSE-TRANS TOGO
            </div>
          </div>
        </div>
      </div>
      <center>
      <div class="row">
        <img src="../assets/2871679-02.png" style="height: 570px; max-width: 1000px;margin-top:20px;margin-left: 80px;"/>
      </div>
      </center>
    </div>
    <div class="col-5" style="background-color: #c95514;">
      <center>
      <div class="q-pa-md" style="margin-top:90px;">
        <center>
        <div class="" style="transform: translateY(50%);">
              <img
              src="../assets/2871679-04.png"  style="border-radius: 50px; background-color:red;"
            />
        </div>
        </center>
      <div>
        <div style="margin-top:80px;"></div>
        <q-form @submit="postLogin" @reset="onReset">
          <q-input
            rounded
            outlined
            v-model="name"
            label-color="white"
            label="Email"
            standout="bg-blue text-white"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'L\'email est obligatoire']"
          >
            <template v-slot:prepend>
              <q-icon name="person"  color="white"/>
            </template>
          </q-input>
          <q-input
            rounded
            outlined
            v-model="password"
            type="password"
            label-color="white"
            label="Password"
            standout="bg-blue text-white"
            lazy-rules
            :rules="[ val => !!val  || '*Le mot de passe est obligatoire' ,val => val.length < 16 || 'Maximum 16 charactères'] "
          >
            <template v-slot:prepend>
              <q-icon name="lock" color="white"/>
            </template>
          </q-input>
          <div class="row">
            <div class="col-xs-7 col-sm-9 col-md-9" style="text-align:left; color: white;">
              <q-checkbox v-model="teal" label="Rester connecter" />
            </div>
          </div>
          <center>
          <div class="row" style="margin:auto; display: inline-flex;">
            <div class="col-xs-5 col-sm-3 col-md-3" style="text-align:right;">
              <q-btn
                rounded
                color="primary"
                text-color="white"
                label="Connexion"
                type="submit"
              />
            </div>
          </div>
          </center>
          <div class="row" style="margin-top: 10px;">
            <div class="col-xs-7 col-sm-9 col-md-9" style="text-align:left;" @click="motdepasse">
               <div icon="" dense style=" margin-left:0px; margin-right:0px; color: white;">
                Mot de passe oublié
              </div>
            </div>
            <div class="col-xs-5 col-sm-3 col-md-3" style="text-align:right;" @click="inscription">
              <div icon="" dense style=" margin-left:0px; margin-right:0px; color: white;">
                Créer un compte
              </div>
            </div>
          </div>
        </q-form>
      </div>
    </div>
    </center>
    </div>
    <center>
    <div style="background: linear-gradient(#4EE5A2, #0A0701); background-size: cover; background-size: cover !important;">
    
    </div>
      
      </center>
  </div>
</template>

<style lang="stylus" scoped>
.q-pa-md
  width 100%
  max-width:500px
</style>
<style>
@media (max-width: 360px){
.q-gutter-y-md, .q-gutter-md {
    margin-top: 143px;
}
}
@media (max-width: 768px){
.q-gutter-y-md, .q-gutter-md {
    margin-top: 143px;
}
}
</style>

<script>

export default {
  name: 'PageConnexion',
  data () {
    return {
      name: null,
      password: null,
      teal: true,
      orange: false,
      postBody: null
    }
  },
  methods: {
    onReset () {
      this.name = null
      this.password = null
      this.accept = false
    },
    postLogin () {
      const params = new URLSearchParams()
      params.append('email', this.name)
      params.append('pwd', this.password)
      this.$axios.post(`http://localhost/Gestion-Facture/index.php/Gestionfacture/login1`, params)
        .then((response) => {
          if (response.data.status === 200) {
          this.presences = response.data.infos
          console.log(response.data)
          this.$router.push('/codeat2')
          }
        })
        .catch(() => {
          this.$q.notify({
            color: 'negative',
            position: 'top',
            message: 'Erreur de chargement de la page',
            icon: 'report_problem'
          })
        })
    },
    inscription () {
      this.$router.push('/nouveauCode')
    },
    motdepasse () {
      //this.$router.push('/')
    }
  }
}
</script>
