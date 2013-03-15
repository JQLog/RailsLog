require 'spec_helper'

describe "users/index.html.haml" do
  before(:each) do
    assign(:users, [
      stub_model(Users,
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :reset_password_token => "Reset Password Token",
        :sign_in_count => 1,
        :current_sign_in_ip => "Current Sign In Ip",
        :last_sign_in_ip => "Last Sign In Ip",
        :supplier_id => 1,
        :is_admin => false
      ),
      stub_model(Users,
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :reset_password_token => "Reset Password Token",
        :sign_in_count => 1,
        :current_sign_in_ip => "Current Sign In Ip",
        :last_sign_in_ip => "Last Sign In Ip",
        :supplier_id => 1,
        :is_admin => false
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Encrypted Password".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Reset Password Token".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Current Sign In Ip".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Sign In Ip".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
