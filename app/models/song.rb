class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
    notes.each do |note|
      if !note.empty?
        self.notes.build(content: note)
      end
    end
    # self.note = Note.find_or_create_by(content: notes)
  end

  def note_contents
    self.notes.map do |note|
      note ? note.content : nil
    end
  end
end
