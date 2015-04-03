class ChangeDatatyoeIdOfUsers < ActiveRecord::Migration
  def change
    change_column(:users, :id, :integer, :limit => 100)
  end
end
