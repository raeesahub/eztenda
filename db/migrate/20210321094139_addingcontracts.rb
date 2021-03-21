class Addingcontracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.timestamps
    end
    add_reference :tenders, :contract, foreign_key: true
    add_reference :bids, :contract, foreign_key: true
  end
end
