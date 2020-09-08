<template>
  <div class="component">
    <div class="header">
      <r-text text="選択商品" class="header-text"></r-text>
    </div>
    <div class="list">
      <selected-item-row
        v-for="selectedItem in selectedItems" :key="selectedItem.id"
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
  import RText from '~/components/atoms/RText.vue'

  /**
   * 商品選択画面 右ペイン 選択した商品リスト コンポーネント
   */
  @Component({
    components: { RText, SelectedItemRow }
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
    @apply rounded-t-lg bg-gray-400 h-full;
  }

  .header {
    height: 50px;
    background-color: #2a1a5e;
    @apply rounded-t-lg py-3;
  }

  .header-text {
    @apply font-bold text-white text-lg;
  }

  .list {
    max-height: calc(100% - 50px);
    @apply bg-gray-200 overflow-auto;
  }

  .row {
    @apply overflow-hidden;
  }

  /*スクロールバー全体*/
  ::-webkit-scrollbar {
    width: 10px;
  }

  /*スクロールバーの軌道*/
  ::-webkit-scrollbar-track {
    border-radius: 10px;
    box-shadow: inset 0 0 6px rgba(0, 0, 0, .1);
  }

  /*スクロールバーの動く部分*/
  ::-webkit-scrollbar-thumb {
    background-color: rgba(0, 0, 50, .5);
    border-radius: 10px;
    box-shadow:0 0 0 1px rgba(255, 255, 255, .3);
  }
</style>
