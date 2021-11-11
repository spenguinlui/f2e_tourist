<template>
  <div>
    <div class="benner-container" :style="{ backgroundImage: bgImage }">
      <h1 class="title">{{ classType_zh }}列表</h1>
      <div class="benner-btn-container">
        <div class="left-btn">
          <div class="relative">
            <div class="btn-choose btn-outline" @click="toggleSelectBlock()">選擇地區</div>
            <SelectAreaBlock :open="selectBlockShow" @updateData="updateData"/>
          </div>
          <div class="btn-choose btn-outline">選擇日期</div>
        </div>
        <div class="right-btn">
          <button class="btn-icon-text btn-filled">篩選<img src="../../images/icon/filter-f.svg" alt="切換列表icon"></button>
          <div v-if="classType === 'scenicspots'" @click="toggleViewType()">
            <router-link v-show="!isList" :to="{ name: 'scenicspots-list' }" class="btn-icon btn-filled"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!isMap" :to="{ name: 'scenicspots-map' }" class="btn-icon btn-filled"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
          </div>
          <div v-if="classType === 'activities'" @click="toggleViewType()">
            <router-link v-show="!isList" :to="{ name: 'activities-list' }" class="btn-icon btn-filled"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!isMap" :to="{ name: 'activities-map' }" class="btn-icon btn-filled"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
          </div>
          <div v-if="classType === 'hotels'" @click="toggleViewType()">
            <router-link v-show="!isList" :to="{ name: 'hotels-list' }" class="btn-icon btn-filled"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!isMap" :to="{ name: 'hotels-map' }" class="btn-icon btn-filled"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
          </div>
          <div v-if="classType === 'restaurants'" @click="toggleViewType()">
            <router-link v-show="!isList" :to="{ name: 'restaurants-list' }" class="btn-icon btn-filled"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!isMap" :to="{ name: 'restaurants-map' }" class="btn-icon btn-filled"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
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
        isMap: false,
        selectBlockShow: false
      }
    },
    methods: {
      toggleViewType() {
        this.isList = !this.isList;
        this.isMap = !this.isMap;
      },
      toggleSelectBlock() {
        this.selectBlockShow = !this.selectBlockShow
      },
      updateData(query){
        this.$emit('updateData', query);
      }
    },
    computed: {
      classType() {
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
      classType_zh() {
        switch (this.classType) {
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
      },
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
            return `url(${require('../../images/tour-benner.png')})`;
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