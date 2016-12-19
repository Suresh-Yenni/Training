class AddExtendedSidToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :extended_sid, :string
  end
end
