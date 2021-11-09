<template>
  <div>
    <p>{{ text }}</p>
    <ClassBenner/>
    <div>
      <router-view/>
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
