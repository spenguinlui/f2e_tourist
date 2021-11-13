<template>
  <div>
    <div class="container-fluid">
      <ClassBenner/>
      <div class="container">
        <router-view/>
      </div>
    </div>
  </div>
</template>

<script>
import ClassBenner from '../components/class_benner.vue';

export default {
  name: 'hotels',
  data() {
    return {
      text: '飯店列表'
    }
  },
  components: {
    ClassBenner
  },
  created() {
    this.$store.dispatch("getAllDataList", "hotels");
  }
}
</script>

<style lang="scss" scope>
  .class-benner {
    background-image: url('../../images/hotel-benner.png');
  }
</style>
