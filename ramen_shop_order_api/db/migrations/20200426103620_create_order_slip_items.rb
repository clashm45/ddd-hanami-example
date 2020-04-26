Hanami::Model.migration do
  change do
    create_table :order_slip_items do
      primary_key :id

      foreign_key :order_slip_id, :order_slips, on_delete: :cascade, null: false
      foreign_key :item_id, :items, on_delete: :cascade, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
