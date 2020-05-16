<template>
  <r-button :text="text" class="button-order"></r-button>
</template>

<script lang="ts">
  import { Vue, Component, Prop } from 'vue-property-decorator'
  import RButton from '../../atoms/RButton.vue'

  /**
   * TOP画面のでかいボタン
   */
  @Component({
    components: {
      RButton
    }
  })
  export default class OrderStartButton extends Vue {

    @Prop({ default: 'default order start button', required: true })
    readonly text!: string

  }
</script>
<style scoped>
  .button-order {
    @apply bg-orange-500 w-full h-48 text-6xl text-white font-bold border border-orange-600 rounded-lg;
  }
  .button-order:hover {
    @apply bg-orange-600;
  }
</style>
