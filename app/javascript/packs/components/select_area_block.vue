<template>
  <div>
    <div class="select-area-block">
      <GlobalSearch :size="'g'"/>
      <div class="area-container">
        <div v-for="(area, a_index) in areaList" :key="area.area" class="area">
          <div class="v-area">{{ area.area }}</div>
          <div v-for="(city, c_index) in area.citys" :key="city.city_name" class="area-block">
            <div class="area-title" @click="toggleList(a_index, c_index)">
              <div class="title-text">{{ city.city_name }}</div>
              <div class="title-icon" :class="city.is_open ? 'show' : ''"></div>
            </div>
            <div class="area-list" v-show="city.is_open">
              <div v-for="dist in city.dists" :key="dist.TownName" class="area-item" :class="currentArea === dist.TownName ? 'active' : ''">
                <div @click="filterCityData(dist.TownName)">{{ dist.TownName }}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import GlobalSearch from './global_search.vue';
  import { mapGetters } from 'vuex';

  export default {
    data () {
      return {
        // areaList: [
        //   { area: "" , citys: [{ city: "", city_name: "", is_open: false, dists: [{ TownName: "" }] }]}
        // ]
      }
    },
    methods: {
      toggleList(areaIndex, cityIndex) {
        this.$store.dispatch("toggleAreaList", { areaIndex, cityIndex })
        // this.areasData[a_index].citys[c_index].is_open = !this.areasData[a_index].citys[c_index].is_open;
      },
      filterCityData(townName) {
        this.$store.dispatch("filterDataListWithTown", townName);
      },
      getCityTownList() {
        this.$store.dispatch("getCityTownList");
      }
    },
    computed: {
      ...mapGetters(['areaList', 'currentArea'])
    },
    components: {
      GlobalSearch
    },
    created() {
      this.getCityTownList();
    }
  }
</script>