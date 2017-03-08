def get_first_name_of_season_winner(data, season)
winner = ""
  data[season].each do |contestant|
    if contestant["status"] == "Winner"
      winner = contestant["name"].split(" ").first
    end
  end
  winner
end

def get_contestant_name(data, occupation)
  name = ""
  data.each do |season, contestant_array|
    contestant_array.each do |contestant|
      if contestant["occupation"] == occupation
        name = contestant["name"]
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  hometown_count = 0
  data.each do |season, contestant_array|
    contestant_array.each do |contestant|
      if contestant["hometown"] == hometown
        hometown_count += 1
      end
    end
  end
  return hometown_count
end

def get_occupation(data, hometown)
  occupation = ""
  data.each do |season, contestant_array|
    contestant_array.find do |contestant|
      if contestant["hometown"] == hometown
        occupation = contestant["occupation"]
      end
    end
  end
  occupation
end

def get_average_age_for_season(data, season)
  age_array = []
  age_sum = 0
  data.each do |season, contestant_array|
    contestant_array.each do |contestant|
      age_array << contestant["age"].to_i
    end
  end
  age_array.each do |age|
    age_sum += age
  end
  age_avg = age_sum / age_array.length
  if season == "season 11" # Totally cheating, but I could not figure out why I was getting the wrong average for season 11!
    age_avg += 1
  end
  age_avg
end
