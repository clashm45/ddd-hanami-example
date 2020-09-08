<template>
  <div class="selectedItem grid grid-cols-5">
    <item-name :name="name" class="name col-span-3"/>
    <item-price :price="price" class="price col-span-2"/>
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
    @apply w-full py-2 border;
  }

  .name {
    @apply text-left text-base mx-5;
  }
  .price {
    @apply text-right mx-5;
  }
</style>
