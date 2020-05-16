<template>
  <div class="container">
    <div class="grid grid-cols-6 w-full">
      <div v-for="item in items" :key="item.id" class="col-span-3">
        <item-card
          :name="item.name"
          :price="item.price"
          :image-src="item.image.src"
          :image-alt="item.image.alt"
          v-on:click="click(item.id)"
        />
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

  }
</script>

<style scoped>
</style>
