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
              :image-bg="card_background_color()"
              v-on:click="click(item.id)"
              class="card"
            />
          </div>
        </div>
      </div>
      <div class="col-span-3 right-pain">
        <p>右ペイン</p>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
  import { PropType } from 'vue'
  import { Vue, Component, Prop } from 'vue-property-decorator'
  import ItemCard from '~/components/organisms/select/ItemCard.vue'
  import Items = RSO.Items
  import ID = RSO.ID

  /**
   * 商品選択ページテンプレート
   */
  @Component({
    components: { ItemCard }
  })
  export default class SelectTemplate extends Vue {

    @Prop({ type: Array as PropType<Items>, required: true })
    readonly items!: Items

    // 商品を選択
    click(id: ID) {
      console.debug(`SelectTemplate#onClick - ${id}`)
    }

    // カードのスタイルを判断するためのカウンター(local state)
    cardCount = 0
    // カードの背景色を決める
    card_background_color() {
      this.cardCount++
      switch (this.cardCount) {
        case 1:
          return '#2a1a5e' // "img-bg-blue";
        case 2:
          return '#f45905' // "img-bg-orange-dark";
        case 3:
          this.cardCount = 0 // reset
          return '#fb9224' // "img-bg-orange-light";
      }
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
</style>
