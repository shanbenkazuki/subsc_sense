quiz_titles = ['Netflix', 'Spotify', 'chatGPT(GPT-4)']
quiz_titles.each do |title|
  Quiz.create!(title: title)
end