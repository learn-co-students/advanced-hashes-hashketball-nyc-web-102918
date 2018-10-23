# Write your code here!
require "pry"
def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }

end
=begin
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end
good_practices
=end

def num_points_scored(player_name)
  total_scored = 0

  game_hash.each do |location, team_data| #home, away
#    binding.pry
    team_data.each do |attribute, data| #team_name, colors, players
#      binding.pry
      if attribute == :players
        data.each do |player, stats| #each player
#          binding.pry
          if player == player_name
            stats.each do |key, value| #each stat category
#              binding.pry
              if key == :points
                total_scored += value

#               binding.pry
              end
            end
          end
        end
      end
    end
  end
  total_scored
end

def shoe_size(player_name)
  size = 0

  game_hash.each do |location, team_data| #home, away
#    binding.pry
    team_data.each do |attribute, data| #team_name, colors, players
#      binding.pry
      if attribute == :players
        data.each do |player, stats| #each player
#          binding.pry
          if player == player_name
            stats.each do |key, value| #each stat category
#              binding.pry
              if key == :shoe
                size += value

#               binding.pry
              end
            end
          end
        end
      end
    end
  end
  size
end

def team_colors(team_name)
  color = []

  game_hash.each do |location, team_data| #home, away
    team_data.each do |attribute, data| #team_name, colors, players
      if attribute == :team_name && data == team_name
        color = game_hash[location][:colors]
      end
    end
  end
  color
end

def team_names
  teams = []
  game_hash.each do |location, team_data| #home, away
    team_data.each do |attribute, data| #team_name, colors, players
      if attribute == :team_name
        teams << data
      end
    end
  end

  teams
end

def player_numbers(team)
  jersey_numbers = []

  game_hash.each do |location, team_data| #home, away
    team_data.each do |attribute, data| #team_name, colors, players
      if attribute == :team_name && data == team
        game_hash[location][:players].each do |player, stats|
          stats.each do |key, value|
            if key == :number
              jersey_numbers << value
            end
          end
        end
      end
    end
  end

  jersey_numbers
end

def player_stats(player_name)
  all_stats = {}
  game_hash.each do |location, team_data| #home, away
    team_data.each do |attribute, data| #team_name, colors, players
      if attribute == :players
        data.each do |player, stats| #each player
          if player == player_name
            all_stats = stats
          end
        end
      end
    end
  end
  all_stats
end

def big_shoe_rebounds
  largest_shoe_size = 0
  current_player = ""
  num_rebounds = 0
  game_hash.each do |location, team_data| #home, away
    team_data.each do |attribute, data| #team_name, colors, players
      if attribute == :players
        data.each do |player, stats| #each player
          stats.each do |key, value|
            if key == :shoe && value > largest_shoe_size
              largest_shoe_size = value
              current_player = player
              num_rebounds = game_hash[location][:players][player][:rebounds]
            end
          end
        end
      end
    end
  end

  num_rebounds
end

#### BONUS ####
def most_points_scored

end

def winning_team

end

def player_with_longest_name

end

def long_name_steals_a_ton

end
