class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
    has_many :comments
    validates :author, presence: true
    belongs_to :category
    def display_author
      author.presence || '佚名'
    end
    def formatted_body
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
      markdown.render(body).html_safe
    end
  end
  