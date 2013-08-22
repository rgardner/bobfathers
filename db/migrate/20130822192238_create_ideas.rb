class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text   :description
      t.string :suggested_by
      t.text   :admin_notes
      t.string :status

      t.timestamps
    end
  end
end
