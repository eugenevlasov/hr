class CreateCandidateStatuses < ActiveRecord::Migration
  def change
    create_table :candidate_statuses do |t|
      t.string :name, null: false, limit: 256
      t.timestamps null: false
    end
  end
end
