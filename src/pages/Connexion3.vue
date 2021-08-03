<template>
  <div>
    <center>
    <div style="background: linear-gradient(#4EE5A2, #0A0701); background-size: cover; background-size: cover !important;">
    
    <div class="logo">
      <div style=""></div>
      <img src="../assets/geversetrans.png" style="height: 110px; max-width: 150px;margin-top:20px;"/>
    </div>

    <div  class="text-grey text-h4" style="margin-top:20px;margin-bottom:20px">
    <div>
       GEVERSE-TRANS TOGO
    </div>
    </div>
    </div>
      <div class="q-pa-md">
      <div>
        <q-form @submit="postLogin" @reset="onReset">
          <q-input
            outlined
            v-model="name"
            label="Email"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'L\'email est obligatoire']"
          >
            <template v-slot:prepend>
              <q-icon name="person" />
            </template>
          </q-input>
          <q-input
            outlined
            v-model="password"
            type="password"
            label="Password"
            lazy-rules
            :rules="[ val => !!val  || '*Le mot de passe est obligatoire' ,val => val.length < 16 || 'Maximum 16 charactères'] "
          >
            <template v-slot:prepend>
              <q-icon name="lock" />
            </template>
          </q-input>
          <div class="row">
            <div class="col-xs-7 col-sm-9 col-md-9" style="text-align:left;">
              <q-checkbox v-model="teal" label="Rester connecter" />
            </div>
          </div>
          <div class="row" style="margin:auto; display: inline-flex;">
            <div class="col-xs-5 col-sm-3 col-md-3" style="text-align:right;">
              <q-btn
                color="primary"
                text-color="white"
                label="Connexion"
                type="submit"
              />
            </div>
          </div>
          <div class="row" style="margin-top: 10px;">
            <div class="col-xs-7 col-sm-9 col-md-9" style="text-align:left;" @click="motdepasse">
               <q-chip color="white" text-color="grey" icon="lock" dense style=" margin-left:0px; margin-right:0px;">
                Mot de passe oublié?
              </q-chip>
            </div>
            <div class="col-xs-5 col-sm-3 col-md-3" style="text-align:right;" @click="inscription">
              <q-chip color="white" text-color="grey" icon="" dense style=" margin-left:0px; margin-right:0px;">
                Créer un compte
              </q-chip>
            </div>
          </div>
        </q-form>
      </div>
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
