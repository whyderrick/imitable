class CreatePoems < ActiveRecord::Migration[5.0]
  def up
    create_table :poems do |t|
      t.string :title, null: false
      t.string :status, default: "Pending", null: false
      t.references :user, index: true, foreign_key: true, null: false
    end
  end

  def down
    drop_table :poems
  end
end
