<template>
  <div id="app">
    <Navbar/>
    <router-view/>
    <Footer/>
  </div>
</template>

<script>
import Navbar from './components/navbar.vue';
import Footer from './components/footer.vue';

export default {
  name: 'App',
  components: {
    Navbar,
    Footer
  },
  methods: {
    initFavorite() {
      const heartArray = JSON.parse(localStorage.getItem("touristHeart"));
      // 查看是否有 localstorage 的珍藏列表
      if(!heartArray) { 
        // 沒有就設一個空陣列
        localStorage.setItem("touristHeart", JSON.stringify([]));
      } else {
        // 有就取出來放 vuex
        this.$store.dispatch("getFavorites");
      }
    }
  },
  created() {
    this.initFavorite();
  }
}
</script>
