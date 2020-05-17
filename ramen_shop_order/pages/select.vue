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
        name: '醤油ラーメン',
        price: 700,
        image: {
          src: 'https://4.bp.blogspot.com/-0mGwb_xY7KQ/UgSMHVBsBMI/AAAAAAAAW8c/5PQpBk5sYVo/s800/food_ramen.png',
          alt: 'ラーメンの画像'
        }
      },
      {
        id: 2,
        name: '担々麺',
        price: 890,
        image: {
          src: 'https://4.bp.blogspot.com/--BQZyGXFKQc/UrlnICrXLOI/AAAAAAAAcOM/t0pra4mio_M/s400/ramen_tantanmen.png',
          alt: 'ラーメンの画像'
        }
      },
      {
        id: 3,
        name: '家系ラーメン',
        price: 1040,
        image: {
          src: 'https://4.bp.blogspot.com/-FoDpk3Zkii8/V2ubwfhOeSI/AAAAAAAA7rw/42VcWGp2-x86E1sqqZfvh1Pomc1IO_pgACLcB/s400/food_ramen_iekei.png',
          alt: 'ラーメンの画像'
        }
      },
      {
        id: 4,
        name: 'チャーシュー麺',
        price: 940,
        image: {
          src: 'https://2.bp.blogspot.com/-LpPmjYdxOiQ/UrlnGX4gPVI/AAAAAAAAcNo/05KSUTjhAVY/s400/ramen_chashu.png',
          alt: 'ラーメンの画像'
        }
      },
      {
        id: 5,
        name: 'とんこつラーメン',
        price: 850,
        image: {
          src: 'https://4.bp.blogspot.com/-03kgxSH1XOs/UrlnIiMrcGI/AAAAAAAAcOc/gtxPOYEzMAE/s400/ramen_tonkotsu.png',
          alt: 'ラーメンの画像'
        }
      },
      {
        id: 6,
        name: '味噌ラーメン',
        price: 850,
        image: {
          src: 'https://2.bp.blogspot.com/-STTQzS_tfAQ/UrlnGw73FvI/AAAAAAAAcN0/VvKlWv0oVkU/s400/ramen_miso.png',
          alt: 'ラーメンの画像'
        }
      }
    ]
  }
</script>

<style scoped>

</style>
