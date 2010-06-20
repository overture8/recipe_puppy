module RecipePuppy
  class RecipeData
    attr_accessor :ingredients, :search_term
    attr_reader :url

    def results
      if @ingredients && @search_term
        @url = "http://www.recipepuppy.com/api/?i=#{CGI.escape(@ingredients)}&q=#{CGI.escape(@search_term)}"
      elsif @ingredients && @search_term.nil? 
        @url = "http://www.recipepuppy.com/api/?i=#{CGI.escape(@ingredients)}"
      elsif @ingredients.nil? && @search_term
        @url = "http://www.recipepuppy.com/api/?q=#{CGI.escape(@search_term)}"
      end

      JSON.parse(open(@url).string)
    end
  end
end
