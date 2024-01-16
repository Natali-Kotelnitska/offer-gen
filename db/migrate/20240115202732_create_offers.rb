class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :link
      t.string :translation
      t.decimal :price
      t.string :title
      t.text :description
      t.integer :rating
      t.text :reviews
      t.string :category

      t.timestamps
    end
  end
end
