class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :point_total, order: :desc
  end
end
