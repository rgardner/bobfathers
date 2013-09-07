class AddVerificationToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :verified, :boolean, default: false
    add_index  :ideas, :verified
  end
end
