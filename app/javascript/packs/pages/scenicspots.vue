<template>
  <div>
    <div class="container-fluid">
      <ClassBenner @updateData="updateData"/>
      <div class="container">
        <router-view />
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
  },
  methods: {
    updateData(query) {
      console.log(query);
    }
  }
}
</script>

<style lang="scss" scope>
  .class-benner {
    background-image: url('../../images/tour-benner.png');
  }
</style>