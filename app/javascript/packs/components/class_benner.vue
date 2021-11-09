<template>
  <div>
    這是 {{ class_type_zh }} 橫幅
    <div v-if="class_type === 'scenicspots'">
      <router-link :to="{ name: 'scenicspots-list' }">列表顯示</router-link>
      <router-link :to="{ name: 'scenicspots-map' }">地圖顯示</router-link>
    </div>
    <div v-if="class_type === 'activities'">
      <router-link :to="{ name: 'activities-list' }">列表顯示</router-link>
      <router-link :to="{ name: 'activities-map' }">地圖顯示</router-link>
    </div>
    <div v-if="class_type === 'hotels'">
      <router-link :to="{ name: 'hotels-list' }">列表顯示</router-link>
      <router-link :to="{ name: 'hotels-map' }">地圖顯示</router-link>
    </div>
    <div v-if="class_type === 'restaurants'">
      <router-link :to="{ name: 'restaurants-list' }">列表顯示</router-link>
      <router-link :to="{ name: 'restaurants-map' }">地圖顯示</router-link>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['type'],
    data () {
      return {
        text: ""
      }
    },
    computed: {
      class_type() {
        const currentPath = this.$route.name;
        if (currentPath.indexOf("activities") >= 0) {
          return "activities"
        } else if (currentPath.indexOf("restaurants") >= 0) {
          return "restaurants"
        } else if (currentPath.indexOf("hotels") >= 0) {
          return "hotels"
        } else if (currentPath.indexOf("scenicspots") >= 0) {
          return "scenicspots"
        } else {
          return "others"
        }
      },
      class_type_zh() {
        switch (this.class_type) {
          case "activities":
            return "活動";
          case "restaurants":
            return "餐廳";
          case "hotels":
            return "飯店";
          case "scenicspots":
            return "景點";
          default:
            return "其他";
        }

      }
    }
  }
</script>