module Codebreaker
  class Game
    attr_accessor :attempts

    def initialize(output)
      @output = output
    end

    def start(secret, max_attempts)
      @secret = secret
      @max_attempts = max_attempts
      @attempts = 0

      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      marker = Marker.new(@secret, guess)
      exact_match_count = marker.exact_match_count
      @output.puts '+' * exact_match_count +
                   '-' * marker.number_match_count

      @attempts += 1

      if exact_match_count == @secret.size
        @output.puts 'You won!'
        exit
      elsif @attempts >= @max_attempts
        @output.puts 'You lost!'
        exit
      end
    end
  end
end
