class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :text

  # Create a new markdown parser. Only needs to be done once for the whole class
  # @@ denotes a **class variable**, more info here: 
  # https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/45-more-classes/lessons/113-class-variables
  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

  # Method that parses the text body (written in Markdown) into html
  def html_text
    @@markdown.render self.text
  end
end
