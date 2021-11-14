<template>
  <nav>
    <div class="nav">
      <div class="nav-block m-menu" @click="toggleMenu">
        <img src="../../images/icon/menu.svg" alt="手機版選單">
      </div>
      <div class="nav-block">
        <router-link class="nav-item" :to="{ name: 'home' }"><img src="../../images/logo.svg" alt="首頁Logo"></router-link>
        <div class="nav-item mp-not-display">
          <GlobalSearch :size="'s'"/>
        </div>
      </div>
      <div class="nav-block m-menu" @click="toggleMenu">
        <img src="../../images/icon/search-m.svg" alt="手機版搜尋">
      </div>
      <div class="nav-block mp-not-display">
        <router-link class="nav-item nav-btn" :to="{ name: 'scenicspots-list' }">找景點<img src="../../images/icon/tour-o.svg" alt="景點icon"></router-link>
        <router-link class="nav-item nav-btn" :to="{ name: 'hotels-list' }">找飯店<img src="../../images/icon/bed-o.svg" alt="飯店icon"></router-link>
        <router-link class="nav-item nav-btn" :to="{ name: 'restaurants-list' }">找餐廳<img src="../../images/icon/food-o.svg" alt="住宿icon"></router-link>
        <router-link class="nav-item nav-btn-f" :to="{ name: 'favorites' }">我的旅程</router-link>
      </div>
    </div>
    <div class="m-nav" v-show="menuShow">
      <div class="nav-block">
        <GlobalSearch :size="'s'"/>
      </div>
      <div class="nav-block">
        <router-link class="nav-item nav-btn" :to="{ name: 'scenicspots-list' }">找景點<img src="../../images/icon/tour-o.svg" alt="景點icon"></router-link>
        <router-link class="nav-item nav-btn" :to="{ name: 'hotels-list' }">找飯店<img src="../../images/icon/bed-o.svg" alt="飯店icon"></router-link>
        <router-link class="nav-item nav-btn" :to="{ name: 'restaurants-list' }">找餐廳<img src="../../images/icon/food-o.svg" alt="住宿icon"></router-link>
      </div>
      <div class="nav-block">
        <router-link class="nav-item nav-btn-f" :to="{ name: 'favorites' }">我的旅程</router-link>
      </div>
    </div>
  </nav>
</template>

<script>
  import GlobalSearch from './global_search.vue';

  export default {
    data () {
      return {
        menuShow: false
      }
    },
    methods:  {
      toggleMenu() {
        this.menuShow = !this.menuShow;
      }
    },
    components: {
      Media,
      GlobalSearch
    }
  }
</script>