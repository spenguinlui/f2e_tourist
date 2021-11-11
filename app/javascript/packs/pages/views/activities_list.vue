<template>
  <div>
    <div class="content">
      <div v-for="item in dataList" :key="item.ID" class="col-xl-4">
        <Card :item="item"/>
      </div>
    </div>
  </div>
</template>


<script>
  import Card from '../../components/card.vue';
  import Rails from '@rails/ujs';

  export default {
    name: 'activities-list',
    data () {
      return {
        text: "這裡是 activities-list",
        dataList: [
          {ID: "0", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
          {ID: "1", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
          {ID: "2", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
          {ID: "3", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
          {ID: "4", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
          {ID: "5", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }}
        ]
      }
    },
    components: {
      Card
    },
    beforecreateCreate() {
      Rails.ajax({
        url: "/api/v1/activities",
        type: 'GET',
        dataType: 'json',
        success: res => {
          this.dataList = res;
          // console.log(res);
        },
        error: error => {
          console.log(error);            
        }
      })
    }
  }
</script>