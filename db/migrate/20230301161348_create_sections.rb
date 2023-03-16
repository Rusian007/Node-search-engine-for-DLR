class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.text :section_text
      t.references :rule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
