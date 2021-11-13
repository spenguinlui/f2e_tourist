import Vue from 'vue/dist/vue.esm';

import TurbolinksAdapter from 'vue-turbolinks';
import App from './App.vue';

import Router from 'vue-router';
import { routes } from './routes';

import Vuex from 'vuex';
import { storeObject } from './store';

import '../styles/application.scss';

Vue.use(TurbolinksAdapter);

// 看來是要在 tubolinks 後執行 Router，不然會掛不到 Router
Vue.use(Router);
const router = new Router({
  linkExactActiveClass: 'active',
  linkActiveClass: 'active',
  // mode: 'history',
  // base: this.$router.options.routes,
  routes
})

// Vuex
Vue.use(Vuex);
const store = new Vuex.Store(storeObject);

document.addEventListener('turbolinks:load', () => {
  new Vue({
    router,
    store,
    render: h => h(App)
  }).$mount('#app')
});
