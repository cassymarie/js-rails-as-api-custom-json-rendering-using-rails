class BirdsController < ApplicationController
  def index
    birds = Bird.all
    ##will show ALL of the column data
    # render json: birds

    ##selectively choose what(only) -or- not(except) to pass through - slice wont work with a collection
    ##both will show the same results
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]

  end

  def show
    bird = Bird.find_by(id: params[:id])

    ##will show ALL of the column data
    # render json: bird

    ## (2) below methods will return the same results

    ##selectively choose what to pass through
    # render json: {id: bird.id, name: bird.name, species: bird.species }

    ##slice method - Rather than having to spell out each key, the Hash slice method (Links to an external site.) returns a new hash with only the keys that are passed into slice. In this case, :id, :name, and :species were passed in, so created_at and updated_at get left out, just like before.
    # render json: bird.slice(:id, :name, :species)

    ##Handling error messages while rendering
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end


  end

end