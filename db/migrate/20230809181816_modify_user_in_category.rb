class ModifyUserInCategory < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :user_id
    add_reference :categories, :user
  end
end
