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
