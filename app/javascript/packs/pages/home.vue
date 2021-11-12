<template>
  <div>
    <div class="container-fluid">
      <div class="home-benner">
        <GlobalSearch :size="'xl'"/>
      </div>
      <div class="home-section">
        <div class="hot-tittle">
          <div class="hot-left">熱門景點</div>
          <div class="hot-right">
            <div class="btn-text btn-filled">查看更多</div>
          </div>
        </div>
        <div class="card-slider-row">
          <div class="col-xl-3">
            <Card/>
          </div>
          <div class="col-xl-3">
            <Card/>
          </div>
          <div class="col-xl-3">
            <Card/>
          </div>
          <div class="col-xl-3">
            <Card/>
          </div>
        </div>
      </div>
      <div class="home-theme">
        <div>
          <div class="theme-tittle">
            <router-link :to="{ name: 'theme' }">你不能錯過的注目景點！</router-link>
          </div>
          <div class="btn-text btn-filled">賞楓秘境看這裡</div>
        </div>
      </div>
      <div class="home-section">
        <div class="hot-tittle">
          <div class="hot-left">Rainbow Life!</div>
          <div class="hot-right">
            <div class="btn-text btn-filled">查看更多</div>
          </div>
        </div>
        <div class="card-slider-row">
          <div class="col-xl-3">
            <Card/>
          </div>
          <div class="col-xl-3">
            <Card/>
          </div>
          <div class="col-xl-3">
            <Card/>
          </div>
          <div class="col-xl-3">
            <Card/>
          </div>
        </div>
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
