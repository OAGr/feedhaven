class FeedSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :updated, :source, :rights, :tags, :categories, :icon, :entries
  has_one :author
  def entries
    feed_entries_url(id)
  end
end

class AuthorSerializer < ActiveModel::Serializer
  attributes :name, :email, :uri
end
