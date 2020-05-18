<template>
  <div class="component grid grid-rows-3 grid-flow-col gap-2">
    <div class="account-price-area grid grid-cols-2 grid-flow-col gap-2">
      <r-text text="合計金額" class="title"></r-text>
      <item-price :price="accountPrice()" class="price"></item-price>
    </div>
    <div class="entry-price-area grid grid-cols-2 grid-flow-col gap-2">
      <r-text text="投入金額" class="title"></r-text>
      <item-price :price="entryPrice()" class="price"></item-price>
    </div>
    <div class="change-price-area grid grid-cols-2 grid-flow-col gap-2">
      <r-text text="おつり" class="title"></r-text>
      <item-price :price="changePrice()" class="price"></item-price>
    </div>
  </div>
</template>

<script lang="ts">
  import { PropType } from 'vue'
  import { Vue, Component, Prop } from 'vue-property-decorator'
  import SelectedItems = RSO.SelectedItems
  import SelectedItem = RSO.SelectedItem
  import RText from '~/components/atoms/RText.vue'
  import ItemPrice from '~/components/organisms/select/ItemPrice.vue'
  import Money = RSO.Money

  /**
   * 基本的なボタン <button>
   */
  @Component({
    components: { ItemPrice, RText }
  })
  export default class AccountingPriceBoard extends Vue {

    @Prop({ type: Array as PropType<SelectedItems>, required: true })
    readonly selectedItems!: SelectedItems

    accountPrice() {
      if (this.selectedItems.length === 0) {
        const initial_val: Money = 0
        return initial_val
      }
      return this.selectedItems.reduce(((acc: Money, cur: SelectedItem) => acc + cur.item.price), 0)
    }

    entryPrice() {
      return 0;
    }

    changePrice() {
      return 0;
    }

  }
</script>

<style scoped>
  .component {
    @apply h-full bg-white;
  }

  .account-price-area {
    @apply h-full bg-white items-center;
  }

  .entry-price-area {
    @apply h-full bg-white items-center;
  }

  .change-price-area {
    @apply h-full bg-white items-center;
  }

  .title {
    @apply text-left ml-5;
  }

  .price {
    @apply text-right mr-5 text-xl;
  }

</style>
