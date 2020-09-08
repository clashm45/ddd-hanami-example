<template>
  <r-text :text="price | priceFormat" class="price"></r-text>
</template>

<script lang="ts">
  import { PropType } from 'vue'
  import { Vue, Component, Prop } from 'vue-property-decorator'
  import RText from '../../atoms/RText.vue'
  import Money = RSO.Money

  /**
   * 商品の値段コンポーネント
   */
  @Component({
    components: { RText },
    filters: {
      // 値段フォーマット フィルター
      priceFormat(value: number) {
        // https://blog.leko.jp/post/what-benefit-of-intl-number-format/
        const commaFormatter = new Intl.NumberFormat('en', {
          style: 'currency',
          currency: 'JPY',
          currencyDisplay: 'symbol'
        })
        return commaFormatter.format(value)
      }
    }
  })
  export default class ItemPrice extends Vue {

    @Prop({ type: Number as PropType<Money>, default: 12345, required: true })
    readonly price!: Money

  }
</script>

<style scoped>
  .price {
    @apply text-red-600;
  }
</style>
