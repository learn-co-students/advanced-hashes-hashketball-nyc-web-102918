def game_hash
   {
 :home => {
   :team_name => "Brooklyn Nets",
   :colors => ["Black", "White"],
   :players => [
     {
      :player_name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
   }, {
      :player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
   }, {
      :player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
   }, {
     :player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
   }, {
     :player_name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
    }
   ]
 },

 :away => {
   :team_name => "Charlotte Hornets",
   :colors => ["Turquoise", "Purple"],
   :players => [
     {
       :player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
     }, {
       :player_name => "Bismak Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
     }, {
       :player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
     }, {
       :player_name => "Ben Gordon",
      :number =>8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
     }, {
       :player_name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
     }
    ]
  }
}
end

def num_points_scored(player)
  answer = nil
  game_hash.each do |team, team_details_hash|
    team_players_array = team_details_hash[:players]
    team_players_array.each do |each_hash|
      if each_hash[:player_name] == player
       answer = each_hash[:points]
     end
   end
 end
  answer
end

def shoe_size(player)
  answer = nil
  game_hash.each do |team, team_details_hash|
    team_players_array = team_details_hash[:players]
    team_players_array.each do |each_hash|
      if each_hash[:player_name] == player
       answer = each_hash[:shoe]
     end
   end
 end
  answer
end

def team_colors(team_name_supply)
  answer = nil
  game_hash.each do |teamName, team_details_hash|
    if team_details_hash[:team_name] == team_name_supply
      answer = team_details_hash[:colors]
    end
  end
      
      answer
end

def team_names
  team_names_array = []
  game_hash.each do |homeAway, team_details_hash|
    team_names_array << team_details_hash[:team_name]
  end
  team_names_array
end

def player_numbers(team)
  jersey_array = []
  game_hash.each do |homeAway, team_details_hash|
    if team_details_hash[:team_name] == team
    team_details_hash[:players].each do |each_players_details|
      jersey_array << each_players_details[:number]
    end
  end
  end
  jersey_array
end
    
def player_stats(name)
   answer = {}
    game_hash.each do |team, team_details_hash|
      team_details_hash[:players].each do |each_players_details|
        if each_players_details[:player_name] == name
          each_players_details.delete(:player_name)
          answer = each_players_details
        end
      end
    end
    answer
end
    
    
def big_shoe_rebounds
  answer = 0
  shoe_size1 = 0
  game_hash.each do |team, team_details_hash|
    team_details_hash[:players].each do |each_players_details|
      if each_players_details[:shoe]>shoe_size1
        shoe_size1 = each_players_details[:shoe]
        answer = each_players_details[:rebounds]
      end
    end
  end
  answer
end
    
    


