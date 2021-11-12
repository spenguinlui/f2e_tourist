<template>
  <div>
    <div class="container-fluid">
      <CommonBenner/>
      <div class="container">
        <div v-if="searchData.scenicspots.length > 0" class="section">
          <div class="section-title">
            <div class="section-left">景點</div>
            <div class="section-right">
              <div class="btn-text btn-filled">查看更多</div>
            </div>
          </div>
          <div class="section-list">
            <div v-for="item in searchData.scenicspots" :key="item.ID" class="col-xl-4 p-15">
              <Card :item="item" :type="'scenicspots'"/>
            </div>
          </div>
        </div>
        <div  v-if="searchData.activities.length > 0" class="section">
          <div class="section-title">
            <div class="section-left">活動</div>
            <div class="section-right">
              <div class="btn-text btn-filled">查看更多</div>
            </div>
          </div>
          <div class="section-list">
            <div v-for="item in searchData.activities" :key="item.ID" class="col-xl-4 p-15">
              <Card :item="item" :type="'activities'"/>
            </div>
          </div>
        </div>
        <div v-if="searchData.restaurants.length > 0" class="section">
          <div class="section-title">
            <div class="section-left">餐廳</div>
            <div class="section-right">
              <div class="btn-text btn-filled">查看更多</div>
            </div>
          </div>
          <div class="section-list">
            <div v-for="item in searchData.restaurants" :key="item.ID" class="col-xl-4 p-15">
              <Card :item="item" :type="'restaurants'"/>
            </div>
          </div>
        </div>
        <div v-if="searchData.hotels.length > 0" class="section">
          <div class="section-title">
            <div class="section-left">住宿</div>
            <div class="section-right">
              <div class="btn-text btn-filled">查看更多</div>
            </div>
          </div>
          <div class="section-list">
            <div v-for="item in searchData.hotels" :key="item.ID" class="col-xl-4 p-15">
              <Card :item="item" :type="'hotels'"/>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Card from '../components/card.vue';
import CommonBenner from '../components/common_benner.vue'
import { mapGetters } from 'vuex';

export default {
  name: 'theme',
  data() {
    return {
      text: '搜尋結果'
    }
  },
  computed: {
    ...mapGetters(['searchData']),
  },
  components: {
    Card,
    CommonBenner
  },
  created() {
    const keyword = this.$route.query.keyword;
    if (Object.keys(this.$store.getters.searchData).length === 0) {
      this.$store.dispatch("filterDataListWithKeyword", keyword);
    }
  }
}
</script>
