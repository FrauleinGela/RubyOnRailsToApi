class SessionsController < ApplicationController

  respond_to :json
  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end
   
  # GET /sessions/1/edit
  def edit
  end
  
  def addingsessions
  #logger.debug "//jsonnn//: #{params}"
  @sessions=params[:_json]
  logger.debug "//sesion hashhhhhh//: #{@sessions}"
  @sessions.each { |session|
     logger.debug "//sesion//: #{session}"
                    @se=Session.new()
                    @se.name=session[:name]
                    @se.dateStart=session[:startDate]
                    logger.debug "//session//: #{@se}"
                    @se.save
                     
                    }
    
  end
  def addingcounter
   
    @session = Session.find(params[:id])
    @session_favs=@session.counterfavs
    if @session_favs.nil?
      @session_favs=0
      @counter=@session_favs+1
    elsif
      @counter=@session_favs+1
    end  
    
    logger.debug "/couunter//: #{@counter}"
    @session.counterfavs=@counter
    @session.save
    render json: @session, status: :ok 
  end
 
  
  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to @session, notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params[:session,:name]
      
    end
end
