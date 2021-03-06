require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = user(:jason).profile_name
    puts user.errors.inspect

    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
   
    user.profile_name = "my profile name with spaces"
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly") 

  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: 'Eric', last_name: 'Duvon', email: "eric.duvon@gmail.com")
    user.password = user.password_confirmation = "adfsffsf"
  user.profile_name = 'eduvon0220'
  assert user.valid?
  end

end
