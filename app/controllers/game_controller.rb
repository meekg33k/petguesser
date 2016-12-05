class GameController < ApplicationController
  def index
  end
  
  def results
    @id = params[:id]
    @person = Person.find_by(id:params[:id])
    
    if (@person.pet != nil)
        @pet = @person.pet
        if (@pet == 'Dog')
            @petimage = 'https://www.what-dog.net/Images/faces2/scroll0015.jpg'
        else
            @petimage = 'https://s-media-cache-ak0.pinimg.com/736x/07/c3/45/07c345d0eca11d0bc97c894751ba1b46.jpg'
        end
    else
        @dog_persons = Person.where(height:@person.height, weight:@person.weight, pet:'Dog').count
        @cat_persons = Person.where(height:@person.height, weight:@person.weight, pet:'Cat').count
    
        puts @dog_persons
        puts @cat_persons
        
        if (@dog_persons > @cat_persons)
          @petimage = 'https://www.what-dog.net/Images/faces2/scroll0015.jpg'
          @pet = 'Dog'
          @notpet = 'Cat'
        else
          @petimage = 'https://s-media-cache-ak0.pinimg.com/736x/07/c3/45/07c345d0eca11d0bc97c894751ba1b46.jpg'
          @pet = 'Cat'
          @notpet = 'Dog'
        end
    end
  end
  
  def update
      id = params[:id]
      pet = params[:person][:pet]
      person = Person.find_by(id: id)
      person.update(pet: pet)
      redirect_to controller: 'welcome', action: 'returning'
  end
end
