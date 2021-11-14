<template>
  <div class="container-fluid">
    <CommonBenner/>
    <div class="container">
      <div v-if="searchData.scenicspots" class="content">
        <template v-if="Object.keys(searchData.scenicspots).length > 0">
          <div v-for="item in searchData.scenicspots" :key="item.ID" class="card-container">
            <Card :item="item" :type="'scenicspots'"/>
          </div>
        </template>
        <template v-if="Object.keys(searchData.activities).length > 0">
          <div v-for="item in searchData.activities" :key="item.ID" class="card-container">
            <Card :item="item" :type="'activities'"/>
          </div>
        </template>
        <template v-if="Object.keys(searchData.restaurants).length > 0">
          <div v-for="item in searchData.restaurants" :key="item.ID" class="card-container">
            <Card :item="item" :type="'restaurants'"/>
          </div>
        </template>
        <template v-if="Object.keys(searchData.hotels).length > 0">
          <div v-for="item in searchData.hotels" :key="item.ID" class="card-container">
            <Card :item="item" :type="'hotels'"/>
          </div>
        </template>
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
