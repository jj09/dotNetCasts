class VodcastsController < ApplicationController
  # GET /vodcasts
  # GET /vodcasts.json
  def index
    @vodcasts = Vodcast.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vodcasts }
    end
  end

  # GET /vodcasts/1
  # GET /vodcasts/1.json
  def show
    @vodcast = Vodcast.find(params[:id])

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
        format.html { redirect_to @vodcast, notice: 'Vodcast was successfully created.' }
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

    respond_to do |format|
      if @vodcast.update_attributes(params[:vodcast])
        format.html { redirect_to @vodcast, notice: 'Vodcast was successfully updated.' }
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

    respond_to do |format|
      format.html { redirect_to vodcasts_url }
      format.json { head :no_content }
    end
  end
end
