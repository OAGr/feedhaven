class SimpleEntriesController < ApplicationController

  # POST /entries
  # POST /entries.json
  def create
    @feed = Feed.find(params[:feed_id])
    @simple_entry = SimpleEntry.new(params[:simple_entry])
    @entry = @feed.entries.new(@simple_entry.params)
    respond_to do |format|
      if @entry.save
        @entry.author.save
        format.html { redirect_to feed_entry_path(@feed,@entry), notice: 'Entry was successfully created.' }
        format.json { render json: feed_entry_path(@feed, @entry), status: :created, location: feed_entry_path(@feed, @entry) }
      else
        format.html { render action: "new" }
        format.json { render json: feed_entry_path(@feed,@entry).errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])
    @feed = @entry.feed

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to feed_entry_path(@feed, @entry), notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

end

