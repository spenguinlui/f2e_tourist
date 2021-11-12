<template>
  <div>
    <div class="container-fluid">
      <ClassBenner/>
      <div class="container">
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
  name: 'restaurants',
  data() {
    return {
      text: '餐廳列表'
    }
  },
  components: {
    ClassBenner
  }
}
</script>

<style lang="scss" scope>
  .class-benner {
    background-image: url('../../images/food-benner.png');
  }
</style>

