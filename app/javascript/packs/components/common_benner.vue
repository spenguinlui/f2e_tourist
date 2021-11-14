<template>
  <div>
    <div class="benner-container" :style="{ backgroundImage: bgImage }">
      <h1 class="benner-title">搜尋結果</h1>
    </div>
  </div>
</template>

<script>
  import GlobalSearch from './global_search.vue';

  export default {
    data () {
      return {
        classType: "search"
      }
    },
    components: {
      GlobalSearch
    },
    computed: {
      bgImage() {
        switch (this.classType) {
          case "activities":
            return `url(${require('../../images/tour-benner.png')})`;
          case "restaurants":
            return `url(${require('../../images/food-benner.png')})`;
          case "hotels":
            return `url(${require('../../images/hotel-benner.png')})`;
          case "scenicspots":
            return `url(${require('../../images/tour-benner.png')})`;
          default:
            return `url(${require('../../images/spare-benner-1.jpeg')})`;
        }
      }
    }
  }
</script>