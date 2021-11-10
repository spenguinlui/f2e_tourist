<template>
  <div>
    <div class="container-fluid">
      <div class="class-benner"></div>
      <div class="container">
        <ClassBenner/>
        <router-view/>
      </div>
    </div>
    <div>
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
  }
}
</script>

<style lang="scss" scope>
  .class-benner {
    background-image: url('../../images/hotel-benner.png');
  }
</style>
