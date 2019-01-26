# Write your code here!
require "pry"

def game_hash
   { home:
    { team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
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

    away:
     { team_name: "Charlotte Hornets",
       colors: ["Turquoise", "Purple"],
       players: {
         "Jeff Adrien" => {
           number: 4,
           shoe: 18,
           points: 10,
           rebounds: 1,
           assists: 1,
           steals: 2,
           blocks: 7,
           slam_dunks: 2
         },
         "Bismak Biyombo" => {
           number: 0,
           shoe: 16,
           points: 12,
           rebounds: 4,
           assists: 7,
           steals: 7,
           blocks: 15,
           slam_dunks: 10
         },
         "DeSagna Diop" => {
           number: 2,
           shoe: 14,
           points: 24,
           rebounds: 12,
           assists: 12,
           steals: 4,
           blocks: 5,
           slam_dunks: 5
         },
         "Ben Gordon" => {
           number: 8,
           shoe: 15,
           points: 33,
           rebounds: 3,
           assists: 2,
           steals: 1,
           blocks: 1,
           slam_dunks: 0
         },
         "Brendan Haywood" => {
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


def num_points_scored(name)
  points = ""
  game_hash.each do |k, v|
    if v[:players].has_key?(name)
      points = v[:players][name][:points]
    end
  end
  points.to_i
end

def shoe_size(name)
  shoe = ""
  game_hash.each do |k, v|
    if v[:players].has_key?(name)
      shoe = v[:players][name][:shoe]
    end
  end
  shoe.to_i
end

def team_colors(team)
  colors = []
  game_hash.each do |k, v|
    if v[:team_name] == team
      return v[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |k, v|
      teams << v[:team_name]
  end
  teams
end

def player_numbers(team)
  jerseys = []
  game_hash.each do |k, v|
    if v[:team_name] == team
      v[:players].each do |name, key|
          jerseys << key[:number].to_i
      end
    end
  end
  jerseys.sort
end

def player_stats(player)
  stats = {}
  game_hash.each do |k, v|
    if v[:players].has_key?(player)
      stats = v[:players][player]
    end
  end
  stats
end

def big_shoe_rebounds
  size = nil
  rebounds = nil

  game_hash.each do |k, v|
    v[:players].each do |player, stats|
      if size == nil || stats[:shoe] > size
        size = stats[:shoe]
        rebounds = stats.fetch(:rebounds)
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0
  best_player = nil
  game_hash.each do |k, v|
    v[:players].each do |player, stats|
      if (stats[:points] > points)
        best_player = player
        points = stats[:points]
      end
    end
  end
  best_player
end

def winning_team
  home_points = 0
  away_points = 0
  winners = nil
  game_hash[:home][:players].each {|player, stats| home_points += stats[:points]}
  game_hash[:away][:players].each {|player, stats| away_points += stats[:points]}
  if home_points > away_points
    winners = game_hash[:home][:team_name]
  else
    wineers = game_hash[:away][:team_name]
  end
  winners
end

def player_with_longest_name
  name_size = 0
  longest_name = nil
  game_hash.each do |k, v|
    v[:players].each do |name, stats|
      if name.length > name_size
        longest_name = name
        name_size = name.length
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton
  most_steals = 0
  most_stealer = nil
  game_hash.each do |k, v|
    v[:players].each do |name, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        most_stealer = name
      end
    end
  end
  most_stealer == player_with_longest_name() ? true : false
end

puts long_name_steals_a_ton()
