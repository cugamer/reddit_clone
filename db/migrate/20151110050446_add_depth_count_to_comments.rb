class AddDepthCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :depth_count, :integer
  end
end
