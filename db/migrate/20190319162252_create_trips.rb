class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.string :leavingat
      t.string :arrivingat
      t.string :arvdisplay
      t.string :dptdisplay
      t.string :fltPrc
      t.string :hotelname
      t.string :hotelprice
      t.string :hotelphone
      t.string :hoteladdress
      t.timestamps
    end
  end
end


# :hotelinfo, :flightinfo, :arv, :dpt, :fltPrc
