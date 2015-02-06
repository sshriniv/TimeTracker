class CompaniesController < ApplicationController

	before_filter :authenticate_user!

	def index
		@companies = Company.all

		respond_to do |format|
			format.html # index.html.erb
			format.xml {render xml: @companies}
			format.json {render json: @companies}
		end
	end

	def show
		@company = Company.find(params[:id])
		
		respond_to do |format|
			format.html # show.html.erb
			format.xml {render xml: @company}
			format.json {render json: @company}
		end
	end

	def new
       @company = Company.new
	end


	def create
       @company = Company.create(company_params)

       if @company.save
          flash[:notice] =  'Company was successfully created.'
          redirect_to action: "index"
       else 
       	  render 'new'
       end
	end


	def edit
       @company = Company.find(params[:id])
	end


	def update
       @company = Company.find(params[:id])

       if @company.update(company_params)
       	  flash[:notice] =  'Company was successfully updated.'
       	  redirect_to action: "index"
       else 
       	  render 'new'
       end
	end

  private
  def company_params
    params.require(:company).permit(:name)
  end

end
