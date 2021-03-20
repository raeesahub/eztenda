class AddingforeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_reference :businesses, :users, foreign_key: true
    add_reference :tenders, :businesses,foreign_key: true
    add_reference :tenders, :categories,foreign_key: true
    add_reference :bids, :tenders,foreign_key: true
    add_reference :bids, :products,foreign_key: true
    add_reference :products,:categories,foreign_key: true
    add_reference :products,:users,foreign_key: true


  end
end
