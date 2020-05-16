<template>
  <div class="max-w-sm rounded overflow-hidden shadow-lg">
    <r-image :src="imageSrc" :alt="imageAlt" class="w-full"/>
    <div class="px-6 py-4">
      <ItemName :name="name"/>
      <item-price :price="price"/>
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

    @Prop({ type: String, required: true })
    readonly name!: string

    @Prop({ type: Number as PropType<Money>, required: true })
    readonly price!: Money

    // button onClick イベントを親に伝える。
    click() {
      console.debug('RButton#onClick')
      this.$emit('click')
    }

  }
</script>

<style scoped>

</style>
