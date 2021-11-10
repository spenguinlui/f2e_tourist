<template>
  <div>
    <div class="select-area-block">
      <GlobalSearch :size="'g'"/>
      <div class="area">
        <div class="v-area">北部</div>
        <div class="area-block">
          <div class="area-title">
            <div class="title-text">基隆市</div>
            <div class="title-icon"></div>
          </div>
          <div class="area-list">
            <div class="area-item">仁愛區</div>
            <div class="area-item">中正區</div>
            <div class="area-item">信義區</div>
            <div class="area-item">中山區</div>
            <div class="area-item">安樂區</div>
            <div class="area-item">七堵區</div>
            <div class="area-item">暖暖區</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import GlobalSearch from './global_search.vue';
  export default {
    data () {
      return {
        text: "這裡是選擇地區"
      }
    },
    components: {
      GlobalSearch
    }
  }
</script>