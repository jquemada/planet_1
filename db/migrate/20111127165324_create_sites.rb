class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.text :description
      t.integer :type_id
      t.decimal :latitude,  :precision => 8, :scale => 6
      t.decimal :longitude, :precision => 8, :scale => 6
      t.decimal :zoom,      :precision => 8, :scale => 6
      t.string :image_url

      t.timestamps
    end
  end
end
