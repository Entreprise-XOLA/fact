<template>
  <div>
    <center>
    <div style="background: linear-gradient(#f9eac8, #c95514); background-size: cover !important;">
    <div class="logo">
        <img src="../assets/geversetrans.png" style="height: 110px; max-width: 150px;margin-top:20px;"/>
    </div>
    <div  class="text-h4" style="margin-top:20px;margin-bottom:20px; color: 423b21;">
    <div>
       GEVERSE-TRANS TOGO
    </div>
    </div>
    </div>
    <div>
      <div>
        <q-form @submit="onSubmit">
          <h6 style="text-align:center;margin-bottom:10px">
            <strong>Inscription</strong>
          </h6>
      <!-- Debut de step -->
        <div class="q-pa-md">
        <q-stepper
          v-model="step"
          header-nav
          ref="stepper"
          color="primary"
          animated
        >
          <q-step
            :name="1"
            :done="step > 1"
            title="Pays"
            :header-nav="step > 1"
          >
            <q-select standout="bg-grey text-white" v-model="pays" :options="infopays" label="Choisir le pays" />
          </q-step>

          <q-step
            :name="2"
            :done="step > 2"
            title="Nom"
            :header-nav="step > 2"
          >
            <q-input
              :loading="loadingState"
              filled
              v-model="nom"
              label="Nom"
              :rules="[
              val => !!val || '* Champ requis',
              val => val.length > 2 || 'Saisissez au moins 2 caractères',
            ]"
          lazy-rules
            />
          </q-step>

          <q-step
            :name="3"
            :done="step > 3"
            title="Prenom"
            
          >
            <q-input
              :loading="loadingState"
              filled
              v-model="firstname"
              label="Prénoms"
              :rules="[
              val => !!val || '* Champ requis',
              val => val.length > 2 || 'Saisissez au moins 2 caractères',
            ]"
          lazy-rules
            />
          </q-step>

          <q-step
            :name="4"
            title="Telephone"
          ><!--
          <vue-tel-input v-model="Telephone"></vue-tel-input>
          -->
           <q-input
              filled
              v-model="Telephone"
              label="Téléphone"
              type="phone"
              mask="(+228) ##-##-##-##"
              hint="Sous forme de: (+228) ##-##-##-##"
            />
            
          </q-step>

          <q-step
            :name="5"
            title="Email"
          >
            <q-input :rules="[
                val => !!val || '* Champ requis',
                val => val.length > 6 || 'L\'email doit respecter le format d\'email',
              ]"
            lazy-rules filled v-model="email" type="email" prefix="Email:">
              <template v-slot:prepend>
                <q-icon name="mail" />
              </template>
            </q-input>
          </q-step>
          <q-step
            :name="6"
            title="Mot de passe"
          >
          <q-input v-model="password" filled :type="isPwd ? 'password' : 'text'" label="Mot de passe">
            <template v-slot:append>
              <q-icon
                :name="isPwd ? 'visibility_off' : 'visibility'"
                class="cursor-pointer"
                @click="isPwd = !isPwd"
              />
            </template>
          </q-input>
          </q-step>
          <template v-slot:navigation>
            <q-stepper-navigation>
              <q-btn @click="valid" color="primary" :label="step === 6 ? 'Envoyer' : 'Suivant'" type="submit"/>
              <q-btn v-if="step > 1" flat color="primary" @click="$refs.stepper.previous()" label="Retour" class="q-ml-sm" />
            </q-stepper-navigation>
          </template>
        </q-stepper>
      </div>
  <!-- Fin de step -->
  <div>
    <a href="#/" style="padding-top: 10px; text-decoration: none; text-underline: none; color: grey">Vous disposez déjà d'un compte ?</a>
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
.q-stepper__tab.col-grow.flex.items-center.no-wrap.relative-position {
  visibility: hidden;
}
.q-stepper__header.row.items-stretch.justify-between.q-stepper__header--standard-labels.q-stepper__header--border
{
  display: none;
}
.q-stepper {
    box-shadow: 0 0px 0px rgba(255, 255, 255, 255), 0 0px 0px rgba(255, 255, 255, 255), 0 0px 0px 0px rgba(255, 255, 255, 255) !important;
}
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
import { Notify } from "quasar";
//import { VueTelInput } from 'vue-tel-input'
export default {
  name: 'PageConnexion',
  components: {
        //VueTelInput,
    },
  data () {
    return {
      errors: [],
      step: 1,
      nom: null,
      firstname: null,
      infopays: [
        'TOGO'
      ],
      pays: null,
      password: null,
      loadingState: false,
      Telephone: null,
      datenaissance: '2000/01/01',
      lieunaissance: null,
      adresscomplet: null,
      email: null,
      Ville: null,
      Quartier: null,
      NumPiece: null,
      isPwd: true,
      teal: true,
      orange: false,
      postBody: null,
      //file: '',
      model: null,
      infolibelle: null,
      infoville: null,
      consultVille: null,
      dateemission: '2020/06/22',
      dateexpiration: '2021/01/01',
      required: false,
      consultlibelle: null
    }
  },
  mounted () {
      this.idrole = 4;
      this.idtype = 0;
      console.log(this.idrole); console.log(this.idtype)
  },
  methods: {
    valid() {
      this.$refs.stepper.next()
    },
    onSubmit () {
      if (this.nom != null && this.firstname != null && this.Telephone != null &&  this.email != null && this.password != null) {
        const params = new URLSearchParams()
      params.append('idtype', this.idtype)
      params.append('idrole', this.idrole)
      params.append('nom', this.nom)
      params.append('prenom', this.firstname)
      params.append('tel', this.Telephone)
      //params.append('ville', this.consultVille.idville)
      params.append('quartier', this.Quartier)
      params.append('numpiece', this.NumPiece)
      //params.append('contenupiece', this.file)
      params.append('dateemission', this.dateemission)
      params.append('dateexpiration', this.dateexpiration)
      params.append('email', this.email)
      params.append('pwd', this.password)
      //console.log(this.file)
      console.log(this.email)
      
       this.$axios.post(`http://localhost/Gestion-Facture/index.php/Gestionfacture/ajout_inscription`, params)
        .then(response => { 
          // envoie des infos
          if (response.data.status === 201) {
            console.log(response.data);
            localStorage.setItem("idtype", response.data.info.idtype);
            localStorage.setItem("numpiece", response.data.info.NumPiece);
            localStorage.setItem("nom", response.data.info.nom);
            localStorage.setItem("prenom", response.data.info.prenom);
            localStorage.setItem("tel", response.data.info.telephone);
            localStorage.setItem("quartier", response.data.info.quartier);
            localStorage.setItem("email", response.data.info.email);
          }
        this.$q.notify({
        color: "primary",
        position: "top",
        message: "Votre demande a été envoyé avec succès.",
        icon: "close"
      });
      this.$router.push("/");
        })
        .catch(e => {
          Notify.notify({
            color: "positive",
            position: "top",
            message: "Erreur de chargement de la page",
            icon: "report_problem"
          });
        });
      } else {
        this.$q.notify({
          color: "negative",
          position: "top",
          message: "Veuillez remplir tous les champs",
          icon: "close"
      });
      }
      //
    }
  }
}
</script>
