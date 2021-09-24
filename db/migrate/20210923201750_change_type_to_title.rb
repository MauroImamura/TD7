class ChangeTypeToTitle < ActiveRecord::Migration[6.1]
  def change
    rename_column(:property_types, :type, :title)
  end
end
