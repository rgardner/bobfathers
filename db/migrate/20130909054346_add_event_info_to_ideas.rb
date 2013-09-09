class AddEventInfoToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :event_info, :string
  end
end
