class AddDescriptiveTextToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :descriptive_text, :string
  end
end
