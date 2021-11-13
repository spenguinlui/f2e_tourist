<template>
  <div>
    <div :class="`card ${classType || ''} ${type}`" @click="toDetail(item.ID)">
      <div class="card-img">
        <img v-if="!item.Picture || !item.Picture.PictureUrl1" src="../../images/empty-img.png" alt="no-imag'">
        <img v-if="item.Picture && item.Picture.PictureUrl1" :src="item.Picture.PictureUrl1" :alt="item.Picture.PictureDescription1">
        <div class="card-icon"></div>
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
          <div class="btn-tag-filled">文化活動</div>
          <div class="btn-tag-filled">熱鬧</div>
          <div class="btn-tag-filled">一年一度</div>
        </div>
        <div v-if="classType === 'full-card'" class="card-text">
          {{ item.Description }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['item', 'type', 'classType'],
    data () {
      return {
        // card 內的 dataType 是吃父元件傳進來的，因為一頁內可能會有多種類型
      }
    },
    methods: {
      toDetail(id) {
        console.log(this.item.Name, id)
        this.$router.push(`/detail/${id}/${this.type}`);
      }
    }
  }
</script>