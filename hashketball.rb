# Write your code here!
require 'pry'

def game_hash
  
  {
    home: {
      team_name: "Brooklyn Nets", 
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez": {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee": {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry": {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets", 
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop": {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon": {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood": {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player)
  list_of_players = game_hash[:home][:players].merge(game_hash[:away][:players])
  the_player = list_of_players.fetch(player.to_sym)
  the_player[:points]
end

def shoe_size(player)
  list_of_players = game_hash[:home][:players].merge(game_hash[:away][:players])
  the_player = list_of_players.fetch(player.to_sym)
  the_player[:shoe]
end

def team_colors(team)
  colors = nil
  game_hash.each do |court, team_data|
    if game_hash[court][:team_name] == team
      colors = game_hash[court][:colors]
    end
  end
  colors
end

def team_names
  game_hash.collect do |court, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
  list_of_numbers = []
  game_hash.each do |court, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |name, stats|
        list_of_numbers << stats[:number]
      end
    end
  end
  list_of_numbers
end

def player_stats(player)
  player_stats = nil
  game_hash.each do |court, team_data|
    if team_data[:players].has_key?(player.to_sym) == true
      player_stats = team_data[:players][player.to_sym]
    end
  end
  player_stats
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  list_of_players = game_hash[:home][:players].merge(game_hash[:away][:players])
  list_of_players.each do |name, stats|
    if stats[:shoe] > shoe_size
      shoe_size = stats[:shoe]
      rebounds = stats[:rebounds]
    end
  end
  rebounds
end

puts player_numbers("Brooklyn Nets")






