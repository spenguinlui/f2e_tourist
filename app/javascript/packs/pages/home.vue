<template>
  <div>
    <div class="container-fluid">
      <div class="home-benner">
        <GlobalSearch :size="'xl'"/>
      </div>
      <div class="section home-section">
        <div class="section-title">
          <div class="section-left">熱門景點</div>
          <div class="section-right">
            <div class="btn-text btn-filled">查看更多</div>
          </div>
        </div>
        <div class="card-slider-row">
          <div v-for="item in hotDataList.scenicspots" :key="item.ID" class="row-item">
            <Card :item="item" :type="'scenicspots'"/>
          </div>
          <div v-for="item in hotDataList.activities" :key="item.ID" class="row-item">
            <Card :item="item" :type="'activities'"/>
          </div>
          <div v-for="item in hotDataList.restaurants" :key="item.ID" class="row-item">
            <Card :item="item" :type="'restaurants'"/>
          </div>
          <div v-for="item in hotDataList.hotels" :key="item.ID" class="row-item">
            <Card :item="item" :type="'hotels'"/>
          </div>
        </div>
      </div>
      <div class="home-theme">
        <div>
          <div class="theme-tittle">你不能錯過的注目景點！</div>
          <router-link :to="{ name: 'theme' }" class="btn-text btn-filled">賞楓秘境看這裡</router-link>
        </div>
      </div>
      <div class="home-section">
        <div class="hot-tittle">
          <div class="hot-left">{{ themeName }}</div>
          <div class="hot-right">
            <div class="btn-text btn-filled">查看更多</div>
          </div>
        </div>
        <div class="card-slider-row">
          <div v-for="item in themeDataList.scenicspots" :key="item.ID" class="row-item">
            <Card :item="item" :type="'scenicspots'"/>
          </div>
          <div v-for="item in themeDataList.activities" :key="item.ID" class="row-item">
            <Card :item="item" :type="'activities'"/>
          </div>
          <div v-for="item in themeDataList.restaurants" :key="item.ID" class="row-item">
            <Card :item="item" :type="'restaurants'"/>
          </div>
          <div v-for="item in themeDataList.hotels" :key="item.ID" class="row-item">
            <Card :item="item" :type="'hotels'"/>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import GlobalSearch from '../components/global_search.vue';
import Card from '../components/card.vue';
import { mapGetters } from 'vuex';

export default {
  name: 'home',
  data() {
    return {
      text: '這是 home'
    }
  },
  computed: {
    ...mapGetters(['hotDataList', 'themeDataList', 'themeName'])
  },
  components: {
    GlobalSearch,
    Card
  },
  created() {
    this.$store.dispatch("getHotDataList");
    this.$store.dispatch("getRandomThemeDataList");
  }
}
</script>
