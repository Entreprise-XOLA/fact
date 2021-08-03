<template>
  <div>
    <center>
    <div style="background: linear-gradient(#f9eac8, #c95514); background-size: cover !important;">
    <div class="logo">
        <img src="../assets/geversetrans.png" style="height: 110px; max-width: 150px;margin-top:20px;"/>
    </div>
    <div  class="text-grey text-h4" style="margin-top:20px;margin-bottom:20px">
    <div>
       NEPTUNE
    </div>
    </div>
    </div>
      <div class="q-pa-md">
      <div>
        <q-form @submit="Envoie" @reset="onReset" >
          <h6>
            <strong>Générer un mot de passe</strong>
          </h6>
          <q-input standout v-model="email" type="email" prefix="Email:">
        <template v-slot:prepend>
          <q-icon name="mail" />
        </template>
      </q-input><br/>
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
    margin-top: 0px;
}
}
@media (max-width: 768px){
.q-gutter-y-md, .q-gutter-md {
    margin-top: 0px;
}
}
</style>

<script>
export default {
  name: 'PageRecuperationMotdepasse',
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
      params.append('username', this.name)
      params.append('password', this.password)
      this.$router.push('/accueil')
    },
    inscription () {
      this.$router.push('/nouveauCode')
    }
  }
}
</script>
