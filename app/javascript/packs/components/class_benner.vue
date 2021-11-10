<template>
  <div>
    <div class="benner-container">
      <h1 class="title">{{ class_type_zh }}列表</h1>
      <div class="benner-btn-container">
        <div class="left-btn">
          <div class="relative">
            <div class="btn-choose btn-outline">選擇地區</div>
            <SelectAreaBlock/>
          </div>
          <div class="btn-choose btn-outline">選擇日期</div>
        </div>
        <div class="right-btn">
          <div class="btn-icon-text btn-filled">篩選<img src="../../images/icon/filter.svg" alt="篩選icon"></div>
          <div v-if="class_type === 'scenicspots'">
            <router-link v-show="!this.isList" @click="toggleViewType()" :to="{ name: 'scenicspots-list' }" class="btn-icon btn-filled"><img src="../../images/icon/list.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!this.isMap" @click="toggleViewType()" :to="{ name: 'scenicspots-map' }" class="btn-icon btn-filled"><img src="../../images/icon/map.svg" alt="切換地圖icon"></router-link>
          </div>
          <div v-if="class_type === 'activities'">
            <router-link v-show="!this.isList" @click="toggleViewType()" :to="{ name: 'activities-list' }" class="btn-icon btn-filled"><img src="../../images/icon/list.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!this.isMap" @click="toggleViewType()" :to="{ name: 'activities-map' }" class="btn-icon btn-filled"><img src="../../images/icon/map.svg" alt="切換地圖icon"></router-link>
          </div>
          <div v-if="class_type === 'hotels'">
            <router-link v-show="!this.isList" @click="toggleViewType()" :to="{ name: 'hotels-list' }" class="btn-icon btn-filled"><img src="../../images/icon/list.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!this.isMap" @click="toggleViewType()" :to="{ name: 'hotels-map' }" class="btn-icon btn-filled"><img src="../../images/icon/map.svg" alt="切換地圖icon"></router-link>
          </div>
          <div v-if="class_type === 'restaurants'">
            <router-link v-show="!this.isList" @click="toggleViewType()" :to="{ name: 'restaurants-list' }" class="btn-icon btn-filled"><img src="../../images/icon/list.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!this.isMap" @click="toggleViewType()" :to="{ name: 'restaurants-map' }" class="btn-icon btn-filled"><img src="../../images/icon/map.svg" alt="切換地圖icon"></router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import SelectAreaBlock from './select_area_block.vue';

  export default {
    props: ['type'],
    data () {
      return {
        isList: true,
        isMap: false
      }
    },
    methods: {
      toggleViewType() {
        if (this.isList) { this.isList = !this.isList };
        if (this.isMap) { this.isMap = !this.isMap };
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
    },
    components: {
      SelectAreaBlock
    }
  }
</script>

<style lang="scss" scope>

</style>