class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :title, null: false
      t.string :status, null: false
      t.string :submitted_to, null: false
      t.references :user, foreign_key: true, index: true, null: false
    end
  end
end
