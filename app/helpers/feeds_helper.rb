module FeedsHelper

  def updated_s(feed)
    diff = Time.now - feed.updated
    "uptdate #{distance_of_time_in_words(diff)} ago"
  end
end
