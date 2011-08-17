class AddAdminPerson < ActiveRecord::Migration
  def self.up
    execute("insert into users(email,encrypted_password,name) values('senthil.company@gmail.com','$2a$10$hqO6oRsGZ2o4ulzITSsIMuiZTEqJqMhWAofH4EZNQVzRVmkfOQLd.','senthil');")
    execute("insert into roles(name,user_id) values('admin',1);")
  end
  def self.down
  end
end
