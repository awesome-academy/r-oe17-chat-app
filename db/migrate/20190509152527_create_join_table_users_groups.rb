class CreateJoinTableUsersGroups < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :groups do |t|
      t.index :user_id
      t.index :group_id

      t.boolean :is_admin
      t.boolean :is_active
    end
  end
end
