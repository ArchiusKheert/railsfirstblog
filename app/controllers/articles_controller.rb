class ArticlesController < ApplicationController
  def index
  end

  def about
  	@about_cr = "This 'app' was made by Archius. That's my AlterEgo"
  	@answer = "4"+"2"
  end
end
