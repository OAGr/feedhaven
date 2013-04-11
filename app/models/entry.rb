class Entry
  include Mongoid::Document
  attr_accessible :title, :updated, :published, :content, :link, :summary, :dump, :author
  field :title, type: String
  field :updated, type: DateTime, default: Time.now
  field :published, type: DateTime, default: Time.now
  field :content, type: String
  field :link, type: String
  field :summary, type: String
  field :dump, type: Hash

  validates_presence_of :title, :published
  belongs_to :feed

  embeds_one :author, autobuild: true
  accepts_nested_attributes_for :author

  after_save :update_feed

  def update_feed
    feed.update!
  end

end


