# ddd-hanami-example

このプロジェクトは [Hanami](https://hanamirb.org/) を使った ドメイン駆動設計(Domain-driven Design) を実践するアプリケーションを作っています。

題材は、ラーメン屋の食券販売機Webサービスです！ :ramen:


## Demo

!画像を貼る!

!デモサイトを構築してURLを貼る!


## 技術要素

### Server-side

Hanami : https://hanamirb.org/

Rubyでドメイン駆動設計を実践するにはRailsでは難しい場面が多いです。
Hanamiはドメインを切って開発するのに向いているRubyのWebフレームワークです。

まだ実装途中ですが、同じリポジトリ内でAPIサービスと管理画面Webサービスを同居させようとしています。

APIサービスは後述するフロントエンドから呼び出される購買系のサービス。
管理画面Webサービスはラーメン屋のオーナーや管理者が、新しい商品を追加したり金額を変更するなどの管理系サービスを想定しています。

購買系サービスはUIをリッチに実装するために、Vue.jsを使ったフロントエンドを使います。
管理系サービスは設定画面などがほとんどなので、ERBなどを使った簡易な画面を想定しています。

Hanamiではドメイン機能をlibに置き、各種サービスを複数同じリポジトリに配置する事ができます。


### Front-end

ラーメン屋の食券販売機をイメージしたWeb UIフロントエンドを実装します。

Nuxt.js , Vue.js を使っています。

コンポーネントの設計思想としてAtomic Designを取り入れていて、細かくコンポーネントを分けています。
わかりやすいようにディレクトリ構成は独自の見解をいれずに、Atomic Designの名称と同じディレクトリを作って格納しています。

```
❯ tree components
components
├── Logo.vue
├── README.md
├── atoms
│   ├── RButton.vue
│   ├── RImage.vue
│   └── RText.vue
├── organisms
│   ├── select
│   │   ├── AccountingPriceBoard.vue
│   │   ├── ItemCard.vue
│   │   ├── ItemName.vue
│   │   ├── ItemPrice.vue
│   │   ├── SelectedItemList.vue
│   │   └── SelectedItemRow.vue
│   └── top
│       └── OrderStartButton.vue
└── templates
    ├── SelectTemplate.vue
    └── TopTemplate.vue
```

CSSには、tailwindを利用しています。


