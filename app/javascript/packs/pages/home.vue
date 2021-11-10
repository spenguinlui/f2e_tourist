<template>
  <div>
    <div class="home-benner">
      <GlobalSearch :size="'xl'"/>
    </div>
    <div>
      <h5>熱門景點</h5>
      <Card/><Card/><Card/><Card/>
    </div>
    <div>
      <router-link :to="{ name: 'theme' }">主題式介紹</router-link>
      <div>
        <Card/><Card/><Card/><Card/>
      </div>
    </div>
  </div>
</template>

<script>
import GlobalSearch from '../components/global_search.vue';
import Card from '../components/card.vue';

export default {
  name: 'home',
  data() {
    return {
      text: '這是 home'
    }
  },
  components: {
    GlobalSearch,
    Card
  }
}
</script>
