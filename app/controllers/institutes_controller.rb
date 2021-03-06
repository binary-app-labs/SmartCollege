class InstitutesController < ApplicationController
  # GET /institutes
  # GET /institutes.json
  def index
    @institutes = Institute.all
    @institute ||= Institute.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @institutes }
    end
  end

  # GET /institutes/new
  def new
    @institute = Institute.new

    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  # GET /institutes/1
  # GET /institutes/1.json
  def show
    @institute = Institute.find(params[:id])
    redirect_to institutes_url
  #
  # respond_to do |format|
  # format.html # show.html.erb
  # format.json { render json: @institute }
  # end
  end

  # GET /institutes/1/edit
  def edit
    @institute = Institute.find(params[:id])

    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  # POST /institutes
  # POST /institutes.json
  def create
    @institute = Institute.new(params[:institute])

    respond_to do |format|
      if @institute.save
        format.html { redirect_to institutes_url, notice: "Institute #{ @institute.name } was successfully created" }
        format.json { render json: institutes_url, status: :created, location: @institute }
      else
        @institutes = Institute.all
        format.html{ render :action => :index }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /institutes/1
  # PUT /institutes/1.json
  def update
    @institute = Institute.find(params[:id])

    respond_to do |format|
      if @institute.update_attributes(params[:institute])
        format.html { redirect_to institutes_url, notice: "Institute #{ @institute.name } was successfully updated" }
        format.json { head :ok }
      else
        @institutes = Institute.all
        format.html { render :action=>:index }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutes/1
  # DELETE /institutes/1.json
  def destroy
    @institute = Institute.find(params[:id])
    @institute.destroy

    respond_to do |format|
      format.html { redirect_to institutes_url }
      format.json { head :ok }
    end
  end

  def change_institute
    @institute = Institute.find( params[:institute][:id] )
    set_institute_in_session( @institute.id )
    redirect_to institutes_url
  end

end
