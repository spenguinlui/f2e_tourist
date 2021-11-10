<template>
  <div>
    <div calss="home-benner">
      <GlobalSearch :size="'xl'"/>
    </div>
  </div>
</template>

<script>
  import GlobalSearch from './global_search.vue';

  export default {
    data () {
      return {
        text: "這裡是首頁橫幅"
      }
    },
    components: {
      GlobalSearch
    }
  }
</script>