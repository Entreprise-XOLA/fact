<template>
<div id="q-app">
  <!--  -->
  <q-form @formchange="enregistreinfoentete">
    <div class="row">
        <div class="col-6" style="margin-top: 18px; text-align: right;">FACTURE N° : </div>
        <div class="col-6"><strong><q-input borderless v-model="numefacture"  id="numfact" @change="numerofacture()"/></strong></div>
        
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
      <div class="col-4" style="text-align: left;"><q-input borderless v-model="numefacture2"  id="numfact2" @change="numerofacturefunc2()"/></div>   
    </div>
  <div class="q-pa-md">
    <q-table
      title="Treats"
      :data="tabfacture"
      :columns="columns"
      row-key="id_detailfacturetemp"
      :filter="filter"
      :loading="loading"
      selection="single"
      :selected.sync="selected"
      no-data-label="Aucune donnée disponible"
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
    <!-- modification formulaire -->
      <q-dialog v-model="promptfraisdouane" persistent>
      <q-card style="min-width: 350px">
        <q-card-section>
          <div class="text-h6">Modifier Frais de douane</div>
        </q-card-section>

         <q-card-section class="q-pt-none" hidden>
          <q-input dense v-model="id_detail" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input dense v-model="desigfd" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input dense v-model="qtitefd" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input dense v-model="putfd" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-actions align="right" class="text-primary">
          <q-btn flat label="Non" v-close-popup />
          <q-btn flat label="Modifier" v-close-popup @click="modiffd(id_detail)"/>
        </q-card-actions>
      </q-card>
    </q-dialog>
    <!-- Fin modification -->
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
      :data="tabfacturead"
      :columns="columns"
      row-key="id_detailfacturetemp"
      :filter="filter"
      :loading="loading"
      selection="single"
      :selected.sync="selected"
      no-data-label="Aucune donnée disponible"
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

    <!-- modification formulaire -->
      <q-dialog v-model="promptautresdebours" persistent>
      <q-card style="min-width: 350px">
        <q-card-section>
          <div class="text-h6">Modifier autres débours</div>
        </q-card-section>

         <q-card-section class="q-pt-none" hidden>
          <q-input dense v-model="id_detail" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input dense v-model="desigfd" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input dense v-model="qtitefd" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input dense v-model="putfd" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-actions align="right" class="text-primary">
          <q-btn flat label="Non" v-close-popup />
          <q-btn flat label="Modifier" v-close-popup @click="modifad(id_detail)"/>
        </q-card-actions>
      </q-card>
    </q-dialog>
    <!-- Fin modification -->

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
      :data="tabfactureho"
      :columns="columns"
      row-key="id_detailfacturetemp"
      :filter="filter"
      :loading="loading"
      selection="single"
      :selected.sync="selected"
      no-data-label="Aucune donnée disponible"
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

    <!-- modification formulaire -->
      <q-dialog v-model="prompthonoraire" persistent>
      <q-card style="min-width: 350px">
        <q-card-section>
          <div class="text-h6">Modifier honoraire</div>
        </q-card-section>

         <q-card-section class="q-pt-none" hidden>
          <q-input dense v-model="id_detail" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input dense v-model="desigfd" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input dense v-model="qtitefd" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input dense v-model="putfd" autofocus @keyup.enter="promptfraisdouane = false" />
        </q-card-section>

        <q-card-actions align="right" class="text-primary">
          <q-btn flat label="Non" v-close-popup />
          <q-btn flat label="Modifier" v-close-popup @click="modifho(id_detail)"/>
        </q-card-actions>
      </q-card>
    </q-dialog>
    <!-- Fin modification -->

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
      <div class="col-6">
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
          <q-btn color="deep-orange" :disable="loading" label="Imprimer" style="color: white; width: 400px; text-transform: none; font-weight : bold;" @click="imprimer"></q-btn>
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
      tabfacture: [],
      tabfacturead: [],
      tabfactureho: [],
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
      promptfraisdouane: false,
      promptautresdebours: false,
      prixunitairefd: null,
      prompthonoraire: false,
      id_detail: null,
      desigfd: null,
      qtitefd: null,
      putfd: null,
      filter: '',
      selected: [],
      rowCount: 10,
      columns: [
        { name: 'designation', align: 'center', label: 'DESIGNATION', field: 'designation', sortable: true },
        { name: 'quantite', label: 'QUANTITE', field: 'quantite', sortable: true },
        { name: 'puht', label: 'PRIX UNITAIRE HT', field: 'prixunitaire' }
      ],
      data: this.tabfacture,
      data1: this.tabfacturead,
      data2: this.tabfactureho,
      original: [],
      formattedString: null
    }
  },
   mounted () {
    let timeStamp = Date.now()
    this.formattedString = date.formatDate(timeStamp, 'DD MMMM YYYY')
    console.log(this.formattedString);
    this.idfacture = localStorage.getItem("idfacture");    
    ///*
    this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/info_facture?idfacturetemp='+this.idfacture)
        .then((response) => {
          console.log(response.data)
          //this.numefacture = response.data.infos.idfacturetemp
          this.numefacture = response.data.infos[0].numfacture
          this.numefacture2 = response.data.infos[0].numfacture2
          this.client = response.data.infos[0].reduction
          this.nom = response.data.infos[0].nom
          this.regime = response.data.infos[0].declaration
          this.concerne = response.data.infos[0].concerne
          this.description = response.data.infos[0].bureaudest
          this.poidsbrut = response.data.infos[0].poidbrut
          this.poidsnet = response.data.infos[0].poidnet
          this.tabfacture = response.data.infos[0].detail[0].infodetail
          this.tabfacturead = response.data.infos[0].detail[1].infodetail
          this.tabfactureho = response.data.infos[0].detail[2].infodetail
          // this.graph = true
          console.log(this.numefacture);console.log(this.idfacture)
          localStorage.setItem("idfacture", response.data.infos.idfacturetemp);
          //console.log(response.data);
        })
        //*/
  },
  methods: {
    // emulate fetching data from server
    showSelectedfd(id) {
      console.log(id[0].id_detailfacturetemp);
      console.log(this.idfacture);
      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_detail?idfacturetemp='+this.idfacture+'&id_detailfacturetemp='+id[0].id_detailfacturetemp)
        .then((response) => {
          this.id_detail = response.data.infos[0].id_detailfacturetemp
          this.desigfd = response.data.infos[0].designation
          this.qtitefd = response.data.infos[0].quantite
          this.putfd = response.data.infos[0].prixunitaire
          
          // this.graph = true
          console.log(this.id_detail); console.log(this.desigfd); console.log(this.qtitefd); console.log(this.putfd);

          this.promptfraisdouane = true;

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
    modiffd(id_detail){
      console.log(id_detail);
      //this.idfacture = localStorage.getItem("idfacture");
      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/update_factdetailtemp?idfacturetemp='+this.idfacture+'&id_detailfacturetemp='+this.id_detail+'&designation='+this.desigfd+'&quantite='+this.qtitefd+'&prixunitaire='+this.putfd)
        .then((response) => {
          //this.numefacture = response.data.infos.numfacture
          // this.graph = true

          this.$axios.get(`http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_fraisdedouane?idfacturetemp=`+this.idfacture)
          .then((response) => {
              this.tabfacture = response.data.infos
              })

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
    modifad(id_detail){
      console.log(id_detail);
      //this.idfacture = localStorage.getItem("idfacture");
      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/update_factdetailtemp?idfacturetemp='+this.idfacture+'&id_detailfacturetemp='+this.id_detail+'&designation='+this.desigfd+'&quantite='+this.qtitefd+'&prixunitaire='+this.putfd)
        .then((response) => {
          //this.numefacture = response.data.infos.numfacture
          // this.graph = true

          this.$axios.get(`http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_autredebours?idfacturetemp=`+this.idfacture)
          .then((response) => {
              this.tabfacturead = response.data.infos
              })

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
    modifho(id_detail){
      console.log(id_detail);
      //this.idfacture = localStorage.getItem("idfacture");
      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/update_factdetailtemp?idfacturetemp='+this.idfacture+'&id_detailfacturetemp='+this.id_detail+'&designation='+this.desigfd+'&quantite='+this.qtitefd+'&prixunitaire='+this.putfd)
        .then((response) => {
          //this.numefacture = response.data.infos.numfacture
          // this.graph = true

          this.$axios.get(`http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_honoraire?idfacturetemp=`+this.idfacture)
          .then((response) => {
              this.tabfactureho = response.data.infos
              })

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
    removeRowfd(id) {
      //alert(id[0].id_detailfacturetemp);

      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/delete_detailfacture?idfacturetemp='+id[0].id_detailfacturetemp)
        .then((response) => {
          //this.numefacture = response.data.infos.numfacture
          // this.graph = true

          this.$axios.get(`http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_fraisdedouane?idfacturetemp=`+this.idfacture)
          .then((response) => {
              this.tabfacture = response.data.infos
              })

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
          this.puhtfd = null,

          // RFRESH FRAIS DE DOUANE
        this.idfacture = localStorage.getItem("idfacture");
        console.log("coucoufd");
        console.log(this.idfacture)

      this.$axios.get(`http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_fraisdedouane?idfacturetemp=`+this.idfacture)
          .then((response) => {
            const sleep = (milliseconds) => {
            return new Promise(resolve => setTimeout(resolve, milliseconds))
          }
          sleep(100).then(() => {
            this.tabfacture = response.data.infos
              // this.graph = true
              console.log(this.tabfacture);
          })
            
            })
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
          this.puhtad = null,

          // RFRESH Autres débours
        this.idfacture = localStorage.getItem("idfacture");
        console.log("coucouad");
        console.log(this.idfacture)

      this.$axios.get(`http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_autredebours?idfacturetemp=`+this.idfacture)
          .then((response) => {
            const sleep = (milliseconds) => {
            return new Promise(resolve => setTimeout(resolve, milliseconds))
          }
          sleep(110).then(() => {
            this.tabfacturead = response.data.infos
              // this.graph = true
              console.log(this.tabfacture);
          })
            
            })
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
          this.puhtho = null,

          // RFRESH honoraire
        this.idfacture = localStorage.getItem("idfacture");
        console.log("coucouho");
        console.log(this.idfacture)

      this.$axios.get(`http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_honoraire?idfacturetemp=`+this.idfacture)
          .then((response) => {
            const sleep = (milliseconds) => {
            return new Promise(resolve => setTimeout(resolve, milliseconds))
          }
          sleep(120).then(() => {
            this.tabfactureho = response.data.infos
              // this.graph = true
              console.log(this.tabfacture);
          })
            
            })
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
      //console.log(id[0].id_detailfacturetemp);
      //this.idfacture = localStorage.getItem("idfacture");
      console.log(id[0].id_detailfacturetemp);
      console.log(this.idfacture);
      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_detail?idfacturetemp='+this.idfacture+'&id_detailfacturetemp='+id[0].id_detailfacturetemp)
        .then((response) => {
          this.id_detail = response.data.infos[0].id_detailfacturetemp
          this.desigfd = response.data.infos[0].designation
          this.qtitefd = response.data.infos[0].quantite
          this.putfd = response.data.infos[0].prixunitaire
          
          // this.graph = true
          console.log(this.id_detail); console.log(this.desigfd); console.log(this.qtitefd); console.log(this.putfd);

          this.promptautresdebours = true;

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
    removeRowad(id) {
      //alert(id[0].id_detailfacturetemp);
      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/delete_detailfacture?idfacturetemp='+id[0].id_detailfacturetemp)
        .then((response) => {
          //this.numefacture = response.data.infos.numfacture
          // this.graph = true

          this.$axios.get(`http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_autredebours?idfacturetemp=`+this.idfacture)
          .then((response) => {
              this.tabfacturead = response.data.infos
              })

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
    showSelected(id) {
      console.log(id[0].id_detailfacturetemp);
      //console.log(id[0].id_detailfacturetemp);
      //this.idfacture = localStorage.getItem("idfacture");
      console.log(id[0].id_detailfacturetemp);
      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_detail?idfacturetemp='+this.idfacture+'&id_detailfacturetemp='+id[0].id_detailfacturetemp)
        .then((response) => {
          this.id_detail = response.data.infos[0].id_detailfacturetemp
          this.desigfd = response.data.infos[0].designation
          this.qtitefd = response.data.infos[0].quantite
          this.putfd = response.data.infos[0].prixunitaire
          
          // this.graph = true
          console.log(this.id_detail); console.log(this.desigfd); console.log(this.qtitefd); console.log(this.putfd);

          this.prompthonoraire = true;

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
    ajtreductioncommercial() {
      console.log("ajout reduction commercial");
    },
    enregistrer() {
      console.log("enregistrement effectué");
    },
    apercuavtimpression() {
      this.idfacture = localStorage.getItem("idfacture");
      console.log("Apercu avt impression");
      window.open("http://localhost/Gestion-Facture/index.php/admin/facture/"+this.idfacture)
    },
    imprimer(){
      //this.idfacture = localStorage.getItem("idfacture");
      console.log(this.idfacture);
      window.open("http://localhost/Gestion-Facture/index.php/admin/facture2/"+this.idfacture)
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
      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/delete_detailfacture?idfacturetemp='+id[0].id_detailfacturetemp)
        .then((response) => {
          //this.numefacture = response.data.infos.numfacture
          // this.graph = true

          this.$axios.get(`http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_autredebours?idfacturetemp=`+this.idfacture)
          .then((response) => {
              this.tabfactureho = response.data.infos
              })

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
    }
  }
}
</script>
