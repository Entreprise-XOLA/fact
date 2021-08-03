<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-btn
          flat
          dense
          round
          icon="menu"
          aria-label="Menu"
          @click="leftDrawerOpen = !leftDrawerOpen"
        />

        <q-toolbar-title>
          GEVERSE-TRANS TOGO
        </q-toolbar-title>
      </q-toolbar>
    </q-header>

    <q-drawer
      v-model="leftDrawerOpen"
      show-if-above
      bordered
      content-class="bg-grey-1"
    >
      <q-list>
        <center>
          <q-item-label header style="background: linear-gradient(#1976d2, #fff)">
            <img
              src="../assets/geversetrans.png"
              style="height: 110px; max-width: 110px;margin-top:20px auto"
            />
            <q-item-label header style="color:black; font-size: 12px;">
              Appli de Gestion de Facture
            </q-item-label>
          </q-item-label>
        </center>
        <q-separator inset />
        <q-item to="/accueil" exact>
          <q-item-section avatar>
            <q-icon name="home" />
          </q-item-section>

          <q-item-section>
            Accueil
          </q-item-section>
        </q-item>
        <q-separator inset />
        <q-item to="/codeat2" exact>
          <q-item-section avatar>
            <q-icon name="book"  />
          </q-item-section>

          <q-item-section>
            Facture
          </q-item-section>
        </q-item>
        <q-separator inset />
        <q-item to="/codeaccueil" exact>
          <q-item-section avatar>
            <q-icon name="record_voice_over" />
          </q-item-section>

          <q-item-section>
            Archive
          </q-item-section>
        </q-item>
        <q-separator inset />
        <q-item to="/" exact>
          <q-item-section avatar>
            <q-icon name="lock" />
          </q-item-section>

          <q-item-section @click="logout">
            Déconnecter
          </q-item-section>
        </q-item>
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>
<style>
.q-item.q-router-link--active, .q-item--active {
    color: #1976d2 !important;
}
</style>
<script>
import { openURL } from 'quasar'
import EssentialLink from "components/EssentialLink.vue";

export default {
  name: "MainLayout",

  components: {},

  data() {
    return {
      leftDrawerOpen: false
    };
  },

  methods: {
    openURL,
    logout() {
      localStorage.clear();
      this.$q.notify({
        color: "primary",
        position: "top",
        message: "Votre compte est déconnecté",
        icon: "close"
      });
      this.$router.push("/");
    }
  }
};
</script>
