class AddImageToBike < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :img_url, :string
  end
end
