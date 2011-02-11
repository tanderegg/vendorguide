class AddDetailsToVendors < ActiveRecord::Migration
  def self.up
    add_column :vendors, :address, :string
    add_column :vendors, :city, :string
    add_column :vendors, :state, :string
    add_column :vendors, :zip, :string
    add_column :vendors, :phone, :string
    add_column :vendors, :fax, :string
    add_column :vendors, :email, :string
    add_column :vendors, :website, :string
    add_column :vendors, :default_login_url, :string
    add_column :vendors, :services_description, :text
    add_column :vendors, :clients_description, :text
    add_column :vendors, :pricing_description, :text
    add_column :vendors, :references, :text
    add_column :vendors, :press, :text
  end

  def self.down
    remove_column :vendors, :press
    remove_column :vendors, :references
    remove_column :vendors, :pricing_description
    remove_column :vendors, :clients_description
    remove_column :vendors, :services_description
    remove_column :vendors, :default_login_url
    remove_column :vendors, :website
    remove_column :vendors, :email
    remove_column :vendors, :fax
    remove_column :vendors, :phone
    remove_column :vendors, :zip
    remove_column :vendors, :state
    remove_column :vendors, :city
    remove_column :vendors, :address
  end
end
