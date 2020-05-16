<template>
  <select-template :items="items"/>
</template>

<script lang="ts">

  import { Vue, Component, Prop } from 'vue-property-decorator'
  import RImage from '~/components/atoms/RImage.vue'
  import SelectTemplate from '~/components/templates/SelectTemplate.vue'

  /**
   * 商品選択ページ
   */
  @Component({
    components: {
      SelectTemplate,
      RImage
    }
  })
  export default class Select extends Vue {

    items = [
      {
        id: 1,
        name: 'ラーメン',
        price: 100,
        image: {
          src: 'https://4.bp.blogspot.com/-0mGwb_xY7KQ/UgSMHVBsBMI/AAAAAAAAW8c/5PQpBk5sYVo/s800/food_ramen.png',
          alt: 'ラーメンの画像'
        }
      },
      {
        id: 2,
        name: 'ラーメン',
        price: 100,
        image: {
          src: 'https://4.bp.blogspot.com/-0mGwb_xY7KQ/UgSMHVBsBMI/AAAAAAAAW8c/5PQpBk5sYVo/s800/food_ramen.png',
          alt: 'ラーメンの画像'
        }
      },
      {
        id: 3,
        name: 'ラーメン',
        price: 100,
        image: {
          src: 'https://4.bp.blogspot.com/-0mGwb_xY7KQ/UgSMHVBsBMI/AAAAAAAAW8c/5PQpBk5sYVo/s800/food_ramen.png',
          alt: 'ラーメンの画像'
        }
      },
      {
        id: 4,
        name: 'ラーメン',
        price: 100,
        image: {
          src: 'https://4.bp.blogspot.com/-0mGwb_xY7KQ/UgSMHVBsBMI/AAAAAAAAW8c/5PQpBk5sYVo/s800/food_ramen.png',
          alt: 'ラーメンの画像'
        }
      }
    ]
  }
</script>

<style scoped>

</style>
