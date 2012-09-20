class CreateIpAddresses < ActiveRecord::Migration
  def up
     create_table :ip_addresses do |t|
	t.string :ip
     end
  end

  def down
     drop_table :ip_addresses
  end
end
