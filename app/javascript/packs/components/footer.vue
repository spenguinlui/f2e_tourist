<template>
  <footer>
    <div class="footer">
      <div class="footer-brand">
        <img src="../../images/icon/footer-logo.svg" alt="logoicon">
        <div class="footer-icon">
          <img src="../../images/icon/facebook.svg" alt="facebookicon">
          <img src="../../images/icon/line.svg" alt="lineicon">
          <img src="../../images/icon/twitter.svg" alt="twittericon">
        </div>
      </div>
      <div class="footer-link">
        <div class="footer-item">
          <router-link :to="{ name: 'scenicspots-list' }">找景點</router-link>
          <router-link :to="{ name: 'theme' }">主題景點</router-link>
        </div>
        <!-- <div class="footer-item">
          <router-link :to="{ name: 'activities' }">找活動</router-link>
          <router-link :to="{ name: 'theme' }">主題活動</router-link>
        </div> -->
        <div class="footer-item">
          <router-link :to="{ name: 'restaurants-list' }">找餐廳</router-link>
          <router-link :to="{ name: 'theme' }">主題餐廳</router-link>
        </div>
        <div class="footer-item">
          <router-link :to="{ name: 'hotels-list' }">找飯店</router-link>
          <router-link :to="{ name: 'theme' }">嚴選住宿</router-link>
        </div>
        <div class="footer-item">
          <router-link :to="{ name: 'login' }">會員登入</router-link>
          <router-link :to="{ name: 'suppliers' }">商家專區</router-link>
        </div>
      </div>
      <div class="footer-copyright">Copyright ©</div>
    </div>
  </footer>
</template>

<script>
  export default {
    data () {
      return {
        text: "這裡是 footer"
      }
    }
  }
</script>