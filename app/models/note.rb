class Note < ApplicationRecord
  enum category: [:markdown, :chordpro, :task]
end
