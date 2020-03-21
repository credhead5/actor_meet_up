class RemoveLocationFromMeetingsAndAddAddressToMeetings < ActiveRecord::Migration[6.0]
  def change
    remove_column :meetings, :location, :string
    add_column :meetings, :address, :string
  end
end
