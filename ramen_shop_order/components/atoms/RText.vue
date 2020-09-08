<template>
  <p>{{text}}</p>
</template>

<script lang="ts">
  import { Vue, Component, Prop } from 'vue-property-decorator'

  /**
   * 基本的なテキスト <p>
   */
  @Component({})
  export default class RText extends Vue {

    @Prop({
      type: String,
      default: 'default text',
      required: true
    })
    readonly text!: string

  }
</script>

<style scoped>

</style>
