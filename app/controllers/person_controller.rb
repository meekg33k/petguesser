class PersonController < ApplicationController
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @person = Person.find_by(name: params[:person][:name], height: [:person][:height], weight: [:person][:weight])
    
    if (@person != nil)
        id = @person.id
    else
      @person = Person.new(params[:person])
      @person.save
      id = @person.id
    end
    
    redirect_to controller: 'game', action: 'results', id: id
  end
  
  private 
    def person_params
      params.require(:person).permit(:name, :height, :weight)
    end
end