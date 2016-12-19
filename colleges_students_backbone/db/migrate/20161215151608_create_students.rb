class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.integer :regid
      t.string :dept
      t.integer :maths
      t.integer :physics
      t.integer :chemistry
      t.integer :year
      t.references :college, foreign_key: true

      t.timestamps
    end
  end
end
