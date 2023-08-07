require "open-uri"

class GamesController < ApplicationController
  def new
     @random = ("a".."z").to_a
     @letters = Array.new(10) {@random.sample}

  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    response = URI.open(url).read
    responded = JSON.parse(response)
    english_word = responded["found"]
    all_letters = @word.include?(params[:letters])

    if english_word && all_letters
@result = "You're right!"
    elsif all_letters
@result = "It's an english word but wrong letters"
    else
      @result = "You're wrong"
    end

  end
end
