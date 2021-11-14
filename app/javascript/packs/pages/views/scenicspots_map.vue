<template>
  <div class="content">
    <div class="map-container">
      <div class="map-left">
        <div v-for="item in dataList" :key="item.ID" class="card-container">
          <Card :item="item" :type="dataType" :classType="'full-card'"/>
        </div>
      </div>
      <div class="map-right">
        <div class="map">
          地圖功能趕工中
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Card from '../../components/card.vue';
  import { mapGetters } from 'vuex';

  export default {
    name: 'scenicspots-map',
    data () {
      return {
        text: "這裡是 scenicspots-map"
      }
    },
    computed: {
      ...mapGetters(['dataList', 'dataType']),
    },
    components: {
      Card
    }
  }
</script>