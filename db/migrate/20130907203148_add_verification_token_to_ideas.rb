class AddVerificationTokenToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :verification_token, :string
    add_index  :ideas, :verification_token
  end
end
