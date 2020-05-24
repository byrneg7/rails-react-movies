class AddMembersToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :members, :string, array: true, default: []
  end
end
