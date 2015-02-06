class ProjectsController < ApplicationController

  before_filter :authenticate_user!

  def index
  	@projects = Project.all

  	respond_to do |format|
		format.html # index.html.erb
		format.xml {render xml: @projects}
		format.json {render json: @projects}
	end
  end

  def show
  	@project = Project.find(params[:id])

    @work = Work.new
    @work.project = @project
    
  	respond_to do |format|
		  format.html # show.html.erb
		  format.xml {render xml: @project}
		  format.json {render json: @project}
	  end

  end


  def new
  	@project = Project.new
  end


  def create
       @project = Project.create(project_params)

       if @project.save
          flash[:notice] =  'Project was successfully created.'
          redirect_to action: "index"
       else 
          flash[:notice] =  'Error in creating Project'
          redirect_to action: "index"
       end
  end


  def edit
       @project = Project.find(params[:id])
  end


  def update
       @project = Project.find(params[:id])

       if @project.update(project_params)
          flash[:notice] =  'Project was successfully updated.'
          redirect_to action: "index"
       else 
          render 'new'
       end
  end

  private
  def project_params
    params.require(:project).permit(:name,:company_id,:default_rate)
  end

end
