export const routes = [
	{
    path: '/',
    component: () => import('./pages/home'),
    name: 'home'
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
        path: 'list',
        component: () => import('./pages/views/scenicspots_list'),
        name: 'scenicspots-list',
      },
      {
        path: 'map',
        component: () => import('./pages/views/scenicspots_map'),
        name: 'scenicspots-map',
      }
    ]
  },
  {
    path: '/activities',
    component: () => import('./pages/activities'),
    name: 'activities',
    children: [
      {
        path: 'list',
        component: () => import('./pages/views/activities_list'),
        name: 'activities-list',
      },
      {
        path: 'map',
        component: () => import('./pages/views/activities_map'),
        name: 'activities-map',
      }
    ]
  },
  {
    path: '/restaurants',
    component: () => import('./pages/restaurants'),
    name: 'restaurants',
    children: [
      {
        path: 'list',
        component: () => import('./pages/views/restaurants_list'),
        name: 'restaurants-list',
      },
      {
        path: 'map',
        component: () => import('./pages/views/restaurants_map'),
        name: 'restaurants-map',
      }
    ]
  },
  {
    path: '/hotels',
    component: () => import('./pages/hotels'),
    name: 'hotels',
    children: [
      {
        path: 'list',
        component: () => import('./pages/views/hotels_list'),
        name: 'hotels-list',
      },
      {
        path: 'map',
        component: () => import('./pages/views/hotels_map'),
        name: 'hotels-map',
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
    path: '/detail',
    component: () => import('./pages/detail'),
    name: 'detail'
  },
  {
    path: '/suppliers',
    component: () => import('./pages/suppliers'),
    name: 'suppliers'
  },
]