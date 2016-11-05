require 'nokogiri'
require 'open-uri'
require 'chronic'

FILES = [
 "Trivia_Animals.html",
 "Trivia_Food.html",
 "Trivia_History.html",
 "Trivia_Movies.html",
 "Trivia_Religion_Mythology.html",
 "Trivia_TV.html",
 "Trivia_anime.html",
 "Trivia_Computer.html",
 "Trivia_Geography.html",
 "Trivia_Misc.html",
 "Trivia_Music.html",
 "Trivia_Sport.html",
 "Trivia_Video_Games.html",
 "Trivia_science.html"
]

FILEPATH = './irc_trivia/'

VALUES = [
  100,
  200,
  300,
  400,
  500,
  600,
  700,
  800,
  1000
]

def text_to_clue(text)
  text = text.strip
  category_name = text.split(':').first
  answer = text.split('*').last
  question = text.split(':').last.split('*').first
  category = Category.where(title: category_name).first_or_create!
  clue = Clue.where(
    answer: answer,
    question: question,
    value: VALUES.sample,
    category_id: category.id,
    airdate: Time.now
  ).first_or_create!

  clue
end

task :get_open_questions  => :environment  do |t, args|
  FILES.each do |filename|
    raw_text = File.open(FILEPATH + filename).read
    question_nodes = Nokogiri::HTML(raw_text).css('ol').children.children
    question_nodes.each do |question|
      clue = text_to_clue(question.text)
      puts clue.answer
    end
  end
end

