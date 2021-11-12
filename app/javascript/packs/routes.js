export const routes = [
	{
    path: '/',
    component: () => import('./pages/home'),
    name: 'home'
  },
	{
    path: '/search',
    component: () => import('./pages/search'),
    name: 'search'
  },
  {
    path: '/login',
    component: () => import('./components/login.vue'),
    name: 'login'
  },
  {
    path: '/scenicspots',
    component: () => import('./pages/scenicspots'),
    name: 'scenicspots',
    children: [
      {
        path: '/',
        component: () => import('./pages/views/scenicspots_list'),
        name: 'scenicspots-list',
      },
      {
        path: 'map',
        component: () => import('./pages/views/scenicspots_map'),
        name: 'scenicspots-map',
      },
      {
        path: 'detail/:id/:type',
        component: () => import('./pages/detail'),
        name: 'scenicspots-detail',
      }
    ]
  },
  {
    path: '/activities',
    component: () => import('./pages/activities'),
    name: 'activities',
    children: [
      {
        path: '/',
        component: () => import('./pages/views/activities_list'),
        name: 'activities-list',
      },
      {
        path: 'map',
        component: () => import('./pages/views/activities_map'),
        name: 'activities-map',
      },
      {
        path: 'detail/:id/:type',
        component: () => import('./pages/detail'),
        name: 'activities-detail',
      }
    ]
  },
  {
    path: '/restaurants',
    component: () => import('./pages/restaurants'),
    name: 'restaurants',
    children: [
      {
        path: '/',
        component: () => import('./pages/views/restaurants_list'),
        name: 'restaurants-list',
      },
      {
        path: 'map',
        component: () => import('./pages/views/restaurants_map'),
        name: 'restaurants-map',
      },
      {
        path: 'detail/:id/:type',
        component: () => import('./pages/detail'),
        name: 'restaurants-detail',
      }
    ]
  },
  {
    path: '/hotels',
    component: () => import('./pages/hotels'),
    name: 'hotels',
    children: [
      {
        path: '/',
        component: () => import('./pages/views/hotels_list'),
        name: 'hotels-list',
      },
      {
        path: 'map',
        component: () => import('./pages/views/hotels_map'),
        name: 'hotels-map',
      },
      {
        path: 'detail/:id/:type',
        component: () => import('./pages/detail'),
        name: 'hotels-detail',
      }
    ]
  },
  {
    path: '/favorites',
    component: () => import('./pages/favorites'),
    name: 'favorites'
  },
  {
    path: '/theme',
    component: () => import('./pages/theme'),
    name: 'theme'
  },
  {
    path: '/suppliers',
    component: () => import('./pages/suppliers'),
    name: 'suppliers'
  },
]