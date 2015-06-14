class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :text

  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

  def html_text
    @@markdown.render self.text
  end
end
