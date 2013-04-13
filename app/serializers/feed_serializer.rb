class FeedSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :updated, :source, :rights, :tags, :categories, :icon, :rest
  has_one :author
  def rest
    feed_url(id)
  end
end

class AuthorSerializer < ActiveModel::Serializer
  attributes :name, :email, :uri
end
