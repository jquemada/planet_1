class CreateViajes < ActiveRecord::Migration
  def change
    create_table :viajes do |t|
      t.integer :site_id
      t.integer :orden

      t.timestamps
    end
  end
end
