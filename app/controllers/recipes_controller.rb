class RecipesController < ApplicationController
  
  def index #defines index action
    @recipes = Recipe.all                                        #Goes to the database
                                                                 #gets all of the recipes
                                                                 #stores them in @recipes object
                                                                 #then passes that into recipes view
  end
  
  def show #creates show action. recipes#show                                                     
    @recipe = Recipe.find(params[:id])
  end
  
  def new #creates new action. This is the template that will be created in the browser so a user can create a new recipe.
    @recipe = Recipe.new    #new recipe object that will be passed into new.html.erb.    
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(2)                 #creates chef id
    
    if @recipe.save                             #if we are able to save recipe object, great
      flash[:success] = "Your recipe was created successfully" #flash this message to screen
      redirect_to recipes_path                  #redirect to index page. Check routes to verify this.
      
    else
      render :new                               #if not, render template again
    end
  end
  
  def edit
   @recipe = Recipe.find(params[:id]) #find method is used to get recipe id and assign it to new variable which is passed into edit.html.erb
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params) #pre-existing method
      flash[:success] = "Your recipe was updated successfully!"   #success object that is passed to update.html.erb
      redirect_to recipe_path(@recipe)#redirect to show recipe page with recipe object that we are working with in parethesis
    else
     render :edit
     
   end#end if
  end

  private 
      def recipe_params
        params.require(:recipe).permit(:name, :summary, :description, :picture)
      end

end #end class

