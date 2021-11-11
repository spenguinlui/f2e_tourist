<template>
  <div>
    <div v-show="open" class="select-area-block">
      <GlobalSearch :size="'g'"/>
      <div class="area-container">
        <div v-for="(area, a_index) in areasData" :key="area.area" class="area">
          <div class="v-area">{{ area.area }}</div>
          <div v-for="(city, c_index) in area.citys" :key="city.city_name" class="area-block">
            <div class="area-title" @click="toggleList(a_index, c_index)">
              <div class="title-text">{{ city.city_name }}</div>
              <div class="title-icon" :class="city.is_open ? 'show' : ''"></div>
            </div>
            <div class="area-list" v-show="city.is_open">
              <div v-for="dist in city.dists" :key="dist.TownName" class="area-item">
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
  import Rails from '@rails/ujs';

  export default {
    props: ['open'],
    data () {
      return {
        areasData: [
          { area: "" , citys: [{ city: "", city_name: "", is_open: false, dists: [{ TownName: "" }] }]}
        ]
      }
    },
    methods: {
      toggleList(a_index, c_index) {
        this.areasData[a_index].citys[c_index].is_open = !this.areasData[a_index].citys[c_index].is_open;
      },
      filterCityData(townName) {
        this.$emit('updateData', townName); 
      }
    },
    components: {
      GlobalSearch
    },
    beforeCreate() {
      Rails.ajax({
        url: "/api/v1/citys",
        type: 'GET',
        dataType: 'json',
        success: res => {
          this.areasData = res;
          // console.log(res);
        },
        error: error => {
          console.log(error);            
        }
      })
    }
  }
</script>