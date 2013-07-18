class VodcastsController < ApplicationController
  before_filter :signed_in_admin, only: [:new, :create, :edit, :update, :destroy]

  caches_action :index

  # GET /vodcasts
  # GET /vodcasts.json
  def index
    @vodcasts = Vodcast.search(params[:search])
    
    if @vodcasts.count == 0
      if params[:search]
        flash.now[:notice] = "No results"
      else
        flash.now[:notice] = "No vodcasts"
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vodcasts }
    end
  end

  # GET /vodcasts/1
  # GET /vodcasts/1.json
  def show
    @vodcast = Vodcast.find(params[:id])
    @comment = Comment.new
    logger.info "Show page requested"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vodcast }
    end
  end

  # GET /vodcasts/new
  # GET /vodcasts/new.json
  def new
    @vodcast = Vodcast.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vodcast }
    end
  end

  # GET /vodcasts/1/edit
  def edit
    @vodcast = Vodcast.find(params[:id])
  end

  # POST /vodcasts
  # POST /vodcasts.json
  def create
    @vodcast = Vodcast.new(params[:vodcast])

    respond_to do |format|
      if @vodcast.save
        flash[:success] = "Vodcast was successfully created."
        expire_action action: "index"
        format.html { redirect_to @vodcast }
        format.json { render json: @vodcast, status: :created, location: @vodcast }
      else
        format.html { render action: "new" }
        format.json { render json: @vodcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vodcasts/1
  # PUT /vodcasts/1.json
  def update
    @vodcast = Vodcast.find(params[:id])
    @vodcast.tags.clear

    respond_to do |format|
      if @vodcast.update_attributes(params[:vodcast])
        flash[:success] = "Vodcast was successfully updated."
        expire_action action: "index"
        format.html { redirect_to @vodcast }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vodcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vodcasts/1
  # DELETE /vodcasts/1.json
  def destroy
    @vodcast = Vodcast.find(params[:id])
    @vodcast.destroy

    expire_action action: "index"

    respond_to do |format|
      format.html { redirect_to vodcasts_url }
      format.json { head :no_content }
    end
  end

  def feed
  # this will be the name of the feed displayed on the feed reader
  @title = "dotNetCasts"

  # the news items
  @vodcasts = Vodcast.order("updated_at desc")

  # this will be our Feed's update timestamp
  @updated = @vodcasts.first.updated_at unless @vodcasts.empty?

  respond_to do |format|
    format.atom { render :layout => false }

    # we want the RSS feed to redirect permanently to the ATOM feed
    format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
  end
end
end
