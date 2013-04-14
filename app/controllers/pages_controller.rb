class PagesController < ApplicationController

  def home
  end

  def api
    @entry = params['entry'] || Entry.first
    @feed = params['feed'] || Feed.first
    @page = params['page']
  end

  def import
  end

  def icons
  end

end
