class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    # byebug
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    # byebug
    self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
    notes.each do |note|
      if note != ""
        new_note = Note.create(content: note)
        self.notes << new_note
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def genre_name=(genre)
    # byebug
    self.genre_id = Genre.find_by(name: genre).id
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

end
