<template>
  <img :src="src" :alt="alt" :width="width" :height="height"/>
</template>

<script lang="ts">

  import { Vue, Component, Prop } from 'vue-property-decorator'

  /**
   * 基本的な画像タグ <img>
   */
  @Component({})
  export default class RImage extends Vue {

    @Prop({ type: String, required: true })
    readonly src!: string

    @Prop({ type: String, default: 'alt string', required: true })
    readonly alt!: string

    @Prop({ type: Number, default: 300 })
    width?: number

    @Prop({ type: Number, default: 200 })
    height?: number
  }
</script>

<style scoped>

</style>
