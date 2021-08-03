<template>
<div id="q-app">
  <div class="q-pa-md">
    <q-table
      title="Treats"
      :data="tablistefacture"
      :columns="columns"
      row-key="idfacturetemp"
      :filter="filter"
      :loading="loading"
      selection="single"
      :selected.sync="selected"
    >

      <template v-slot:top>
        <q-btn class="q-ml-sm" color="red" :disable="loading" label="Supprimer la facture" @click="showSelected(selected)"></q-btn><q-space></q-space>
        <q-btn color="primary" :disable="loading" label="Imprimer la facture" @click="imprimerSelected(selected)"></q-btn>
        <q-btn class="q-ml-sm" color="grey" :disable="loading" label="Modifier la facture" @click="modifSelected(selected)"></q-btn>
        <!--<q-btn class="q-ml-sm" color="red" :disable="loading" label="Supprimer la facture" @click="removeRow"></q-btn>-->
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
</div>
</template>

<script>
import { date } from 'quasar'
export default {
 data () {
    return {
      loading: false,
      text: '',
      filter: '',
      tablistefacture: [],
      selected: [],
      rowCount: 10,
      columns: [
        {
          name: 'desc',
          required: true,
          label: 'Réference facture',
          align: 'left',
          field: row => row.numfacture,
          format: val => `${val}`,
          sortable: true
        },
        { name: 'dateajout', align: 'center', label: 'Date', field: 'dateajout', sortable: true },
        { name: 'nom', label: 'Nom du Client', field: 'nom', sortable: true }
      ],
      data: this.tablistefacture,
      original: [],
      formattedString: null
    }
  },
  mounted () {
    let timeStamp = Date.now()
    this.formattedString = date.formatDate(timeStamp, 'DD MMMM YYYY')
    console.log(this.formattedString);
    this.$axios.get(`http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_facturetemp`)
      .then((response) => {
        const sleep = (milliseconds) => {
        return new Promise(resolve => setTimeout(resolve, milliseconds))
      }
      sleep(140).then(() => {
        this.tablistefacture = response.data.infos
          // this.graph = true
          console.log(this.tablistefacture);
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
  },
  methods: {
    // emulate fetching data from server
    showSelected(id) {
      //alert(id[0].idfacturetemp);
      this.$axios.get('http://localhost/Gestion-Facture/index.php/Gestionfacture/delete_factureglobal?idfacturetemp='+id[0].idfacturetemp)
        .then((response) => {
          //this.numefacture = response.data.infos.numfacture
          // this.graph = true

          this.$axios.get(`http://localhost/Gestion-Facture/index.php/Gestionfacture/liste_facturetemp`)
            .then((response) => {
              const sleep = (milliseconds) => {
              return new Promise(resolve => setTimeout(resolve, milliseconds))
            }
            sleep(140).then(() => {
              this.tablistefacture = response.data.infos
                // this.graph = true
                console.log(this.tablistefacture);
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
    modifSelected(id) {
      console.log(id[0].idfacturetemp);
      localStorage.setItem("idfacture", id[0].idfacturetemp);
      this.$router.push('/modiffacture')
    },
    imprimerSelected(id){
      console.log(id[0].idfacturetemp);
      var idfacturetp = id[0].idfacturetemp
      window.open("http://localhost/Gestion-Facture/index.php/admin/facture2/"+idfacturetp);
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
