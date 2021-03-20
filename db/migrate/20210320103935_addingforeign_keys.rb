class AddingforeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_reference :businesses, :user, foreign_key: true
    add_reference :tenders, :business,foreign_key: true
    add_reference :tenders, :categories,foreign_key: true
    add_reference :bids, :tender,foreign_key: true
    add_reference :bids, :product,foreign_key: true
    add_reference :products,:category,foreign_key: true
    add_reference :products,:user,foreign_key: true
    add_reference :bids, :user,foreign_key: true
  end
end
