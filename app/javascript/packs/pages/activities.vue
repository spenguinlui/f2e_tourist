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
  name: 'activities',
  data() {
    return {
      text: '活動列表'
    }
  },
  components: {
    ClassBenner
  }
}
</script>
