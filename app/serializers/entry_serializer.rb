class EntrySerializer < ActiveModel::Serializer
  attributes :id, :title, :updated, :published, :content, :link, :summary, :dump, :rest
  has_one :author
  def rest
    feed_entry_url(self.object.feed_id, self.object.id)
  end
end

class AuthorSerializer < ActiveModel::Serializer
  attributes :name, :email, :uri
end
