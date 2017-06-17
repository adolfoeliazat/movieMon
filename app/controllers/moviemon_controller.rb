require 'open-uri'
require 'json'

class MoviemonController < ApplicationController
	def initialize
  		super
  	end

	def title_screen
		@start =  "/new_game"
		@select = "/load"
	end

  	def new_game
  		$player = Player.new
  		$game = Game.new
  		redirect_to "/map"
  	end

    def debug
      if $player.nil? || $game.nil?
        redirect_to "/"
      end
    end

    def clear
      $player = nil
      $game = nil
      redirect_to "/"
    end

    def selectsaveslot
      #get slot data so the user can chose
      @slot1 = File.exist?("save1.txt") ? "sauvegarde 1" : "vide"
      @slot2 = File.exist?("save2.txt") ? "sauvegarde 2" : "vide"
      @slot3 = File.exist?("save3.txt") ? "sauvegarde 3" : "vide"
      if (params[:current].nil?)
        @current = 1
      else
        @current = Integer(params[:current])
      end

    @previous = @current - 1 || 3
      if @previous == 0
        @previous = 3
      end
      @next = @current + 1
      if @next == 4
        @next = 1
      end
    end

    def save
      slotId = params[:id]
      if (!$player.nil? && !$game.nil? && ["1", "2", "3"].include?(slotId))
        json_obj = {
          player: {
            name: $player.name,
            position: $player.position,
            hitpoint: $player.hitpoint,
          direction: $player.direction
          },
          movimons: $game.movimons
        }
        File.open("save#{slotId}.txt", "w") do |file|
          file.write(json_obj.to_json)
        end
        redirect_to "/map"
      else
        redirect_to "/"
      end
    end

    def selectloadslot
    @slot1 = File.exist?("save1.txt") ? "sauvegarde 1" : "vide"
      @slot2 = File.exist?("save2.txt") ? "sauvegarde 2" : "vide"
      @slot3 = File.exist?("save3.txt") ? "sauvegarde 3" : "vide"

      if (params[:current].nil?)
        @current = 1
      else
        @current = Integer(params[:current])
      end

    @previous = @current - 1 || 3
      if @previous == 0
        @previous = 3
      end
      @next = @current + 1
      if @next == 4
        @next = 1
      end
    end
    
    def load
      slotId = params[:id]
      if File.exist?("save#{slotId}.txt")
        json_obj = JSON.parse(File.read("save#{slotId}.txt"))
        $player = Player.new json_obj["player"]
        $game = Game.new json_obj["movimons"]
        redirect_to "/map"
      else
        redirect_to "/load"
      end
    end

  
end
