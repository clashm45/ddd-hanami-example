<template>
  <button>{{text}}</button>
</template>

<script lang="ts">

  import { Vue, Component, Prop } from 'vue-property-decorator'

  @Component({})
  export default class RButton extends Vue {

    @Prop({ default: 'default value', required: true })
    readonly text!: string

  }

</script>

<style scoped>

</style>
