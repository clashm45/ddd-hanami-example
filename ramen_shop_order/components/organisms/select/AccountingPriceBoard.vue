<template>
  <div>
    <r-text text="合計金額"></r-text>
    <item-price :price="accountPrice()"></item-price>
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

  }
</script>

<style scoped>

</style>
