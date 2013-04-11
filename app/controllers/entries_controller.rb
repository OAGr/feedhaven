class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.json
  def index
    @feed = Feed.find(params[:feed_id])
    @entries = @feed.entries
    respond_to do |format|
      format.html { render :layout => 'feed'}
    
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @feed = Feed.find(params[:feed_id])
    @entry = Entry.find(params[:id])
    respond_to do |format|
      format.html { render :layout => 'feed'}
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @feed = Feed.find(params[:feed_id])
    @entry = @feed.entries.new
    respond_to do |format|
      format.html { render :layout => 'feed'}
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @feed = Feed.find(params[:feed_id])
    @entry = Entry.find(params[:id])
    render :layout => 'standard'
  end

  # POST /entries
  # POST /entries.json
  def create
    @feed = Feed.find(params[:feed_id])
    @entry = @feed.entries.new(params[:entry])

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

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find(params[:id])
    @feed = @entry.feed
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to feed_path(@feed) }
      format.json { head :no_content }
    end
  end
end
