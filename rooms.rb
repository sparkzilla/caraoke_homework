class Room

  attr_accessor(:name, :songs, :guests, :entrance_fee, :capacity)

  def initialize(name, songs, guests, entrance_fee, capacity)
    @name = name
    @songs = songs
    @guests = guests
    @entrance_fee = entrance_fee
    @capacity = capacity
  end

  def song_names_as_object
    @songs
  end

  def song_names_as_array
    @songs.map {|song| song.name}
  end

  def guest_names_as_array
    @guests.map{|guest| guest.name}
  end

  def check_in_guest(new_guest)
       @guests << new_guest
  end

  def add_song_to_room(new_song)
       @songs << new_song
  end

  def guest_has_entrance_fee?(guest)
    if (guest.cash >= @entrance_fee)
      return true
    else
      return false
    end
  end

  def can_room_take_another_guest?
    occupants = @guests.count()
    if (occupants + 1 <= @capacity)
      return true
    else
      return false
    end
  end

  def has_favourite_song(guest)
    song_array = @songs.map {|song| song.name}
    if song_array.include?(guest.favourite_song)
      return "Yeaaah!"
    end
  end
end
