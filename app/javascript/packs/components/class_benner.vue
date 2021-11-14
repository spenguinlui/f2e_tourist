<template>
  <div>
    <div class="benner-container" :style="{ backgroundImage: bgImage }">
      <h1 class="benner-title">{{ classType_zh }}列表</h1>
      <div class="benner-btn-container">
        <div class="left-btn">
          <div class="relative">
            <div class="choose-btn" @click.stop.prevent="showSelectBlock">選擇地區</div>
            <div v-show="areaSelectBlockVisible" ref="selectAreaBlockContainer">
              <SelectAreaBlock :hideSelectBlock="hideSelectBlock"/>
            </div>
          </div>
          <div class="choose-btn">選擇日期</div>
        </div>
        <div class="right-btn">
          <button class="filter-btn">篩選<img src="../../images/icon/filter-f.svg" alt="切換列表icon"></button>
          <div v-if="classType === 'scenicspots'" @click="isMap = !isMap">
            <router-link v-show="isMap" :to="{ name: 'scenicspots-list' }" class="filter-icon-btn"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!isMap" :to="{ name: 'scenicspots-map' }" class="filter-icon-btn"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
          </div>
          <div v-if="classType === 'activities'" @click="isMap = !isMap">
            <router-link v-show="isMap" :to="{ name: 'activities-list' }" class="filter-icon-btn"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!isMap" :to="{ name: 'activities-map' }" class="filter-icon-btn"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
          </div>
          <div v-if="classType === 'hotels'" @click="isMap = !isMap">
            <router-link v-show="isMap" :to="{ name: 'hotels-list' }" class="filter-icon-btn"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!isMap" :to="{ name: 'hotels-map' }" class="filter-icon-btn"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
          </div>
          <div v-if="classType === 'restaurants'" @click="isMap = !isMap">
            <router-link v-show="isMap" :to="{ name: 'restaurants-list' }" class="filter-icon-btn"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
            <router-link v-show="!isMap" :to="{ name: 'restaurants-map' }" class="filter-icon-btn"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
          </div>
        </div>
      </div>
    </div>
    <div class="benner-m-menu">
      <div class="left-block">
        <div class="relative">
          <div class="left-btn" @click.stop.prevent="showSelectBlock">選擇地區</div>
          <div v-show="areaSelectBlockVisible" ref="selectAreaBlockContainer">
            <SelectAreaBlock :hideSelectBlock="hideSelectBlock"/>
          </div>
        </div>
        <div class="left-btn">選擇日期</div>
      </div>

      <div class="right-block">
        <div class="right-btn"><img src="../../images/icon/filter-f.svg" alt="切換列表icon"></div>
        <div v-if="classType === 'scenicspots'" @click="isMap = !isMap">
          <router-link v-show="isMap" :to="{ name: 'scenicspots-list' }" class="right-btn"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
          <router-link v-show="!isMap" :to="{ name: 'scenicspots-map' }" class="right-btn"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
        </div>
        <div v-if="classType === 'activities'" @click="isMap = !isMap">
          <router-link v-show="isMap" :to="{ name: 'activities-list' }" class="right-btn"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
          <router-link v-show="!isMap" :to="{ name: 'activities-map' }" class="right-btn"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
        </div>
        <div v-if="classType === 'hotels'" @click="isMap = !isMap">
          <router-link v-show="isMap" :to="{ name: 'hotels-list' }" class="right-btn"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
          <router-link v-show="!isMap" :to="{ name: 'hotels-map' }" class="right-btn"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
        </div>
        <div v-if="classType === 'restaurants'" @click="isMap = !isMap">
          <router-link v-show="isMap" :to="{ name: 'restaurants-list' }" class="right-btn"><img src="../../images/icon/list-f.svg" alt="切換列表icon"></router-link>
          <router-link v-show="!isMap" :to="{ name: 'restaurants-map' }" class="right-btn"><img src="../../images/icon/map-f.svg" alt="切換地圖icon"></router-link>
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
        isMap: false,
        areaSelectBlockVisible: false
      }
    },
    methods: {
      showSelectBlock () {
        if (this.areaSelectBlockVisible) {
          this.hideSelectBlock();
        } else {
          this.areaSelectBlockVisible = true
          document.addEventListener('click', this.checkElementIsNotBlock, false);
        }
      },
      hideSelectBlock () {
        this.areaSelectBlockVisible = false;
        document.removeEventListener('click', this.checkElementIsNotBlock, false)
      },
      checkElementIsNotBlock (e) {
        if (!this.$refs.selectAreaBlockContainer.contains(e.target)) {
          this.hideSelectBlock();
        }
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