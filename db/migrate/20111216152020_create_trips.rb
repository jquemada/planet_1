class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      
      t.integer :trip_id
	t.integer :site_id

      t.timestamps
    end

  end
end
