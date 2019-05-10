class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :parent_id
      t.integer :reciever_id
      t.references :user, null: false, foreign_key: true
      t.references :messages, null: true, foreign_key: true, column: :parent_id
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
