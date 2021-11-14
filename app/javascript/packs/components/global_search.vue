<template>
  <div :class="`search-bar ${sizeType}`">
    <input v-model="keyword" @keyup.enter="goSearch" :class="size === 'g' ? (size === 'xl' ? 'text-grey-500' : 'h5') : ''" type="text" placeholder="想要去哪？">
    <div @click="goSearch">
      <img v-if="size !== 'xl'" src="../../images/icon/search.svg" alt="搜尋">
      <img v-if="size === 'xl'" class="mp-display" src="../../images/icon/search.svg" alt="搜尋">
      <img v-if="size === 'xl'" class="mp-not-display" src="../../images/icon/search-xl.svg" alt="搜尋">
    </div>
  </div>
</template>

<script>
  export default {
    props: ['size'],
    data () {
      return {
        keyword: ""
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
    },
    methods: {
      goSearch(event) {
        if (event.isComposing) { return }  // 還在輸入中文別要資料
        const keyword = this.keyword;
        this.$store.dispatch("filterDataListWithKeyword", keyword);
        this.$router.push(`/search?keyword=${keyword}`);
      }
    }
  }
</script>