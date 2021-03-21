class AddLegalNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :legal_name, :string
  end
end
