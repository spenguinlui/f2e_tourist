<template>
  <div>
    {{ text }}
    <router-link :to="{ name: 'login' }">會員登入</router-link>
    <router-link :to="{ name: 'suppliers' }">商家專區</router-link>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        text: "這裡是 footer"
      }
    }
  }
</script>