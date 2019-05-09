class AddPrivateFlagToGroupTable < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :private, :boolean, default: false
  end
end
