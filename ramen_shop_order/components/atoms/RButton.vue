<template>
  <button v-on:click="click">{{text}}</button>
</template>

<script lang="ts">

  import { Vue, Component, Prop } from 'vue-property-decorator'

  /**
   * 基本的なボタン
   */
  @Component({})
  export default class RButton extends Vue {

    @Prop({ default: 'default value', required: true })
    readonly text!: string

    // button onClick イベントを親に伝える。
    click() {
      console.debug('RButton#onClick')
      this.$emit("click")
    }

  }

</script>

<style scoped>

</style>
