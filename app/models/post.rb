class Post < ApplicationRecord

    validates :author, presence: true
    belongs_to :category
    def display_author
      author.presence || '佚名'
    end
  end
  