class AddTimestampsToExistingTables < ActiveRecord::Migration[5.0]
  def change
    add_column(:poems, :created_at, :datetime)
    add_column(:poems, :updated_at, :datetime)

    add_column(:submissions, :created_at, :datetime)
    add_column(:submissions, :updated_at, :datetime)

    add_column(:submission_packets, :created_at, :datetime)
    add_column(:submission_packets, :updated_at, :datetime)
  end
end
