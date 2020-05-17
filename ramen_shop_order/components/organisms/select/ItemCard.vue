<template>
  <div class="card" v-on:click="click">
    <div class="image" v-bind:style="{ 'background-color': imageBg }">
      <r-image :src="imageSrc" :alt="imageAlt" style="max-width: 300px; max-height: 290px;"/>
    </div>
    <div class="px-6 py-4">
      <item-name :name="name"/>
      <item-price :price="price" class="price"/>
    </div>
  </div>
</template>

<script lang="ts">
  import { PropType } from 'vue'
  import { Vue, Component, Prop } from 'vue-property-decorator'
  import RImage from '~/components/atoms/RImage.vue'
  import ItemName from '~/components/organisms/select/ItemName.vue'
  import ItemPrice from '~/components/organisms/select/ItemPrice.vue'
  import Money = RSO.Money

  /**
   * 商品カード
   */
  @Component({
    components: { ItemPrice, ItemName, RImage }
  })
  export default class ItemCard extends Vue {

    @Prop({ type: String, required: true })
    readonly imageSrc!: string

    @Prop({ type: String, required: true })
    readonly imageAlt!: string

    // 画像のbackgroundを指定する。(Optional)
    @Prop({ type: String })
    readonly imageBg?: string

    // 商品名
    @Prop({ type: String, required: true })
    readonly name!: string

    // 商品の値段
    @Prop({ type: Number as PropType<Money>, required: true })
    readonly price!: Money

    // onClick イベントを親に伝える。
    click() {
      console.debug('ItemCard#onClick')
      this.$emit('click')
    }

  }
</script>

<style scoped>
  .card {
    @apply w-full rounded-lg shadow-lg;
  }

  .card .image {
    @apply w-full bg-gray-100 rounded-t-lg flex justify-center;
  }

  .card .price {
    @apply text-right;
  }
</style>
