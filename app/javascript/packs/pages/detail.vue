<template>
  <div>
    <div class="breadcrumbs">這裡是麵包屑</div>
    <div class="detail-header">
      <div class="detail-title col-xl-9">
        <div class="title-text h1">{{ dataContent.Name }}</div>
        <div class="detail-stars">
          <img src="../../images/icon/star-filled.svg" alt="滿星icon">
          <img src="../../images/icon/star-filled.svg" alt="滿星icon">
          <img src="../../images/icon/star-filled.svg" alt="滿星icon">
          <img src="../../images/icon/half-star-filled.svg" alt="半星icon">
          <img src="../../images/icon/star-outline.svg" alt="空星icon">
        </div>
        <div class="detail-comment-count">{{ dataContent.Comment && dataContent.Comment.length || '100' }} 則評論</div>
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
    <div class="detail-content">
      <div class="col-xl-4">
        <div class="detail-about">
          <div class="detail-title">關於</div>
          <div class="detail-content">{{ dataContent.Description }}</div>
        </div>
        <div class="detail-address">
          <div class="detail-title">地址</div>
          <div class="detail-content">{{ dataContent.Address }}</div>
        </div>
        <div class="detail-opentime">
          <div class="detail-title">營業時間</div>
          <div class="detail-content">{{ dataContent.OpenTime }}</div>
        </div>
      </div>
      <div class="col-xl-8">
        <img :src="dataContent.PictureUrl1" :alt="dataContent.PictureDescription1">
      </div>
    </div>
    <div class="detail-feature">
      <div class="detail-title">{{ classType_zh }}特色</div>
      <div class="detail-article"></div>
    </div>
    <div class="detail-feature">
      <div class="detail-title">{{ classType === "restaurants" ? '餐點推薦' : '服務設施' }}</div>
      <div class="detail-article"></div>
    </div>
    <div class="detail-traffic">
      <div class="detail-title">交通方式</div>
      <div class="detail-article"></div>
    </div>
    <div class="detail-nearby">
      <div class="detail-title">附近景點</div>
      <div class="col-xl-4"></div>
      <div class="col-xl-8"></div>
    </div>
    <div class="detail-comment">旅客評價</div>
    <div class="detail-recommend">
      <div v-if="dataContent.Recommend">
        <Card/><Card/><Card/>
      </div>
    </div>
  </div>
</template>

<script>
  import Rails from '@rails/ujs';
  import Card from '../components/card.vue';

  export default {
    data () {
      return {
        dataId: "",
        classType: "",
        dataContent: {
          Name: "",
          Description: "",
          Address: "",
          OpenTime: "",
          Phone: "",
          Picture: {
            PictureDescription1: "",
            PictureUrl1: ""
          },
          Position: {
            PositionLat: "",
            PositionLon: ""
          }
        },
        // 以下要用 db 補
        Feature: [{}],
        Traffic: "",
        Comment: [{}],
        Recommend: [{}]
      }
    },
    computed: {
      classType_zh() {
        switch (this.classType) {
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
    },
    methods: {
      getDetail() {
        this.dataId = this.$route.params.id;
        this.classType = this.$route.params.type;
        Rails.ajax({
          url: `/api/v1/detail/${this.classType}/${this.dataId}`,
          type: 'GET',
          dataType: 'json',
          success: res => {
            this.dataContent = res;
            console.log(res);
          },
          error: error => {
            console.log(error);            
          }
        })
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