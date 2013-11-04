class AddKarmaPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :point_total, :integer
  end
end
