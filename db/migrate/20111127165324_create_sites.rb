class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.text :description
      t.integer :type_id
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :zoom
      t.string :image_url

      t.timestamps
    end
  end
end
