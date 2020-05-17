<template>
  <div class="container">
    <!--  画面全体  -->
    <div class="grid grid-cols-12 w-full">
      <!--   左ペイン   -->
      <div class="col-span-9 left-pain">
        <!--  商品一覧  -->
        <div class="grid grid-cols-6 gap-3 w-full p-3">
          <div v-for="item in items" :key="item.id" class="col-span-2">
            <item-card
              :name="item.name"
              :price="item.price"
              :image-src="item.image.src"
              :image-alt="item.image.alt"
              image-bg="#fb9224"
              v-on:click="click(item)"
              class="card"
            />
          </div>
        </div>
      </div>
      <div class="col-span-3 right-pain">
        <selected-item-list
          :selected-items="selectedItems"
          class="selected-list">
        </selected-item-list>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
  import { PropType } from 'vue'
  import { Vue, Component, Prop } from 'vue-property-decorator'
  import ItemCard from '~/components/organisms/select/ItemCard.vue'
  import SelectedItemList from '~/components/organisms/select/SelectedItemList.vue'
  import SelectedItemRow from '~/components/organisms/select/SelectedItemRow.vue'
  import Item = RSO.Item
  import Items = RSO.Items
  import SelectedItems = RSO.SelectedItems

  /**
   * 商品選択ページテンプレート
   */
  @Component({
    components: { SelectedItemList, SelectedItemRow, ItemCard }
  })
  export default class SelectTemplate extends Vue {

    // 商品リスト
    @Prop({ type: Array as PropType<Items>, required: true })
    readonly items!: Items

    // 選択した商品リスト
    selectedItems: SelectedItems = []

    // 商品を選択
    click(item: Item) {
      console.debug(`SelectTemplate#onClick - ${item.id}`)
      console.info('商品を追加', item.name)
      console.debug(this.selectedItems)
      this.selectedItems.push({
        id: Math.random(),
        item: item
      })
    }
  }
</script>

<style scoped>
  .container {
    margin: 0 auto;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
  }

  .left-pain {
    @apply bg-blue-300
  }

  .right-pain {
    @apply bg-gray-300
  }

  .card {
    @apply bg-yellow-300;
  }

  .selected-list {
    @apply m-3 max-h-full overflow-auto;
  }
</style>
