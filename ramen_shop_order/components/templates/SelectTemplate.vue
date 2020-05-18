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
      <!--   右ペイン   -->
      <div class="col-span-3 right-pain grid grid-rows-2 grid-flow-col gap-3">
        <!--    選択した商品    -->
        <div class="">
          <selected-item-list
            :selected-items="selectedItems"
            class="selected-list">
          </selected-item-list>
        </div>
        <div class="grid grid-rows-6 grid-flow-col gap-3">
          <div class="total-amount row-span-3">
            <p>合計金額</p>
          </div>
          <div class="row-span-2">
            <r-button text="注文する" class="button-submit" v-on:click="submit"></r-button>
          </div>
          <div class="row-span-1">
            <r-button text="取り消し" class="button-cancel" v-on:click="cancel"></r-button>
          </div>
        </div>
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
  import RButton from '~/components/atoms/RButton.vue'

  /**
   * 商品選択ページテンプレート
   */
  @Component({
    components: { RButton, SelectedItemList, SelectedItemRow, ItemCard }
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

    submit() {
      console.debug('Submit!!')
    }

    cancel() {
      console.debug('Cancel!!')
      this.$router.push('/')
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
    @apply bg-blue-300;
  }

  .right-pain {
    @apply bg-gray-300 h-full p-3;
  }

  .card {
    @apply bg-yellow-300;
  }

  .selected-list {
    height: 388px; /*固定の高さを指定しないと子要素のmax-heightがちゃんと動かない。*/
  }

  .total-amount {
    @apply bg-red-200;
  }

  .button-submit {
    @apply bg-orange-500 w-full h-full text-xl text-white font-bold rounded-lg;
  }

  .button-cancel {
    @apply bg-blue-500 w-full h-full text-base text-white font-bold rounded-lg;
  }
</style>
