class CreatePoems < ActiveRecord::Migration[5.0]
  def change
    create_table :poems do |t|
      t.string :title, null: false
      t.string :status, default: "Pending", null: false
      t.references :user, index: true, foreign_key: true, null: false
    end
  end
end
