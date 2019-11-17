require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../songs')
require_relative('../guests')
require_relative('../rooms')


class TestRoom < Minitest::Test

  def setup
    @song1 = Song.new("We Are The Champions")
    @song2 = Song.new("Love Shack")
    @song3 = Song.new("Don't Stop Believin'")
    @song4 = Song.new("Back in Black")
    @song5 = Song.new("Paranoid")
    @song6 = Song.new("Master of Puppets")
    @song7 = Song.new("Back in Black")
    @song8 = Song.new("Crazy Train")
    @song9 = Song.new("Master of Puppets")
    @song10 = Song.new("Get On Up")

    @songs = [@song1, @song2, @song3, @song4, @song5, @song6, @song7, @song8, @song9]

    @new_song = Song.new("I Want It That Way")

    @guest1 = Guest.new("Bob", 100, "I Want It That Way")
    @guest2 = Guest.new("Alice", 50, "Paranoid")
    @guest3 = Guest.new("Dave", 0, "Downtown Train")

    @new_guest = Guest.new("Mary", 60, "Love Shack")

    @guests = [@guest1, @guest2, @guest3]

    @room1 = Room.new("Fun Room", [@song1, @song2, @song3], [@guest1, @guest2], 100, 3)
    @room2 = Room.new("Metal Room", [@song4, @song5, @song6], [@guest3], 20, 1)
    @room3 = Room.new("80s Room", [@song7, @song8, @song9], [], 40, 4)
    @room4 = Room.new("Funk Room", [@song10], [], 80, 8)

    @rooms = [@room1, @room2, @room3, @room4]

  end

  def test_room_has_name
    assert_equal("Metal Room", @room2.name)
  end

  def test_songs_names_in_room
    result = @room4.song_names_as_array
    assert_equal(["Get On Up"], result)
  end

  def test_guest_names_in_room
    result = @rooms[1].guest_names_as_array
    assert_equal(["Dave"], result)
  end

  def test_check_guest_into_room
    @room3.check_in_guest(@new_guest)
    result = @rooms[2].guest_names_as_array
    assert_equal(["Mary"], result)
  end

  def test_add_song_to_room
    @room2.add_song_to_room(@new_song)
    result = @rooms[1].song_names_as_array. count()
    assert_equal(4, result)
  end

  def test_entrance_fee
    result = @room4.entrance_fee
    assert_equal(80, result)
  end

  #test ability to pay

  def test_guest_has_enough_cash_to_enter_room__true
    result = @room1.guest_has_entrance_fee?(@guest1)
    assert_equal(true, result)
  end

  def test_guest_has_enough_cash_to_enter_room__false
    result = @room1.guest_has_entrance_fee?(@guest2)
    assert_equal(false, result)
  end

  #test capacity

  def test_can_room_take_another_guest__true
    result = @room1.can_room_take_another_guest?
    assert_equal(true, result)
  end

  def test_can_room_take_another_guest__false
    result = @room2.can_room_take_another_guest?
    assert_equal(false, result)
  end

  def test_can_room_take_another_guest__false2
    @room1.check_in_guest(@new_guest)
    result = @room1.can_room_take_another_guest?
    assert_equal(false, result)
  end

  #test favourite song

  def test_shout_if_guests_favourite_song_is_in_room
    result = @room2.has_favourite_song(@guest2)
    assert_equal("Yeaaah!", result)
  end

end
