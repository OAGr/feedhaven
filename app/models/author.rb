class Author
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :uri, type: String
  embedded_in :feed
  embedded_in :entry
  attr_accessible :name, :email, :uri

  def empty?
    hash = self.serializable_hash
    hash.delete('_id')
    values = hash.values
    all_nil = values.all? {|value| value.nil?}
  end
end

