class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name, limit: 256
      t.integer :status, default: 1
      t.decimal :fee
      t.json :contacts
      t.timestamps null: false
    end
  end
end
