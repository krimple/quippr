class QuipsController < ApplicationController
  # GET /quips
  # GET /quips.json
  def index
    @quips = Quip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quips }
    end
  end

  # GET /quips/1
  # GET /quips/1.json
  def show
    @quip = Quip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quip }
    end
  end

  # GET /quips/new
  # GET /quips/new.json
  def new
    @quip = Quip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quip }
    end
  end

  # GET /quips/1/edit
  def edit
    @quip = Quip.find(params[:id])
  end

  # POST /quips
  # POST /quips.json
  def create
    @quip = Quip.new(params[:quip])

    respond_to do |format|
      if @quip.save
        format.html { redirect_to @quip, notice: 'Quip was successfully created.' }
        format.json { render json: @quip, status: :created, location: @quip }
      else
        format.html { render action: "new" }
        format.json { render json: @quip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quips/1
  # PUT /quips/1.json
  def update
    @quip = Quip.find(params[:id])

    respond_to do |format|
      if @quip.update_attributes(params[:quip])
        format.html { redirect_to @quip, notice: 'Quip was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @quip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quips/1
  # DELETE /quips/1.json
  def destroy
    @quip = Quip.find(params[:id])
    @quip.destroy

    respond_to do |format|
      format.html { redirect_to quips_url }
      format.json { head :ok }
    end
  end
  
  def index
    @quips = Quip.order(:ranking)    
  end
  
  def bump_up
    if params[:id]
      quip = Quip.find(:id)
      quip.bump(:up)
      render :text => quip.ranking.to_s
    end
  end
  
  def bump_down
    if params[:id]
      quip = Quip.find(:id)
      quip.bump(:down)
      render :text => quip.ranking.to_s
    end
  end
end
