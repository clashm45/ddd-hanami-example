<template>
  <r-text :text="price | numberToString" class="price"></r-text>
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
      numberToString(value: number) {
        return value.toString()
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
    @apply text-red-500;
  }
</style>
