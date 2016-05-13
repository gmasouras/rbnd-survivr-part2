require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require 'colorizr'
require 'artii'

#Create color methods from the gem
String.create_colors

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================

#This is where you will write your code for the three phases
def phase_one
	8.times { |time|
		puts "Elimination #{time+1}".light_blue
		@unlucky_tribe = @borneo.immunity_challenge
		puts "The loser tribe is: "+"#{@unlucky_tribe.name}".blue
		@lucky_tribe = @borneo.tribes.find { |tribe| tribe != @unlucky_tribe}

		@unlucky_contestant = @unlucky_tribe.tribal_council(immune: nil)
		puts "The eliminated contestant is: "+"#{@unlucky_contestant.name}".red
		@unlucky_tribe.members.delete(@unlucky_contestant)

		@borneo.clear_tribes
		@borneo.add_tribe(@unlucky_tribe)
		@borneo.add_tribe(@lucky_tribe)
	}
end

def phase_two
	3.times { |time|
		puts "Elimination #{time+1}".light_blue
		@immune_contestant = @borneo.individual_immunity_challenge
		@eliminated_contestant = @merge_tribe.tribal_council(immune: @immune_contestant)
		puts "The eliminated contestant is: "+"#{@eliminated_contestant.name}".red
		@merge_tribe.members.delete(@eliminated_contestant)
		@borneo.clear_tribes
		@borneo.add_tribe(@merge_tribe)
	}
end

def phase_three
	7.times { |time|
		puts "Elimination #{time+1}".light_blue
		@immune_contestant = @borneo.individual_immunity_challenge
		@eliminated_contestant = @merge_tribe.tribal_council(immune: @immune_contestant)
		puts "The eliminated contestant is: "+"#{@eliminated_contestant.name}".red
		@merge_tribe.members.delete(@eliminated_contestant)
		@jury.add_member(@eliminated_contestant)
		@borneo.clear_tribes
		@borneo.add_tribe(@merge_tribe)
	}
end

#Game Title
a = Artii::Base.new :font => 'big'
puts a.asciify('SURVIVOR').green

#Stylish printing on terminal
puts "Let the game begins..."
puts ""
puts ""
@coyopa.print_tribe
puts ""
@hunapu.print_tribe

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
puts ""
puts "First round of 8 eliminations..."
puts ""
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
puts ""
puts "Second round of 3 eliminations..."
puts ""
@merge_tribe.print_tribe
puts ""
phase_two #3 more eliminations
@jury = Jury.new
puts ""
puts "Last round of 7 eliminations..."
puts ""
@merge_tribe.print_tribe
puts ""
phase_three #7 eliminations become jury members
puts ""
finalists = @merge_tribe.members #set finalists
puts "The final two contestants are: "
finalists.each_with_index { |finalist, index| 
	puts "#{index+1}."+" #{finalist.name}".upcase.blue
}
puts ""
@jury.print_jury
puts ""
puts "and the voting results are: "
puts ""
vote_results = @jury.cast_votes(finalists) #Jury members report votes
puts ""
@jury.report_votes(vote_results) #Jury announces their votes

@winner = @jury.announce_winner(vote_results) #Jury announces final winner
puts ""
puts "The ultimate SURVIVOR is: "
puts @winner.upcase.green




