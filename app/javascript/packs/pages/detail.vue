<template>
  <div>
    <div class="container-fluid">
      <div class="container">
        <div class="breadcrumbs">這裡是麵包屑</div>
        <div class="detail-header">
          <div class="detail-title col-xl-9">
            <div class="title-text">{{ dataDetail.Name }}</div>
            <div class="detail-comment-block">
              <div class="detail-stars">
                <img src="../../images/icon/star-filled.svg" alt="滿星icon">
                <img src="../../images/icon/star-filled.svg" alt="滿星icon">
                <img src="../../images/icon/star-filled.svg" alt="滿星icon">
                <img src="../../images/icon/half-star-filled.svg" alt="半星icon">
                <img src="../../images/icon/star-outline.svg" alt="空星icon">
              </div>
              <div class="detail-comment-count">{{ dataDetail.Comment && dataDetail.Comment.length || '100' }} 則評論</div>
            </div>
            <div class="detail-tags">
              <div class="btn-tag-filled">文化活動</div>
              <div class="btn-tag-filled">熱鬧</div>
              <div class="btn-tag-filled">一年一度</div>
            </div>
          </div>
          <div class="detail-connect col-xl-3">
            <div class="btn-icon-text btn-filled">撥打電話</div>
            <div class="btn-icon btn-outline"><img src="../../images/icon/web.svg" alt="前往網站icon"></div>
            <div class="btn-icon btn-outline"><img src="../../images/icon/heart-outline.svg" alt="前往網站icon"></div>
          </div>
        </div>
        <div class="detail-container">
          <div class="detail-left">
            <div class="detail-left-content">
              <div class="detail-about">
                <div class="detail-title">關於</div>
                <div class="detail-content">{{ dataDetail.Description }}</div>
              </div>
              <div class="detail-address">
                <div class="detail-title">地址</div>
                <div class="detail-content">{{ dataDetail.Address }}</div>
              </div>
              <div class="detail-opentime">
                <div class="detail-title">營業時間</div>
                <div class="detail-content">{{ dataDetail.OpenTime }}</div>
              </div>
            </div>
          </div>
          <div class="detail-right">
            <img v-if="!dataDetail.showPicture" src="../../images/empty-img.png" alt="找不到圖片">
            <img v-if="dataDetail.showPicture" :src="dataDetail.showPicture" alt="景點大圖">
            <div class="imgs-row">
              <div v-if="dataDetail.Picture && dataDetail.Picture.PictureUrl1" @click="checkImage(dataDetail.Picture.PictureUrl1)" class="img-small"><img :src="dataDetail.Picture.PictureUrl1" :alt="dataDetail.Picture.PictureDescription1"></div>
              <div v-if="!dataDetail.Picture || !dataDetail.Picture.PictureUrl1" class="img-empty"><img src="../../images/icon/empty-img-sm.svg" alt="找不到圖片"></div>
              <div v-if="dataDetail.Picture && dataDetail.Picture.PictureUrl2" @click="checkImage(dataDetail.Picture.PictureUrl2)" class="img-small" :src="dataDetail.Picture.PictureUrl2"><img :src="dataDetail.Picture.PictureUrl2" :alt="dataDetail.Picture.PictureDescription2"></div>
              <div v-if="!dataDetail.Picture || !dataDetail.Picture.PictureUrl2" class="img-empty"><img src="../../images/icon/empty-img-sm.svg" alt="找不到圖片"></div>
              <div v-if="dataDetail.Picture && dataDetail.Picture.PictureUrl3" @click="checkImage(dataDetail.Picture.PictureUrl3)" class="img-small" :src="dataDetail.Picture.PictureUrl3"><img :src="dataDetail.Picture.PictureUrl3" :alt="dataDetail.Picture.PictureDescription3"></div>
              <div v-if="!dataDetail.Picture || !dataDetail.Picture.PictureUrl3" class="img-empty"><img src="../../images/icon/empty-img-sm.svg" alt="找不到圖片"></div>
              <div v-if="dataDetail.Picture && dataDetail.Picture.PictureUrl4" @click="checkImage(dataDetail.Picture.PictureUrl4)" class="img-small" :src="dataDetail.Picture.PictureUrl4"><img :src="dataDetail.Picture.PictureUrl3" :alt="dataDetail.Picture.PictureDescription4"></div>
              <div v-if="!dataDetail.Picture || !dataDetail.Picture.PictureUrl4" class="img-empty"><img src="../../images/icon/empty-img-sm.svg" alt="找不到圖片"></div>
              <div v-if="dataDetail.Picture && dataDetail.Picture.PictureUrl5" @click="checkImage(dataDetail.Picture.PictureUrl5)" class="img-small" :src="dataDetail.Picture.PictureUrl5"><img :src="dataDetail.Picture.PictureUrl4" :alt="dataDetail.Picture.PictureDescription5"></div>
              <div v-if="!dataDetail.Picture || !dataDetail.Picture.PictureUrl5" class="img-empty"><img src="../../images/icon/empty-img-sm.svg" alt="找不到圖片"></div>
            </div>
          </div>
        </div>
        <div class="detail-feature">
          <div class="detail-title">{{ classType_zh }}特色</div>
          <div v-if="!dataDetail.Features1" class="no-content">目前資料不足！</div>
          <div v-if="dataDetail.Features1" class="detail-article">{{ dataDetail.Features1 }}</div>
        </div>
        <div class="detail-feature">
          <div class="detail-title">{{ dataDetail === "restaurants" ? '餐點推薦' : '服務設施' }}</div>
          <div v-if="!dataDetail.Features2" class="no-content">目前資料不足！</div>
          <div v-if="dataDetail.Features2" class="detail-article">{{ dataDetail.Features2 }}</div>
        </div>
        <div class="detail-traffic">
          <div class="detail-title">交通方式</div>
          <div v-if="!dataDetail.Traffic" class="no-content">製作中！</div>
          <div v-if="dataDetail.Traffic" class="detail-article">{{ dataDetail.Traffic }}</div>
        </div>
        <div class="detail-nearby">
          <div class="detail-title">附近景點</div>
          <div class="col-xl-4">製作中</div>
          <div class="col-xl-8">製作中</div>
        </div>
        <div class="detail-comment">
          <div class="detail-title">旅客評價</div>
          <div v-if="!dataDetail.Comments" class="no-content">此{{ classType_zh }}尚無評論！</div>
          <div v-if="dataDetail.Comments">
            <!-- ... -->
          </div>
        </div>
        <div class="detail-recommend">
          <div class="detail-title">這些景點大家也推</div>
          <div v-if="dataDetail.Recommend">
            <Card/><Card/><Card/>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Card from '../components/card.vue';
  import { mapGetters } from 'vuex';

  export default {
    data () {
      return {
        dataId: "",
        dataType: ""
      }
    },
    computed: {
      classType_zh() {
        switch (this.dataType) {
          case "activities":
            return "活動";
          case "restaurants":
            return "餐廳";
          case "hotels":
            return "飯店";
          case "scenic_spots":
            return "景點";
          default:
            return "其他";
        }
      },
      ...mapGetters(['dataDetail'])
    },
    methods: {
      getDetail() {
        const dataId = this.dataId = this.$route.params.id;
        const dataType = this.dataType = this.$route.params.type;
        console.log(this.dataType)
        this.$store.dispatch("getSingleDataDetail", { dataType, dataId })
      },
      checkImage(PictureUrl){
        this.$store.dispatch("changeShowPicture", PictureUrl);
      }
    },
    created() {
      this.getDetail();
    },
    components: {
      Card
    }
  }
</script>