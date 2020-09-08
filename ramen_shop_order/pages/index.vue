<template>
  <top-template/>
</template>

<script lang="ts">
  import { Vue, Component, Prop } from 'vue-property-decorator'
  import TopTemplate from '~/components/templates/TopTemplate.vue'

  /**
   * TOPページ
   */
  @Component({
    components: {
      TopTemplate
    }
  })
  export default class Top extends Vue {}

</script>

<style>

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

</style>
