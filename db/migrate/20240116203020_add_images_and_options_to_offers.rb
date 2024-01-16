class AddImagesAndOptionsToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :images, :text
    add_column :offers, :options, :text
  end
end
