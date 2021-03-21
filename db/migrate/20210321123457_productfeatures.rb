class Productfeatures < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :title, :string
    add_column :products, :description, :string

  end
end
