<template>
  <div>
    <p>{{ text }}</p>
    <div>
      <Card/><Card/><Card/><Card/>
    </div>
  </div>
</template>

<script>
import Card from '../components/card.vue';

export default {
  name: 'theme',
  data() {
    return {
      text: '主題式介紹'
    }
  },
  components: {
    Card
  }
}
</script>
