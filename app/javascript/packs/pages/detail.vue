<template>
  <div>
    <div class="container-fluid">
      <div class="container">
        <div class="breadcrumbs">未完成 > 麵包屑 > 未完成</div>
        <div class="detail-header">
          <div class="detail-title">
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
              <template v-for="tag in ['文化活動', '熱鬧', '一年一度']">
                <div class="detail-tag" :key="tag">{{ tag }}</div>
              </template>
            </div>
          </div>
          <div class="detail-connect">
            <a class="call-btn" :href="`tel:${dataDetail.Phone}`">撥打電話<img src="../../images/icon/phone.svg" alt="撥打電話icon"></a>
            <div class="more-btn"><img src="../../images/icon/web.svg" alt="前往網站icon"></div>
            <div class="more-btn"><img src="../../images/icon/heart-outline.svg" alt="加入我的最愛icon"></div>
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
          <div v-if="!dataDetail.DescriptionDetail" class="no-content">目前資料不足！</div>
          <div v-if="dataDetail.DescriptionDetail" class="detail-content">{{ dataDetail.DescriptionDetail }}</div>
        </div>
        <div class="detail-feature">
          <div class="detail-title">{{ dataDetail === "restaurants" ? '餐點推薦' : '服務設施' }}</div>
          <div v-if="!dataDetail.Features2" class="no-content">目前資料不足！</div>
          <div v-if="dataDetail.Features2" class="detail-content">{{ dataDetail.Features2 }}</div>
        </div>
        <div v-if="dataDetail.ServiceInfo" class="detail-feature">
          <div class="detail-title">服務設施</div>
          <div v-if="dataDetail.ServiceInfo" class="detail-content">{{ dataDetail.ServiceInfo }}</div>
        </div>
        <div class="detail-traffic">
          <div class="detail-title">交通方式</div>
          <div v-if="!dataDetail.TravelInfo" class="no-content">製作中！</div>
          <div v-if="dataDetail.TravelInfo" class="detail-content">{{ dataDetail.TravelInfo }}</div>
        </div>
        <div class="detail-nearby">
          <div class="detail-title">鄰近景點</div>
          <div class="detail-nearby-block">
            <div class="detail-left">製作中</div>
            <div class="detail-right">
              <div class="map">
                製作中
              </div>
            </div>
          </div>
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
          <div class="recommend-container">
            <div v-for="item in recommendList" :key="item.ID" class="card-container">
              <Card :key="item.ID" :item="item" :type="dataType" :classType="'commonCard'"/>
            </div>
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
          case "scenicspots":
            return "景點";
          default:
            return "其他";
        }
      },
      ...mapGetters(['dataDetail', 'recommendList'])
    },
    methods: {
      getDetail() {
        const dataId = this.dataId = this.$route.params.id;
        const dataType = this.dataType = this.$route.params.type;
        this.$store.dispatch("getSingleDataDetail", { dataType, dataId });
      },
      checkImage(PictureUrl) {
        this.$store.dispatch("changeShowPicture", PictureUrl);
      },
      getNearBusStops() {
        // ... 等 API 建好
      },
      getNearBy() {
        // ... 等 API 建好
      },
      getComments() {
        // ... 等 comment db
      },
      getRecommends() {
        this.$store.dispatch("getRecommendList", this.dataType);
      }
    },
    created() {
      this.getDetail();
      // 分別執行，怕全部一起要會太久
      // this.getNearBusStops();
      // this.getNearBy();
      // this.getComments();
      this.getRecommends();
    },
    components: {
      Card
    }
  }
</script>