<template>
  <div class="component">
    <div class="header">
      <p>選択商品</p>
    </div>
    <div v-for="selectedItem in selectedItems" :key="selectedItem.id" class="list">
      <selected-item-row
        :name="selectedItem.item.name"
        :price="selectedItem.item.price"
        class="row">
      </selected-item-row>
    </div>
  </div>
</template>

<script lang="ts">
  import { PropType } from 'vue'
  import { Vue, Component, Prop } from 'vue-property-decorator'
  import SelectedItems = RSO.SelectedItems
  import SelectedItemRow from '~/components/organisms/select/SelectedItemRow.vue'

  /**
   * 商品選択画面 右ペイン 選択した商品リスト コンポーネント
   */
  @Component({
    components: { SelectedItemRow }
  })
  export default class SelectedItemList extends Vue {

    @Prop({ type: Array as PropType<SelectedItems>, default: [], required: true })
    readonly selectedItems!: SelectedItems

    // button onClick イベントを親に伝える。
    click() {
      console.debug('RButton#onClick')
      this.$emit('click')
    }

  }
</script>

<style scoped>
  .component {
    @apply rounded-lg;
  }

  .header {
    @apply bg-blue-500 rounded-t-lg;
  }

  .list {
    @apply bg-gray-200;
  }

  .row {
  }
</style>
