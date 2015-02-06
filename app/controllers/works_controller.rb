class WorksController < ApplicationController

  before_filter :authenticate_user!
  
  def index
  	if (params[:days])
  		@works = Work.recentdays(params[:days]).order('datetimeperformed desc')
  	else
  	    @works = Work.all.order('datetimeperformed desc')
  	end

    respond_to do |format|
      format.html # index.html.erb
      format.xml {render xml: @works}
      format.json {render json: @works}
    end

  end

  def show
  	@work = Work.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml {render xml: @work}
      format.json {render json: @work}
    end
  end


  def new
     @work = Work.new
  end


  def create
       @work = Work.create(work_params)

       respond_to do |format|
         if @work.save
           format.html {redirect_to @work, notice: 'Work Created'}
           format.js { render content_type: 'text/javascript'}
         else
           format.html {render 'new'}
           format.js {}
         end
       end

       #if @work.save
          #flash[:notice] =  'Work was successfully created.'
          #redirect_to action: "index"
       #else 
          #flash[:notice] =  'Error in creating Work'
          #redirect_to action: "index"
       #end
  end


  def edit
     @work = Work.find(params[:id])
  end



  def update
       @work = Work.find(params[:id])

       if @work.update(work_params)
          flash[:notice] =  'Work was successfully updated.'
          redirect_to action: "index"
       else 
          render 'new'
       end
  end


  private
  def work_params
    params.require(:work).permit(:project_id,:user_id,:datetimeperformed,:hours)
  end

end
