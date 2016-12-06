class PersonController < ApplicationController

  def create
    @person = Person.find_by(name: params[:person][:name], height: params[:person][:height], weight: params[:person][:weight])
    
    id = 1
    if (@person != nil)
      if (@person.id != nil)
        id = @person.id
      end
    else
      @person = Person.new(person_params)
      @person.save
      if (@person.id != nil)
        id = @person.id
      end
    end
    
    redirect_to controller: 'game', action: 'results', id: id
  end
  
  private 
    def person_params
      params.require(:person).permit(:name, :height, :weight)
    end
end