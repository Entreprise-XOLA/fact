<template>
<q-page class="row" style="margin-top:20px;">
  <div class="col-xs-12 col-sm-3 col-md-3"></div>
  <div class="col-xs-12 col-sm-6 col-md-6">
    <q-list dense bordered padding class="rounded-borders">
      <center><div style="font-size: 20px; margin-bottom: 5px;">Ajout d'un utilisateur</div>
      <div class="q-gutter-md" style="max-width: 700px">
        <q-input outlined v-model="nom" style="with: 300px;" label="Entrez le nom de l'utilisateur" :rules="[ myRule ]"/>
      </div><br/>

      <div class="q-gutter-md" style="max-width: 700px">
        <q-input outlined v-model="prenom" style="with: 300px;" label="Entrez le prenom de l'utilisateur" :rules="[ myRule ]"/>
      </div><br/>

      <div class="q-gutter-md" style="max-width: 700px">
        <q-input outlined v-model="tel" style="with: 300px;" label="Entrez le téléphone de l'utilisateur" :rules="[ myRule ]" />
      </div><br/>

      <div class="q-gutter-md" style="max-width: 700px">
        <q-input outlined v-model="ville" style="with: 300px;" label="Entrez la ville" :rules="[ myRule ]" />
      </div><br/>

      <div class="q-gutter-md" style="max-width: 700px">
        <q-input outlined v-model="quartier" style="with: 300px;" label="Entrez le quartier" />
      </div><br/>
      <div class="q-gutter-md" style="max-width: 700px">
        <q-input outlined v-model="email" type="email" label="Entrez l'email" :rules="[ myRule ]" />
      </div><br/>
      <div class="q-gutter-md" style="max-width: 700px">
        <q-select outlined v-model="model" :options="options" class="select" label="Sélectionnez le type d'abonnement" :rules="[ myRule ]"/>
      </div><br/>
      <div class="q-gutter-md" style="max-width: 700px">
      <q-input v-model="password" filled :type="isPwd ? 'password' : 'text'" label="Entrez votre mot de passe" :rules="[ myRule ]">
        <template v-slot:append>
          <q-icon
            :name="isPwd ? 'visibility_off' : 'visibility'"
            class="cursor-pointer"
            @click="isPwd = !isPwd"
          />
        </template>
      </q-input>
      </div><br/>
      <div class="q-gutter-md" style="max-width: 700px">
        <q-btn label="VALIDER" type="submit" color="primary" style="margin-top: 10px"  @click="verifier"/>
        <q-btn label="NON VALIDER" type="reset" color="primary" flat style="text-align:right"  @click="nonverif"/>
      </div>
      </center>
    </q-list>
  </div>
  <div class="col-xs-12 col-sm-3 col-md-3"></div>
  </q-page>
</template>
<style>
@media (max-width: 360px){
  .select{
    width: 150px !important;
  }

}

</style>
<script>
import { Notify } from 'quasar'
export default {
  data () {
    return {
      model: null,
      nom: '',
      prenom: '',
      tel: '',
      ville: '',
      quartier: '',
      email: '',
      password: '',
      text: '',
      isPwd: true,
      options: [
        'Pro', 'Entreprise', 'Grand Compte'
      ]
    }
  },
  methods: {
    verifier () {
       if (this.nom != null && this.prenom != null && this.tel != null &&  this.email != null && this.password != null) {
        const params = new URLSearchParams()
        this.idrole = 5;
        this.idtype = 10;
        this.dateemission = 1999+'-'+10+'-'+10
        this.dateexpiration = 1999+'-'+10+'-'+10
      params.append('idtype', this.idtype)
      params.append('idrole', this.idrole)
      params.append('nom', this.nom)
      params.append('prenom', this.prenom)
      params.append('tel', this.tel)
      //params.append('ville', this.consultVille.idville)
      //params.append('quartier', this.Quartier)
      //params.append('numpiece', this.NumPiece)
      //params.append('contenupiece', this.file)
      params.append('dateemission', this.dateemission)
      params.append('dateexpiration', this.dateexpiration)
      params.append('email', this.email)
      params.append('pwd', this.password)
      //console.log(this.file)
      
       this.$axios.post(`http://localhost/Gestion-Facture/index.php/Gestionfacture/ajout_inscription`, params)
        .then(response => { 
          // envoie des infos
          if (response.data.status === 200) {
            console.log(response.data);
            //localStorage.setItem("idtype", response.data.info.idtype);
            //localStorage.setItem("numpiece", response.data.info.NumPiece);
            localStorage.setItem("nom", response.data.info.nom);
            localStorage.setItem("prenom", response.data.info.prenom);
            localStorage.setItem("tel", response.data.info.tel);
            //localStorage.setItem("quartier", response.data.info.quartier);
            localStorage.setItem("email", response.data.info.email);
          }
          this.$router.push("/accueilparametres");
        this.$q.notify({
        color: "green",
        position: "top",
        message: "Utilisateur créer avec succès.",
        icon: "close"
      });
        })
        .catch(e => {
          this.$q.notify({
            color: "red",
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
    },
    nonverif () {
      this.$router.push('/accueilparametres')
    },

    myRule (val) {
      // simulating a delay

      return new Promise((resolve, reject) => {
        setTimeout(() => {
          // call
          //  resolve(true)
          //     --> content is valid
          //  resolve(false)
          //     --> content is NOT valid, no error message
          //  resolve(error_message)
          //     --> content is NOT valid, we have error message
          resolve(!!val || '* Requis (e)')

          // calling reject(...) will also mark the input
          // as having an error, but there will not be any
          // error message displayed below the input
          // (only in browser console)
        }, 1000)
      })
    }
  }
}
</script>
