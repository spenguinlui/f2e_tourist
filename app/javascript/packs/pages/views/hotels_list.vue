<template>
  <div>
    <div class="content">
      <div v-for="item in dataList" :key="item.ID" class="col-xl-4 p-15">
        <Card :item="item" :type="dataType"/>
      </div>
    </div>
  </div>
</template>

<script>
  import Card from '../../components/card.vue';
  import { mapGetters } from 'vuex';

  export default {
    name: 'hotels-list',
    data () {
      return {
        text: "這裡是 hotels-list",
        // dataList: [
        //   {ID: "0", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
        //   {ID: "1", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
        //   {ID: "2", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
        //   {ID: "3", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
        //   {ID: "4", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
        //   {ID: "5", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }}
        // ]
      }
    },
    computed: {
      ...mapGetters(['dataList', 'dataType']),
    },
    components: {
      Card
    },
    created() {
      this.$store.dispatch("getAllDataList", "hotels");
    }
  }
</script>