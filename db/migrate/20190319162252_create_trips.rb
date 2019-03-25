class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :user_id
      # t.string :flightinfo
      # t.string :arv
      # t.string :dpt
      # t.string :fltPrc
      t.string :name
      t.timestamps
    end
  end
end


# :hotelinfo, :flightinfo, :arv, :dpt, :fltPrc
