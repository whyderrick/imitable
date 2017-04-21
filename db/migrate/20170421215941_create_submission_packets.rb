class CreateSubmissionPackets < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_packets do |t|
      t.references :poem, foreign_key: true, index: true, null: false
      t.references :submission, foreign_key: true, index: true, null: false
      t.string :status
    end
  end
end
