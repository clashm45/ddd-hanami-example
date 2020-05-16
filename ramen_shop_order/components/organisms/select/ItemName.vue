<template>
    <r-text :text="name" class="titleText"></r-text>
</template>

<script lang="ts">
  import { Vue, Component, Prop } from 'vue-property-decorator'
  import RText from '../../atoms/RText.vue'

  /**
   * 商品のタイトル 商品名コンポーネント
   */
  @Component({
    components: {
      RText
    }
  })
  export default class ItemName extends Vue {

    @Prop({ type: String, default: 'default text', required: true })
    readonly name!: string

  }
</script>

<style scoped>
  .titleText {
    @apply font-bold text-xl mb-2
  }
</style>
