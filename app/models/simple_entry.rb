class SimpleEntry

  attr_accessor :title, :updated, :published, :content, :link, :summary, :dump, :author_name, :author_email, :author_uri, :keywords

  def initialize(params)
    @title = params['title'] || params['Title']
    @content = params['content'] || params['Content']
    @link = params['link'] || params['Link']
    @content = params['content']
    @summary = params['summary'] || params['Summary']
    @published = render_published(params)
    @updated = render_updated(params)
    @author_name = params['author'].try(:[],'name') || params['author'].try(:[], 'Name') || params['author_name'] || params['author-name']
    @author_email = params['author'].try(:[],'author') || params['author'].try(:[],'Author') || params['author_email'] || params['author-email']
    @author_uri = params['author'].try(:[],'uri') || params['author'].try(:[], 'Uid') || params['author'].try(:[],'uri') || params['author_uri'] || params['author-uri']
    @dump = edit_dump(params)
  end

  def params
    params = {}
    [:title, :content, :link, :summary, :dump, :updated, :published].each do |attr|
      params[attr] = self.send(attr) if self.send(attr)
    end
    
    params[:author] = {}
    [[:author_name, 'name'], [:author_email, 'email'] , [:author_uri, 'uri']].each do |value, name| 
      params[:author][name] = self.send(value)
    end
    return params
  end

  def render_published(params)
    time = params['published'] || params['Published'] || params['published_at'] || params['Published_at'] || Time.now
    time = repair_time(time) if time
  end

  def render_updated(params)
    time = params['updated'] || params['Updated'] || params['updated_at'] || params['Updated_at'] || @published
    time = repair_time(time) if time
  end

  def repair_time(time)
    #first, try parsing for Datetime
    time = time.to_s
    datetime = DateTime.parse(time).utc rescue nil
    if datetime.nil? and (time.to_i > 0) #test, if it is unix time
      unix_time = Time.at(time.to_i)
    end
    return datetime || unix_time
  end

  def edit_dump(params)
    dump = clean_dump(params)
    keyword_list = @@keywords.map{|key,value|value}.flatten
    unique_keys = params.keys - keyword_list
    unique_keys.each do |key|
      dump[key] = params[key]
    end
    dump
  end

  def clean_dump(params)
    dump = params['dump'] || params['Dump']
    case 
    when dump.nil?
      dump = {}
    #This was here for trial, but seems to be a bad idea
    #when dump.class != Hash
    #  dump = {'extra' => dump}
    end
    dump
  end

  @@keywords = {
    :title => ['Title','title'],
    :content => ['Content', 'content'],
    :summary => ['Summary', 'summary'],
    :link => ['Link', 'link'],
    :update => ['Updated', 'Updated_at'],
    :content => ['Content', 'content'],
    :updated => ['updated', 'Updated'],
    :published => ['published', 'Published', 'published_at', 'Published_at', 'created_at', 'Created_at'],
    :author => ['author', 'Author'],
    :author_name => ['author-name', 'Author-name', 'author_name', 'Author_name'],
    :author_email => ['author-email', 'Author-email', 'author_email', 'Author_email'],
    :author_uri => ['author-uri', 'Author-uri', 'author_uri', 'author-uri'],
    :dump => ['dump', 'Dump']
  }

end
