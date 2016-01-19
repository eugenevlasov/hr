class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name, length: 256
      t.integer :status_id
      t.decimal :fee
      t.json :contacts
      t.timestamps null: false
    end
  end
end
