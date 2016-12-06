class GameController < ApplicationController
  def index
  end
  
  def results
    @id = params[:id]
    @person = Person.find_by(id:params[:id])
    
    dog_persons = 0
    cat_persons = 0
    
    if (@person != nil)
      if (@person.pet != nil)
          @pet = @person.pet
          if (@pet == 'Dog')
              @petimage = 'https://www.what-dog.net/Images/faces2/scroll0015.jpg'
          else
              @petimage = 'https://s-media-cache-ak0.pinimg.com/736x/07/c3/45/07c345d0eca11d0bc97c894751ba1b46.jpg'
          end
      else
          bmi = @person.weight * 0.45 / ((@person.height * 12 * 0.025) * (@person.height * 12 * 0.025))
          
          Person.find_each do |person|
            personbmi =  person.weight * 0.45 / ((person.height * 12 * 0.025) * (person.height * 12 * 0.025))
            
            if (bmi == personbmi)
              if (person.pet == 'Cat')
                cat_persons = cat_persons + 1
              else
                dog_persons = dog_persons + 1
              end
            end
          end
      
          puts dog_persons
          puts cat_persons
          
          if (dog_persons > cat_persons)
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
  end
  
  def update
      id = params[:id]
      pet = params[:person][:pet]
      person = Person.find_by(id: id)
      if (person != nil)
        person.update(pet: pet)
      end
      redirect_to controller: 'welcome', action: 'returning'
  end
end
