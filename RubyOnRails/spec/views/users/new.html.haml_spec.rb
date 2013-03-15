require 'spec_helper'

describe "users/new.html.haml" do
  before(:each) do
    assign(:users, stub_model(Users,
      :email => "MyString",
      :encrypted_password => "MyString",
      :reset_password_token => "MyString",
      :sign_in_count => 1,
      :current_sign_in_ip => "MyString",
      :last_sign_in_ip => "MyString",
      :supplier_id => 1,
      :is_admin => false
    ).as_new_record)
  end

  it "renders new users form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#users_email", :name => "users[email]"
      assert_select "input#users_encrypted_password", :name => "users[encrypted_password]"
      assert_select "input#users_reset_password_token", :name => "users[reset_password_token]"
      assert_select "input#users_sign_in_count", :name => "users[sign_in_count]"
      assert_select "input#users_current_sign_in_ip", :name => "users[current_sign_in_ip]"
      assert_select "input#users_last_sign_in_ip", :name => "users[last_sign_in_ip]"
      assert_select "input#users_supplier_id", :name => "users[supplier_id]"
      assert_select "input#users_is_admin", :name => "users[is_admin]"
    end
  end
end
