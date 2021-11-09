<template>
  <div>
    {{ text }}
    <Card/><Card/><Card/>
  </div>
</template>

<script>
  import Card from '../components/card.vue';

  export default {
    data () {
      return {
        text: "這裡是 favorites"
      }
    },
    components: {
      Card
    }
  }
</script>