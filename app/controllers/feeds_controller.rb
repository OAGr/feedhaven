class FeedsController < ApplicationController
  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.order_by(:updated.desc)
    respond_to do |format|
      format.html {render :layout => 'standard'}
      format.json { render json: @feeds }
    end
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    @feeds = Feed.order_by(:updated.desc).limit(10)
    @feed = Feed.find(params[:id])
    @entries = @feed.entries.order_by(:published.desc).limit(20)
    respond_to do |format|
      format.html {render :layout => 'standard'}
      format.json { render json: @feed }
      format.atom {render :layout => false }
    end
  end

  def main
    @feeds = Feed.order_by(:updated.desc).limit(10)
    @feed = Feed.find(params[:id])
    @entries = @feed.entries.order_by(:published.desc).limit(20)
    respond_to do |format|
      format.html {render :layout => 'standard'}
      format.json { render json: @feed }
      format.atom {render :layout => false }
    end
  end

  # GET /feeds/new
  # GET /feeds/new.json
  def new
    @feed = Feed.new
    @feed.build_author
    respond_to do |format|
      format.html {render :layout => 'standard'}
      format.json { render json: @feed }
    end
  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
    render :layout => 'feed'
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(params[:feed])
    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render json: @feed, status: :created, location: @feed }
      else
        format.html { render action: "new" }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feeds/1
  # PUT /feeds/1.json
  def update
    @feed = Feed.find(params[:id])
    respond_to do |format|
      if @feed.update_attributes(params[:feed])
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url }
      format.json { head :no_content }
    end
  end
end
