# COMPONENTS

コンポーネントは **Atomic Design** を参考に作っていきます。

参考:
* [Atomic Design を分かったつもりになる](https://design.dena.com/design/atomic-design-%E3%82%92%E5%88%86%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%A4%E3%82%82%E3%82%8A%E3%81%AB%E3%81%AA%E3%82%8B/)
* [Atomic DesignをVue.jsで実現するための構成と考え方 | Biscuetでの例をもとに](https://tech.smartcamp.co.jp/entry/2019/08/29/115331)

```bash
components
├── Logo.vue
├── README.md
├── atoms
├── molecules
├── organisms
└── templates

pages
```

AtomsとMoleculesには prefix "r-" を付けて、デフォルトのタグを区別出来るようにします。

例: r-button , r-text , r-label


Vue.jsのコンポーネントは class style vue component のスタイルで作っていきます。  
TypeScriptの型チェックが効くようになる。

参考：
* [Vue.jsガイド - クラススタイル Vue コンポーネント](https://jp.vuejs.org/v2/guide/typescript.html)
* [Vue Class Component - Overview](https://class-component.vuejs.org/)
* [Vue Property Decorator](https://github.com/kaorun343/vue-property-decorator)
* [TypeScriptではじめるVueコンポーネント（vue-class-component）](https://qiita.com/hatakoya/items/8d9968d07748d20825f8)
