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
  name: 'scenicspots',
  data() {
    return {
      text: '景點列表'
    }
  },
  components: {
    ClassBenner
  }
}
</script>

<style lang="scss" scope>
  .class-benner {
    background-image: url('../../images/tour-benner.png');
  }
</style>