declare namespace RSO {

  // ユニークID型
  type ID = number

  // お金
  type Money = number

  // 商品
  class Item {
    id: ID
    name: string
    price: Money
    image: Image
  }

  // Array<商品>
  type Items = Item[]

  // 画像
  class Image {
    src: string
    alt: string
  }

  // 選択した商品
  class SelectedItem {
    id: ID
    item: Item
  }

  type SelectedItems = SelectedItem[]
}
