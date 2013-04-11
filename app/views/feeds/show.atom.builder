atom_feed :language => "en-US" do |feed|
  %w(title subtitle updated rights icon source subtitle tags).each do |field|
    if (@feed.send(field) != '')
      feed.send(field, @feed.send(field))
    end
  end
  unless @feed.author.empty?
    feed.author do |author|
      author.name @feed.author.name if @feed.author.name
      author.email @feed.author.email if @feed.author.name
      author.uri @feed.author.uri if @feed.author.name
    end
  end
  @feed.entries.each do |feed_entry|
    feed.entry(feed_entry, :url => feed_entry_url(feed_entry.feed_id, feed_entry.id)) do |entry|
      %w(title updated summary updated content).each do |field|
        if (feed_entry.send(field) != '')
          entry.send(field, feed_entry.send(field))
        end
      end
      unless feed_entry.author.empty?
        feed.author do |author| 
          author.name feed_entry.author.name if feed_entry.author.name
          author.email feed_entry.author.email if feed_entry.author.email
          author.uri feed_entry.author.uri if feed_entry.author.uri
        end
      end
    end
  end
end


