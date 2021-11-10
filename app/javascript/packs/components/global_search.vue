<template>
  <div :class="`search-bar ${sizeType}`">
    <div v-if="size === 's'">{{ text }}</div>
    <div v-if="size === 'g'" class="text-grey-500">{{ text }}</div>
    <h5 v-if="size === 'xl'">{{ text }}</h5>
    <div><img src="../../images/icon/search.svg" alt="搜尋"></div>
  </div>
</template>

<script>
  export default {
    props: ['size'],
    data () {
      return {
        text: "想要去哪？"
      }
    },
    computed: {
      sizeType() {
        if (this.size === 'xl') {
          return 'search-bar-xl';
        } else if (this.size === 's') {
          return 'search-bar-s';
        } else if (this.size === 'g') {
          return 'search-bar-s bg-grey-200';
        }
      }
    }
  }
</script>