class RemoveKarmaPointsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :karma_points
  end

  def down
    add_column :users, :karma_points, :integer
  end
end
