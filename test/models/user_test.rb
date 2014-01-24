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
		user.profile_name = users(:piotr).profile_name
	

		users(:piotr)
		assert !user.save
		#puts.user.error.inspect
		assert !user.errors[:profile_name].empty?
    end


  test "a user should have a profile name without spaces" do
    user = User.new(first_name: 'Jason', last_name: 'Seifer', email: 'jason2@teamtreehouse.com')
    user.profile_name = 'Mike'
    user.password = user.password_confirmation = 'asdfasdf'

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  # test "the truth" do
  #   assert true
  # end
end
