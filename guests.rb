class Guest

  attr_reader(:name, :cash, :favourite_song)

  def initialize(name, cash, favourite_song)
    @name = name
    @cash = cash
    @favourite_song = favourite_song
  end


end
