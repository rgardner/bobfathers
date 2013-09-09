class AddEventUrlToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :event_url, :string
  end
end
