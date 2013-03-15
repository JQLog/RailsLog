require 'spec_helper'

describe "users/show.html.haml" do
  before(:each) do
    @users = assign(:users, stub_model(Users,
      :email => "Email",
      :encrypted_password => "Encrypted Password",
      :reset_password_token => "Reset Password Token",
      :sign_in_count => 1,
      :current_sign_in_ip => "Current Sign In Ip",
      :last_sign_in_ip => "Last Sign In Ip",
      :supplier_id => 1,
      :is_admin => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Encrypted Password/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Reset Password Token/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Current Sign In Ip/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Last Sign In Ip/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
