require 'csv'

class PetsController < ApplicationController
    def index
	
    @pets = Pet.all
    end
    
	def new
        @pet=Pet.new
	end

  def create
   
  	@pet = Pet.new(pet_params)

  	if @pet.save
        redirect_to @pet
   	else
      	render 'new'
    end
	end

  def edit
  @pet = Pet.find(params[:id])
  end

  def show
        @pet=Pet.find(params[:id])
  end

  def getdata

    # this contains what has been selected in the first select box

    Rails.logger.debug("Params: #{params[:pet][:pet_type]}")
    Rails.logger.debug('test3')
    # we get the data for selectbox 2
    if params[:pet][:pet_type] == "Dog"
    @data_for_select2 = Idealdogweight.all
    end
    if params[:pet][:pet_type] == "Cat"
    @data_for_select2 = Idealcatweight.all
    end
    Rails.logger.debug("Params: #{@data_select2.inspect}")

    
    
    if params[:pet][:pet_type] != ""

    # render an array in JSON containing arrays like:
    #[[:id1, :name1], [:id2, :name2]]
    render :json => @data_for_select2.map{|c| [c.english_name, c.english_name]}
    else

    render :json => [['',''],['','']]
    end
  end

def update
  @pet = Pet.find(params[:id])
 
  if @pet.update(pet_params)
    redirect_to @pet
  else
    render 'edit'
  end
end


private
  def pet_params
  	  
      params.require(:pet).permit(:name, :gender, :age, :pet_type, :body_condition_score, :body_weight, :breed, :activity)
	
  end

     
end

