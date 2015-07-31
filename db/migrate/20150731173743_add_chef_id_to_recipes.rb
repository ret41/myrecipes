class AddChefIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :chef_id, :integer           #:name of table to be changed, :name of field you want to add, :type
  end
end
#after changes are made to this file, or any migration file, enter rake db:migrate
#check to see if changes are made in the schema.rb file