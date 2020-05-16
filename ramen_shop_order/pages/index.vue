<template>
  <div class="container">
    <div class="grid grid-cols-6 w-full">
      <div class="col-start-2 col-span-4">
        <button class="button-order">
          注文する
        </button>
        <r-button text="テスト" class="button-order"></r-button>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
  import Vue from 'vue'
  import Logo from '~/components/Logo.vue'
  import RButton from '~/components/atoms/RButton.vue'

  export default Vue.extend({
    components: {
      Logo,
      RButton
    }
  })
</script>

<style>
  .container {
    margin: 0 auto;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
  }

  .button-order {
    @apply bg-orange-500 w-full h-48 text-6xl text-white font-bold border border-orange-600 rounded-lg;
  }
  .button-order:hover {
    @apply bg-orange-600;
  }
  .button--green {
    display: inline-block;
    border-radius: 4px;
    border: 1px solid #3b8070;
    color: #3b8070;
    text-decoration: none;
    padding: 10px 30px;
  }

  .button--green:hover {
    color: #fff;
    background-color: #3b8070;
  }


  .links {
    padding-top: 15px;
  }
</style>
