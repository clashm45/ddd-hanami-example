<template>
  <div class="container">
    <div class="grid grid-cols-6 w-full">
      <div class="col-start-2 col-span-4">
        <order-start-button text="注文する"></order-start-button>
      </div>
    </div>
  </div>
</template>

<script lang="ts">

  import { Vue, Component, Prop } from 'vue-property-decorator'
  import OrderStartButton from '../organisms/top/OrderStartButton.vue'

  /**
   * TOP画面テンプレート
   */
  @Component({
    components: {
      OrderStartButton
    }
  })
  export default class TopTemplate extends Vue {}

</script>

<style scoped>
  .container {
    margin: 0 auto;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
  }

</style>
