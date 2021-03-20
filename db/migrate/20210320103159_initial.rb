class Initial < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :number_of_venues
      t.string :image_url
      t.timestamps
    end
    create_table :tenders do |t|
      t.string :description
      t.integer :min_bid
      t.date :start_date
      t.date :end_date
      t.integer :volume
      t.boolean :active
      t.timestamps
    end
    create_table :bids do |t|
      t.string :description
      t.integer :amount
      t.string :confirmed,default: "pending"
      t.string :incentives
      t.timestamps
    end
    create_table :categories do |t|
      t.string :description
      t.timestamps
    end
    create_table :products do |t|
      t.string :name
      t.timestamps
    end
  end
end
