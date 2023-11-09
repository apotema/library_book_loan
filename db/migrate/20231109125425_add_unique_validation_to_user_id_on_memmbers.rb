class AddUniqueValidationToUserIdOnMemmbers < ActiveRecord::Migration[7.0]
  def change
    add_index :members, [:user_id], unique: true, name: 'index_members_on_user_id_unique'
  end
end
