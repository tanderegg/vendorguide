class ChangeVendorDescriptionToText < ActiveRecord::Migration
  def self.up
    change_column :vendors, :description, :text
  end

  def self.down
    change_column :vendors, :description, :string
  end
end
