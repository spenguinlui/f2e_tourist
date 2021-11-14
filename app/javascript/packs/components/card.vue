<template>
  <div>
    <div :class="`card ${classType || ''} ${type}`" @click="toDetail(item.ID)">
      <div class="card-img">
        <img v-if="!item.Picture || !item.Picture.PictureUrl1" src="../../images/empty-img.png" alt="no-imag'">
        <img v-if="item.Picture && item.Picture.PictureUrl1" :src="item.Picture.PictureUrl1" :alt="item.Picture.PictureDescription1">
        <div :class="heart ? 'card-icon filled' : 'card-icon'" @click.prevent.stop="changeFavorite(item.ID)">
          <img v-show="heart" src="../../images/icon/heart-filled.svg" alt="加入我的最愛icon">
          <img v-show="!heart" src="../../images/icon/heart-outline.svg" alt="加入我的最愛icon">
        </div>
      </div>
      <div class="card-content">
        <div class="card-title">{{ item.Name }}</div>
        <div class="card-stars">
          <img src="../../images/icon/star-filled.svg" alt="滿星icon">
          <img src="../../images/icon/star-filled.svg" alt="滿星icon">
          <img src="../../images/icon/star-filled.svg" alt="滿星icon">
          <img src="../../images/icon/half-star-filled.svg" alt="半星icon">
          <img src="../../images/icon/star-outline.svg" alt="空星icon">
        </div>
        <div class="card-tags">
          <template v-for="(tag, index) in item.Tag">
            <div class="card-tag" :key="index">{{ tag }}</div>
          </template>
          <div v-if="!item.Tag" class="card-tag">尚未建立</div>
        </div>
        <div v-if="classType === 'full-card'" class="card-text">
          {{ item.Description }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex';

  export default {
    props: ['item', 'type', 'classType'],
    data () {
      return {
        // card 內的 dataType 是吃父元件傳進來的，因為一頁內可能會有多種類型
        heart: false
      }
    },
    computed: {
      ...mapGetters(['heartIsLoading'])
    },
    methods: {
      toDetail(id) {
        this.$router.push(`/detail/${id}/${this.type}`);
      },
      changeFavorite(id) {
        if (!this.$store.getters.heartIsLoading) {
          // 要 getter heartIsLoading=false 才能改變
          this.$store.dispatch("changeFavoriteToData", id);
          this.heart = !this.heart;
        }
      },
      initFavorite() {
        const id = this.item.ID;
        const heartArray = JSON.parse(localStorage.getItem("touristHeart"));
        if (heartArray) {
          localStorage.setItem("touristHeart", JSON.stringify([]));
        }
        if (heartArray.indexOf(id) >= 0) {
          this.heart = true;
        }
      }
    },
    created() {
      this.initFavorite();
    }
  }
</script>