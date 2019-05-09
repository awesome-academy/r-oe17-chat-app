class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :notifiable_type
      t.string :action
      t.references :user, null: false, foreign_key: true
      t.integer :reciever_id

      t.timestamps
    end
  end
end
