<template>
  <nav>
    <div class="nav">
      <div class="nav-block">
        <router-link class="nav-item" :to="{ name: 'home' }"><img src="../../images/logo.svg" alt="首頁Logo"></router-link>
        <div class="nav-item">
          <GlobalSearch :size="'s'"/>
        </div>
      </div>
      <div class="nav-block">
        <router-link class="nav-item btn-icon-text btn-outline" :to="{ name: 'scenicspots-list' }">找景點<img src="../../images/icon/tour-o.svg" alt="景點icon"></router-link>
        <!-- <router-link class="nav-item btn-icon-text btn-outline" :to="{ name: 'activities' }">找活動<img src="../../images/icon/tour.svg" alt="活動icon"></router-link> -->
        <router-link class="nav-item btn-icon-text btn-outline" :to="{ name: 'hotels-list' }">找飯店<img src="../../images/icon/bed-o.svg" alt="飯店icon"></router-link>
        <router-link class="nav-item btn-icon-text btn-outline" :to="{ name: 'restaurants-list' }">找餐廳<img src="../../images/icon/food-o.svg" alt="住宿icon"></router-link>
        <router-link class="nav-item btn-icon-text btn-filled" :to="{ name: 'favorites' }">我的旅程</router-link>
      </div>
    </div>
  </nav>
</template>

<script>
  import GlobalSearch from './global_search.vue';

  export default {
    data () {
      return {
        text: "這裡是 navbar"
      }
    },
    components: {
      GlobalSearch
    }
  }
</script>