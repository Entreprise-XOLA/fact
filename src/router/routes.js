
const routes = [
  {
    path: '/',
    component: () => import('pages/Connexion.vue')
  },
  {
    path: '/con2',
    component: () => import('pages/Connexion2.vue')
  },
  {
    path: '/motpasseoublié',
    component: () => import('pages/motpasseoublié.vue')
  },
  {
    path: '/nouveauCode',
    component: () => import('pages/nouveauCode.vue')
  },
  {
    path: '/accueil',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/accueil.vue') }
    ]
  },
  {
    path: '/modifacture',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/modificationfacture.vue') }
    ]
  },
  {
    path: '/codeaccueil',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/codeAccueil.vue') }
    ]
  },
  {
    path: '/accueilparametres',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/accueilParametres.vue') }
    ]
  },
  {
    path: '/ajoututilisateur',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/ajoututilisateur.vue') }
    ]
  },
  {
    path: '/ajoutrolepermission',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/ajoutrolepermission.vue') }
    ]
  },
  {
    path: '/editutilisateur',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/editutilisateur.vue') }
    ]
  },
  {
    path: '/editrolepermission',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/editrolepermission.vue') }
    ]
  },
  {
    path: '/codeat2',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/listeCodeAttente2.vue') }
    ]
  },
  {
    path: '/modiffacture',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/modiffacture.vue') }
    ]
  }
]

// Always leave this as last one
if (process.env.MODE !== 'ssr') {
  routes.push({
    path: '*',
    component: () => import('pages/Error404.vue')
  })
}

export default routes
