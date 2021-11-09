<template>
  <div>
    {{ text }}
  </div>
</template>

<script>
  import Card from '../components/card.vue';

  export default {
    data () {
      return {
        text: "這裡是 suppliers"
      }
    },
    components: {
      Card
    }
  }
</script>