<template>
  <div :class="`search-bar ${sizeType}`">
    <input v-if="size === 's'" type="text" placeholder="想要去哪？">
    <input v-if="size === 'g'" class="text-grey-500" type="text" placeholder="想要去哪？">
    <input v-if="size === 'xl'" type="text" calss="h5" placeholder="想要去哪？">
    <div v-if="size !== 'xl'"><img calss="h5" src="../../images/icon/search.svg" alt="搜尋"></div>
    <div v-if="size === 'xl'"><img calss="h5" src="../../images/icon/search-xl.svg" alt="搜尋"></div>
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