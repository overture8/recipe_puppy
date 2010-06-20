require 'cgi'
require 'open-uri'
require 'json'
require File.expand_path(File.dirname(__FILE__) + '/recipe_puppy/recipe_data')

module RecipePuppy
  class Recipe
    attr_accessor :recipe_data

    def self.search_for(search_text = nil)
      unless search_text.nil?
        recipe = self.new
        recipe.recipe_data = RecipeData.new
        recipe.recipe_data.search_term = search_text
        recipe
      end
    end

    def self.with_ingredients(ingredients = nil)
      unless ingredients.nil?
        recipe = self.new
        recipe.recipe_data = RecipeData.new
        recipe.recipe_data.ingredients = ingredients
        recipe
      end
    end

    # This instance method is used for chaining to the search_for method.
    def with_ingredients(ingredients = nil)
      unless ingredients.nil?
        self.recipe_data.ingredients = ingredients
        self
      end
    end

    # Gets the data
    def get
      self.recipe_data.results
    end

    # Returns the API call url
    def url
      self.recipe_data.url
    end
  end
end
