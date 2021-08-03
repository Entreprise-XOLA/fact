<template>
  <div class="q-pa-md">
    <q-card>
        <q-tabs
          v-model="tab"
          dense
          class="bg-grey-3 text-grey-7"
          active-color="primary"
          indicator-color="purple"
          align="justify"
        >
          <q-tab name="mails" label="Utilisateurs" />
          <q-tab name="alarms" label="Rôle et permissions" />
        </q-tabs>

        <q-tab-panels v-model="tab" animated class="bg-white text-black">
          <q-tab-panel name="mails">
            <div class="text-h6"><q-btn color="primary" label="AJOUTER" @click="ajoututil" /></div>
            <center><div style="font-size: 20px; margin-bottom: 5px;">Listes des utilisateurs</div></center>
            <q-markup-table dark class="bg-blue-9">
              <thead>
                <tr>
                  <th class="text-left">Rôles</th>
                  <th class="text-right">Nom</th>
                  <th class="text-right">Prénoms</th>
                  <th class="text-right">Emails</th>
                  <th class="text-right">Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-left">Admin</td>
                  <td class="text-right">ALIPO</td>
                  <td class="text-right">Kossi dodji</td>
                  <td class="text-right">Kossidodji1@gmail.com</td>
                  <td class="text-right"><q-btn icon="create" stack glossy color="purple" @click="editutil" /> <q-btn icon="delete" stack glossy color="red" /></td>
                </tr>
              </tbody>
    </q-markup-table>
          </q-tab-panel>

          <q-tab-panel name="alarms">
            <div class="text-h6"><q-btn color="primary" label="AJOUTER" @click="ajoutrole"/></div>
            <center><div style="font-size: 20px; margin-bottom: 5px;">Listes de rôles et de permissions</div></center>
            <q-markup-table dark class="bg-blue-9">
              <thead>
                <tr>
                  <th class="text-left">Rôles</th>
                  <th class="text-right">Description</th>
                  <th class="text-right">Login Utilisateur</th>
                  <th class="text-right">Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-left">Admin</td>
                  <td class="text-right">Administrateur du site</td>
                  <td class="text-right"> / </td>
                  <td class="text-right"><q-btn icon="create" stack glossy color="purple" @click="editrole" /> <q-btn icon="delete" stack glossy color="red" /></td>
                </tr>
              </tbody>
    </q-markup-table>
          </q-tab-panel>
        </q-tab-panels>
      </q-card>
  </div>
</template>

<script>
export default {
  data () {
    return {
      tab: 'mails'
    }
  },
  methods: {
    verifcodeinsc () {
      this.$router.push('/validcodeinscription')
    },
    ajoututil () {
      this.$router.push('/ajoututilisateur')
    },
    ajoutrole () {
      this.$router.push('/ajoutrolepermission')
    },
    editutil () {
      this.$router.push('/editutilisateur')
    },
    editrole () {
      this.$router.push('/editrolepermission')
    }
  }
}
</script>
