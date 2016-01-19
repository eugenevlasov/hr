class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name, null: false, length: 256
      t.text :description
      t.timestamp :added_at, null: false
      t.integer :added_by
      t.timestamp :expire_at
      t.decimal :fee
      t.text :contact_info
      t.timestamps null: false
    end
  end
end
