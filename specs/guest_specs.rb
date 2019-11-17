require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../songs')
require_relative('../rooms')
require_relative('../guests')

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new("Bob", 100, "I Want It That Way")
    @guest2 = Guest.new("Alice", 50, "Paranoid")
    @guest3 = Guest.new("Dave", 0, "Downtown Train")
  end


  def test_guest_name
    assert_equal("Alice", @guest2.name)
  end

  def test_guest_cash
    assert_equal(100, @guest1.cash)
  end

  def test_guest_favourite_song
    assert_equal("Paranoid", @guest2.favourite_song)
  end

end
