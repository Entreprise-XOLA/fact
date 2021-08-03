<template>
<div id="q-app">
  <!--  -->
  <q-form @formchange="enregistreinfoentete">
    <div class="row">
        <div class="col-6" style="margin-top: 18px; text-align: right;">FACTURE N° : </div>
        <div class="col-6"><q-input borderless v-model="numefacture"  id="numfact" @change="numerofacture()"/></div>
        
    </div>
    <div class="row">
      <div class="col">
        <q-card
        >
          <q-card-section 
          class="my-card text-white"
          style="background: radial-gradient(circle, #35a2ff 0%, #014a88 100%)">
            <div class="text-h6">RUBRIQUE DECLARATION</div>
          </q-card-section>
        <q-form @mouseleave="enregistrementdeclaration">
          <q-card-section class="q-pt-none" style="margin-top: 10px;">
            <div class="row">
              <div class="col-3" style="margin-top: 20px;">Régime</div>
              <div class="col-9">
                <q-input outlined v-model="regime" label="Description du régime">
                </q-input>
              </div>
            </div><hr/>
            <div class="row">
              <div class="col-3" style="margin-top: 20px;">CONCERNE</div>
              <div class="col-9">
                <q-input outlined v-model="concerne" label="Détail du concerne">
                </q-input>
              </div>
            </div><hr/>
            <div class="row">
              <div class="col-3" style="margin-top: 20px;">Destination</div>
              <div class="col-9">
                <q-input outlined v-model="description" label="Détail sur la destination" @change="descriptiondeclaration()">
                </q-input>
              </div>
            </div><hr/>
            <div class="row">
              <div class="col-3" style="margin-top: 20px;">Poids brut</div>
              <div class="col-9">
                <q-input outlined v-model="poidsbrut" label="Entrer le poids brut" @change="endpoidbrut()">
                </q-input>
              </div>
            </div><hr/>
            <div class="row">
              <div class="col-3" style="margin-top: 20px;">Poids Net</div>
              <div class="col-9">
                <q-input outlined v-model="poidsnet" label="Entrer le poids net" @change="endpoids()">
                </q-input>
              </div>
            </div>
          </q-card-section>
        </q-form>
        </q-card>
      </div>
      <div class="col">
        <q-card
        >
          <q-card-section class="my-card text-white"
          style="background: radial-gradient(circle, #35a2ff 0%, #014a88 100%)">
            <div class="text-h6">RUBRIQUE CLIENT</div>
          </q-card-section>
        <q-form @mouseleave="enregistrementclient">
          <q-card-section class="q-pt-none" style="margin-top: 8px;">
            <div class="row">
              <div class="col-3" style="margin-top: 20px;">Client</div>
              <div class="col-9">
                <q-input outlined v-model="nom" label="Saisissez le client" @change="nomclient()">
                </q-input>
              </div>
            </div><hr/>
            <!--<hr style="margin-top: 0px;margin-bottom: 0px;"/>
            <div class="row">
              <div class="col-3" style="margin-top: 20px;">NIF</div>
              <div class="col-9">
                <q-input outlined v-model="nif" label="Entrer le numéro NIF">
                </q-input>
              </div>
            </div><hr style="margin-top: 0px;margin-bottom: 0px;"/>
            <div class="row">
              <div class="col-3" style="margin-top: 20px;">Adresse</div>
              <div class="col-9">
                <q-input outlined v-model="adresse" label="Entrer l'adresse">
                </q-input>
              </div>
            </div><hr style="margin-top: 0px;margin-bottom: 0px;"/>
            <div class="row">
              <div class="col-3" style="margin-top: 20px;">BP, Téléphone</div>
              <div class="col-9">
                <q-input outlined v-model="bp" label="Entrer la boite postale, le teléphone">
                </q-input>
              </div>
            </div><hr style="margin-top: 0px;margin-bottom: 0px;"/>
            <div class="row">
              <div class="col-3" style="margin-top: 20px;">Email</div>
              <div class="col-9">
                <q-input outlined v-model="email" label="Saisissez l'email" @change="emailclient()">
                </q-input>
              </div>
            </div><hr style="margin-top: 0px;margin-bottom: 0px;"/>
            -->
            <div class="row">
              <div class="col-3" style="margin-top: 20px;">Reductions commerciales</div>
              <div class="col-9">
                <q-input outlined v-model="client" label="Entrer la réduction pour le client" @change="reductionclient()">
                </q-input>
              </div>
            </div>
          </q-card-section>
        </q-form>
        </q-card>
        <div class="row" style="margin-top: 20px !important; padding-left: 300px; padding-right: 0px !important;">
          Lomé, le {{this.formattedString}}
        </div>
      </div>
    </div>
  </q-form>
  <!--
    <div class="row" style="margin-top: 20px;">
      <div class="col-9"></div>
      <div class="col-3">Lomé, le {{this.formattedString}}</div>
    </div>
    -->
    <div class="row" style="margin-top: 20px;">
      <div class="col-8" style="margin-top: 18px; text-align: right;">N°_ </div>
      <div class="col-1">
      <q-select style="width: 85px;" borderless v-model="typefact" :options="options" stack-label />
      </div>  
      <div class="col-3" style="text-align: left;"><q-input borderless v-model="numefacture2"  id="numfact2" @change="numerofacturefunc2()"/></div>   
    </div>
  <div class="q-pa-md">
    <q-table
      title="Treats"
      :data="data"
      :columns="columns"
      row-key="id"
      :filter="filter"
      :loading="loading"
      selection="single"
      :selected.sync="selected"
    >

      <template v-slot:top>
        <q-btn color="primary" :disable="loading" label="Modifier Frais de douane" @click="showSelectedfd(selected)"></q-btn>
        <q-btn class="q-ml-sm" color="red" :disable="loading" label="Supprimer Frais de douane" @click="removeRowfd(selected)"></q-btn>
        <q-space></q-space>
        <q-input borderless dense debounce="300" color="primary" v-model="filter">
          <template v-slot:append>
            <q-icon name="search"></q-icon>
          </template>
        </q-input>
      </template>

    </q-table>
    <!--
     <div class="q-mt-md">
      Selected: {{ JSON.stringify(selected) }}
    </div>
    -->
  </div>
  <center>
    <q-form @submit="ajoutfraisdouane" >
  <div class="row justify-center">
    <div class="col-4">
      <q-input outlined v-model="designationfd" label="Entrer la désignation" />
    </div><br/><br/><br/><br/>
    <div class="col-1">
      <q-input outlined v-model="quantitefd" label="Quantité" />
    </div><br/>
    <div class="col-2">
      <q-input outlined v-model="puhtfd" label="Prix unitaire HT" />
    </div><br/>
    <div class="col-3" style="margin-top: 10px !important;">
      <q-btn color="green" :disable="loading" label="Ajouter frais de douane" type="submit"></q-btn>
    </div>
  </div>
</q-form>
  </center>
  <div class="q-pa-md">
    <q-table
      title="Treats"
      :data="data1"
      :columns="columns"
      row-key="id"
      :filter="filter"
      :loading="loading"
      selection="single"
      :selected.sync="selected"
    >

      <template v-slot:top>
        <q-btn color="primary" :disable="loading" label="Modifier autres débours" @click="showSelectedad(selected)"></q-btn>
        <q-btn class="q-ml-sm" color="red" :disable="loading" label="Supprimer autres débours" @click="removeRowad(selected)"></q-btn>
        <q-space></q-space>
        <q-input borderless dense debounce="300" color="primary" v-model="filter">
          <template v-slot:append>
            <q-icon name="search"></q-icon>
          </template>
        </q-input>
      </template>

    </q-table>
    <!--
     <div class="q-mt-md">
      Selected: {{ JSON.stringify(selected) }}
    </div>
    -->
  </div>
  <q-form @submit="ajoutautresdebours" >
  <center>
  <div class="row justify-center">
    <div class="col-4">
      <q-input outlined v-model="designationad" label="Entrer la désignation" />
    </div><br/><br/><br/><br/>
    <div class="col-1">
      <q-input outlined v-model="quantitead" label="Quantité" />
    </div><br/>
    <div class="col-2">
      <q-input outlined v-model="puhtad" label="Prix unitaire HT" />
    </div><br/>
    <div class="col-3" style="margin-top: 10px !important;">
      <q-btn color="green" :disable="loading" label="Ajouter autres débours" type="submit"></q-btn>
    </div>
  </div>
  </center>
  </q-form>
  <div class="q-pa-md">
    <q-table
      title="Treats"
      :data="data2"
      :columns="columns"
      row-key="id"
      :filter="filter"
      :loading="loading"
      selection="single"
      :selected.sync="selected"
    >

      <template v-slot:top>
        <q-btn color="primary" :disable="loading" label="Modifier l'honoraire" @click="showSelected(selected)"></q-btn>
        <q-btn class="q-ml-sm" color="red" :disable="loading" label="Supprimer l'honoraire" @click="removeRow(selected)"></q-btn>
        <q-space></q-space>
        <q-input borderless dense debounce="300" color="primary" v-model="filter">
          <template v-slot:append>
            <q-icon name="search"></q-icon>
          </template>
        </q-input>
      </template>

    </q-table>
    <!--
     <div class="q-mt-md">
      Selected: {{ JSON.stringify(selected) }}
    </div>
    -->
  </div>
  <center>
    <q-form @submit="ajouthonoraires" >
  <div class="row justify-center">
    <div class="col-4">
      <q-input outlined v-model="designationho" label="Entrer la désignation" />
    </div><br/><br/><br/><br/>
    <div class="col-1">
      <q-input outlined v-model="quantiteho" label="Quantité" />
    </div><br/>
    <div class="col-2">
      <q-input outlined v-model="puhtho" label="Prix unitaire HT" />
    </div><br/>
    <div class="col-3" style="margin-top: 10px !important;">
      <q-btn color="green" :disable="loading" label="Ajouter honoraires" type="submit"></q-btn>
    </div>
  </div>
    </q-form>
  </center>
<div class="row" style="margin-bottom: 30px;">
  <div class="col-3"></div>
  <div class="col-3" style="margin-right: 0px; padding-right: 0px;">
    <q-btn color="amber" :disable="loading" label="Aperçu avant impression" style="color: white; text-transform: none; font-weight : bold;" @click="apercuavtimpression"></q-btn>
  </div>
      <div class="col-3">
          <!-- Rubrique des  -->
          <!--
          <div class="row justify-center" style="visibility: hidden;">
            <div class="col-4">
              <q-input outlined v-model="designationre" label="Ajouter une réduction" />
            </div>
            <div style="margin-left:10px;">
            </div>
            <div class="col-4">
              <q-btn color="green" :disable="loading" label="Ajouter une réduction Commerciale" @click="ajtreductioncommercial"></q-btn>
            </div>
          </div><br/>
          -->
          <q-btn color="deep-orange" :disable="loading" label="Imprimer" style="color: white; width: 220px; text-transform: none; font-weight : bold;" @click="imprimer"></q-btn>
      </div>
      <!--
      <div class="col-5" style="padding-right: 20px;">
        <q-markup-table separator="vertical">
      <tbody>
        <tr>
          <td class="text-left">MONTANT HT</td>
          <td class="text-right">159 000 000</td>
        </tr>
        <tr>
          <td class="text-left">REDUCTION COMMERCIALES</td>
          <td class="text-right">237 000 000</td>
        </tr>
        <tr>
          <td class="text-left">MONTANT NET HT</td>
          <td class="text-right">262 000 000</td>
        </tr>
        <tr>
          <td class="text-left">TVA SUR HONORAIRES(18%)</td>
          <td class="text-right">305 000 000</td>
        </tr>
        <tr>
          <td class="text-left">MONTANT TTC</td>
          <td class="text-right">356 000 000</td>
        </tr>
      </tbody>
    </q-markup-table>
      </div>
      -->
    </div>
    <div class="col-3"></div>
</div>
</template>

<script>
import { date } from 'quasar'
export default {
 data () {
    return {
      loading: false,
      numefacture: null,
      options: [
        'Facture', 'BL'
      ],
      typefact: null,
      text: '',
      regime: null,
      concerne: null,
      description: null,
      poidsbrut: null,
      poidsnet: null,
      client: null,
      nom: null,
      nif: null,
      adresse: null,
      bp: null,
      email: null,
      designationfd: null,
      quantitefd: null,
      numefacture2: null,
      puhtfd: null,
      designationad: null,
      quantitead: null,
      puhtad: null,
      designationho: null,
      designationre: null,
      quantiteho: null,
      puhtho: null,
      filter: '',
      selected: [],
      rowCount: 10,
      columns: [
        { name: 'designation', align: 'center', label: 'DESIGNATION', field: 'designation', sortable: true },
        { name: 'quantite', label: 'QUANTITE', field: 'quantite', sortable: true },
        { name: 'puht', label: 'PRIX UNITAIRE HT', field: 'puht' },
        { name: 'tht', label: 'TOTAL HT', field: 'tht' }
      ],
      data: [
        {
          ref: '1',
          designation: 'TEL Brigade + Port',
          quantite: 6.0,
          puht: 24,
          tht: 6.0*24
        },
        {
          id: 2,
          ref: '2',
          designation: 'Facture Togo Terminal',
          quantite: 7.0,
          puht: 28,
          tht: 7.0*28
        }
      ],
      data1: [
        {
          id: 2,
          ref: '1',
          designation: 'Visa scanner',
          quantite: 6.0,
          puht: 24,
          tht: 6.0*24
        }
      ],
      data2: [
        {
          id: 3,
          ref: '1',
          designation: 'Forfait honoraires',
          quantite: 6.0,
          puht: 24,
          tht: 6.0*24
        }
      ],
      original: [],
      formattedString: null
    }
  },
  mounted () {
    let timeStamp = Date.now()
    this.formattedString = date.formatDate(timeStamp, 'DD MMMM YYYY')
    console.log(this.formattedString);
    /*
    this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/retour_numfacture')
        .then((response) => {
          this.numefacture = response.data.infos.numfacture
          this.idfacture = response.data.infos.idfacturetemp
          // this.graph = true
          console.log(this.numefacture);console.log(this.idfacture)
        })
        .catch(() => {
          this.$q.notify({
            color: 'negative',
            position: 'top',
            message: 'Erreur de chargement de la page',
            icon: 'report_problem'
          })
        })
        */
  },
  methods: {
    // emulate fetching data from server
    showSelectedfd(id) {
      alert(id[0].id);
    },
    numerofacturefunc2(){
      console.log(this.numefacture2);
      console.log(this.idfacture);
      //this.idfacture = localStorage.getItem("idfacture");
      //insertion et modification de num bl et fact

      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/modification_numfacture2?idfacturetemp='+this.idfacture+'&numfacture2='+this.numefacture2)
        .then((response) => {
          this.numefacture2 = response.data.infos.numfacture2
          // this.graph = true
          console.log(this.numefacture2)
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
    removeRowfd(id) {
      alert(id[0].id);
    },
    ajoutfraisdouane() {
            if (this.designationfd != null && this.quantitefd != null && this.puhtfd != null) {
      const params = new URLSearchParams()
      this.idtype = 1
      params.append('idfacturetemp', this.idfacture)
      params.append('idtype', this.idtype)
      params.append('designation', this.designationfd)
      params.append('quantite', this.quantitefd)
      params.append('prixunitaire', this.puhtfd)
      this.$axios.post(`http://localhost/Gestion-Facture/index.php/Gestionfacture/ajout_factdetailtemp`, params)
        .then((response) => {
          if (response.data.status === 201) {
          this.presences = response.data.infos
          console.log(response.data)
          }
          this.$q.notify({
            color: "green",
            position: "top",
            message: "Enregistrement effectué avec succès",
            icon: "close"
          });
          this.designationfd = null,
          this.quantitefd = null,
          this.puhtfd = null
        })
        .catch(() => {
          this.$q.notify({
            color: 'negative',
            position: 'top',
            message: 'Erreur de chargement de la page',
            icon: 'report_problem'
          })
        })
        } else {
        this.$q.notify({
          color: "negative",
          position: "top",
          message: "Veuillez remplir tous les champs SVP",
          icon: "close"
      });
      }
    },
    endpoids() {
      this.enregistreinfoentete();
    },
    endpoidbrut() {
      this.enregistreinfoentete();
    },
    numerofacture(){
      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/modification_numfacture?idfacturetemp='+this.idfacture+'&numfacture='+this.numefacture)
        .then((response) => {
          //this.numefacture = response.data.infos.numfacture
          // this.graph = true
          console.log(this.numefacture)
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
    enregistrementdeclaration() {
      //console.log(this.regime);console.log(this.concerne);console.log(this.description);console.log(this.poidsbrut);console.log(this.poidsnet)
      console.log("rubrique declaration");
    },
    descriptiondeclaration() {
      console.log("description declaration");
      //this.enregistrementclient();
      this.enregistreinfoentete();
    },
    nomclient() {
      console.log("email client");
      //this.enregistrementclient();
      this.enregistreinfoentete();
    },
    emailclient() {
      console.log("email client");
      //this.enregistrementclient();
      this.enregistreinfoentete();
    },
    reductionclient() {
      console.log("rurique client");
      //this.enregistrementclient();
      this.enregistreinfoentete();
    },
    enregistrementclient(){
      console.log("coucou");
    },
    enregistreinfoentete() {
      console.log(this.idfacture);console.log(this.regime);console.log(this.concerne);console.log(this.description);console.log(this.poidsbrut);console.log(this.poidsnet)
      //console.log("tocart");
      /*
      if (this.regime != null && this.concerne != null && this.description != null &&  this.poidsbrut != null && this.nom != null && this.nif != null && this.adresse != null && this.bp != null && this.email != null && this.client != null) {
      const params = new URLSearchParams()
      params.append('declaration', this.regime)
      params.append('concerne', this.concerne)
      params.append('bureaudest', this.description)
      params.append('poids', this.poidsbrut)
      params.append('nom', this.nom)
      params.append('nif', this.nif)
      params.append('adresse', this.adresse)
      params.append('bp', this.bp)
      params.append('telephone', this.bp)
      params.append('email', this.email)
      params.append('reduction', this.client)
      this.$axios.post(`http://localhost/Gestion-Facture/index.php/Gestionfacture/update_facturetemp`, params)
        .then((response) => {
          if (response.data.status === 201) {
          this.presences = response.data.infos
          console.log(response.data)
          }
          this.$q.notify({
            color: 'green',
            position: "top",
            message: "Enregistrement temporaire de la rubrique client/déclaration avec succès",
            icon: "close"
          });
        })
        .catch(() => {
          this.$q.notify({
            color: 'negative',
            position: 'top',
            message: 'Erreur de chargement de la page',
            icon: 'report_problem'
          })
        })
        } else {
        this.$q.notify({
          color: "negative",
          position: "top",
          message: "Veuillez remplir tous les champs de la rubrique déclaration / client.",
          icon: "close"
      });
      }
      */
      // utilisation de get
      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/update_facturetemp?idfacturetemp='+this.idfacture+'&numfacture='+this.numefacture+'&reduction='+this.client+'&nom='+this.nom+'&nif='+this.nif+'&adresse='+this.adresse+'&bp='+this.bp+'&telephone='+this.bp+'&email='+this.email+'&declaration='+this.regime+'&concerne='+this.concerne+'&bureaudest='+this.description+'&poidbrut='+this.poidsbrut+'&poidnet='+this.poidsnet)
        .then((response) => {
          if (response.data.status === 201) {
          this.presences = response.data.infos
          console.log(response.data)
          }
          this.$q.notify({
            color: 'green',
            position: "top",
            message: "Enregistrement temporaire de la rubrique client/déclaration avec succès",
            icon: "close"
          });
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
    ajoutautresdebours(){
      if (this.designationad != null && this.quantitead != null && this.puhtad != null) {
       const params = new URLSearchParams()
      this.idtype = 2
      params.append('idfacturetemp', this.idfacture)
      params.append('idtype', this.idtype)
      params.append('designation', this.designationad)
      params.append('quantite', this.quantitead)
      params.append('prixunitaire', this.puhtad)
      this.$axios.post(`http://localhost/Gestion-Facture/index.php/Gestionfacture/ajout_factdetailtemp`, params)
        .then((response) => {
          if (response.data.status === 201) {
          this.presences = response.data.infos
          console.log(response.data)
          }
          this.$q.notify({
            color: 'green',
            position: "top",
            message: "Enregistrement effectué avec succès",
            icon: "close"
          });
          this.designationad = null,
          this.quantitead = null,
          this.puhtad = null
        })
        .catch(() => {
          this.$q.notify({
            color: 'negative',
            position: 'top',
            message: 'Erreur de chargement de la page',
            icon: 'report_problem'
          })
        })
        } else {
        this.$q.notify({
          color: "negative",
          position: "top",
          message: "Veuillez remplir tous les champs SVP",
          icon: "close"
      });
      }
    },
    ajouthonoraires(){
      if (this.designationho != null && this.quantiteho != null && this.puhtho != null) {
      const params = new URLSearchParams()
      this.idtype = 3
      params.append('idfacturetemp', this.idfacture)
      params.append('idtype', this.idtype)
      params.append('designation', this.designationho)
      params.append('quantite', this.quantiteho)
      params.append('prixunitaire', this.puhtho)
      this.$axios.post(`http://localhost/Gestion-Facture/index.php/Gestionfacture/ajout_factdetailtemp`, params)
        .then((response) => {
          if (response.data.status === 201) {
          this.presences = response.data.infos
          console.log(response.data)
          }
          this.$q.notify({
            color: "green",
            position: "top",
            message: "Enregistrement effectué avec succès",
            icon: "close"
          });
          this.designationho = null,
          this.quantiteho = null,
          this.puhtho = null
        })
        .catch(() => {
          this.$q.notify({
            color: 'negative',
            position: 'top',
            message: 'Erreur de chargement de la page',
            icon: 'report_problem'
          })
        })
        } else {
        this.$q.notify({
          color: "negative",
          position: "top",
          message: "Veuillez remplir tous les champs SVP",
          icon: "close"
      });
      }
    },
    showSelectedad(id) {
      alert(id[0].id);
    },
    removeRowad(id) {
      alert(id[0].id);
    },
    showSelected(id) {
      alert(id[0].id);
    },
    ajtreductioncommercial() {
      console.log("ajout reduction commercial");
    },
    enregistrer() {
      console.log("enregistrement effectué");
    },
    apercuavtimpression() {
      console.log("Apercu avt impression");
      window.open("http://localhost/Gestion-Facture/index.php/admin/facture2")
    },
    imprimer(){
      console.log("Apercu avt impression");
      window.open("http://localhost/Gestion-Facture/index.php/admin/facture2")
    },
    addRow () {
      this.loading = true
      setTimeout(() => {
        const
          index = Math.floor(Math.random() * (this.data.length + 1)),
          row = this.original[Math.floor(Math.random() * this.original.length)]
        if (this.data.length === 0) {
          this.rowCount = 0
        }
        row.id = ++this.rowCount
        const addRow = { ...row } // extend({}, row, { name: `${row.name} (${row.__count})` })
        this.data = [ ...this.data.slice(0, index), addRow, ...this.data.slice(index) ]
        this.loading = false
      }, 500)
    },

    removeRow () {
      this.loading = true
      setTimeout(() => {
        const index = Math.floor(Math.random() * this.data.length)
        this.data = [ ...this.data.slice(0, index), ...this.data.slice(index + 1) ]
        this.loading = false
      }, 500)
    }
  }
}
</script>
