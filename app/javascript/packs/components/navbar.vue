<template>
  <div>
    <router-link :to="{ name: 'home' }">home</router-link>
    <GlobalSearch/>
    <router-link :to="{ name: 'scenicspots' }">找景點</router-link>
    <router-link :to="{ name: 'activities' }">找活動</router-link>
    <router-link :to="{ name: 'hotels' }">找飯店</router-link>
    <router-link :to="{ name: 'restaurants' }">找餐廳</router-link>
  </div>
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