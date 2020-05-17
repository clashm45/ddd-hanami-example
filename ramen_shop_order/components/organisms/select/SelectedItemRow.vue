<template>
  <div class="selectedItem">
    <item-name :name="name" class="name"/>
    <item-price :price="price" class="price"/>
  </div>
</template>

<script lang="ts">
  import { PropType } from 'vue'
  import { Vue, Component, Prop } from 'vue-property-decorator'
  import ItemName from '~/components/organisms/select/ItemName.vue'
  import ItemPrice from '~/components/organisms/select/ItemPrice.vue'
  import Money = RSO.Money

  /**
   * 商品カード
   */
  @Component({
    components: { ItemPrice, ItemName }
  })
  export default class SelectedItemRow extends Vue {

    @Prop({ type: String, required: true })
    readonly name!: string

    @Prop({ type: Number as PropType<Money>, required: true })
    readonly price!: Money

  }
</script>

<style scoped>
  .selectedItem {
    @apply w-full rounded-t-lg;
  }

  .name {

  }
  .price {
    @apply text-right;
  }
</style>
