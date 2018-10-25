require "pry"

def game_hash
  game_hash = {
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
          :number =>  2,
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
# game_hash[home/away][team name/colors/players][name][stats]

def num_points_scored(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  if home_players.keys.include?(player_name)
    points_scored = home_players[player_name][:points]
  elsif away_players.keys.include?(player_name)
    points_scored = away_players[player_name][:points]
  end
  points_scored
end

def shoe_size(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  if home_players.keys.include?(player_name)
    shoe_size = home_players[player_name][:shoe]
  elsif away_players.keys.include?(player_name)
    shoe_size = away_players[player_name][:shoe]
  end
  shoe_size
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    colors = game_hash[:home][:colors]
  else
    colors = game_hash[:away][:colors]
  end
  colors
end

def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
  teams
end

def player_numbers(team_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  jersey_numbers = []
  if game_hash[:home][:team_name] == team_name
    home_players.each do |player, stats|
      jersey_numbers << home_players[player][:number]
    end
  else away_players.each do |player, stats|
    jersey_numbers << away_players[player][:number]
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  if home_players.keys.include?(player_name)
    stats = home_players[player_name]
  elsif away_players.keys.include?(player_name)
    stats = away_players[player_name]
  end
  stats
end

def big_shoe_rebounds
  all_players = game_hash[:home][:players].merge(game_hash[:away][:players])
  all_players_shoes = {}
  all_players.each do |player, stats|
    all_players_shoes[player] = all_players[player][:shoe]
  end
  big_shoe_player = all_players_shoes.sort_by { |player, shoe| shoe }.last[0]
  #big_shoe_player
  all_players[big_shoe_player][:rebounds]
end

# Bonus Questions:

def most_points_scored
  all_players = game_hash[:home][:players].merge(game_hash[:away][:players])
  all_players_points = {}
  all_players.each do |player, stats|
    all_players_points[player] = all_players[player][:points]
  end
  highest_scorer = all_players_points.sort_by { |player, points| points }.last[0]
  highest_scorer
end

def winning_team
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_points = 0
  away_points = 0
  home_players.each do |player, stats|
    home_points += home_players[player][:points]
  end
  away_players.each do |player, stats|
    away_points += away_players[player][:points]
  end
  if home_points > away_points
    winning_team = game_hash[:home][:team_name]
  else
    winning_team = game_hash[:away][:team_name]
  end
  winning_team
end

def player_with_longest_name
  all_players = game_hash[:home][:players].merge(game_hash[:away][:players])
  all_players_names = all_players.keys
  longest_name = all_players_names.sort_by { |name| name.length }.last
  longest_name
end

# Super Bonus:

def long_name_steals_a_ton?
  all_players = game_hash[:home][:players].merge(game_hash[:away][:players])
  all_players_steals = {}
  all_players.each do |player, stats|
    all_players_steals[player] = all_players[player][:steals]
  end
  most_steals = all_players_steals.sort_by { |player, steals| steals }.last[0]
  if most_steals == player_with_longest_name
    return true
  else
    return false
  end
end
