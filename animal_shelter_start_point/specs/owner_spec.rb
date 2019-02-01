require('minitest/autorun')
require_relative('../models/owner')

class TestOwner < MiniTest::Test

  def setup
    @owner1 = Owner.new("Ryan", "Taubert", "Titus")
  end

  def test_does_owner_have_first_name
    
  end

end
