class Feed
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :subtitle, type: String
  field :updated, type: DateTime, default: Time.now
  field :source, type: String
  field :rights, type: String
  field :tags, type: Array
  field :categories, type: Hash
  field :icon, type: String

  attr_accessible :title, :subtitle, :updated, :source, :rights, :tags, :categories, :icon, :author_attributes, :author
  validates_presence_of :title
  has_many :entries

  embeds_one :author, autobuild: true
  accepts_nested_attributes_for :author

  def update!
    a = self
    a.updated = Time.now.utc
    a.save
  end
end


