class Users < ActiveRecord::Base
  attr_accessible :created_at, :current_sign_in_at, :current_sign_in_ip, :email, :encrypted_password, :is_admin, :last_sign_in_at, :last_sign_in_ip, :remember_created_at, :reset_password_sent_at, :reset_password_token, :sign_in_count, :supplier_id, :updated_at
end
