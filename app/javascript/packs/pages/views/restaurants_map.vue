<template>
  <div>
    <div class="content">
      <div class="col-xl-4 map-left">
        <div v-for="item in dataList" :key="item.ID">
          <Card :item="item" :type="dataType" :classType="'full-card'"/>
        </div>
      </div>
      <div class="col-xl-8 map-right">
        <div class="map">

        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Card from '../../components/card.vue';
  import { mapGetters } from 'vuex';

  export default {
    name: 'restaurants-map',
    data () {
      return {
        text: "這裡是 restaurants-map"
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