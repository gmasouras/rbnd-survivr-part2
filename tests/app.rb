require_relative "../lib/survivr"
require_relative "../lib/game"
require_relative "../lib/tribe"
require_relative "../lib/contestant"
require_relative "../lib/jury"

@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)

8.times {
		@unlucky_tribe = @borneo.immunity_challenge
		@lucky_tribe = @borneo.tribes.find { |tribe| tribe != @unlucky_tribe}

		@unlucky_contestant = @unlucky_tribe.tribal_council(immune: nil)
		@unlucky_tribe.members.delete(@unlucky_contestant)

		@borneo.clear_tribes
		@borneo.add_tribe(@unlucky_tribe)
		@borneo.add_tribe(@lucky_tribe)
	}

@borneo.tribes.each { |tribe|
	puts "Tribe: #{tribe.name}"
	tribe.members.each { |member| puts "#{member.name}"}
	puts "-------------------------"
}

@merge_tribe = @borneo.merge("Cello")

puts "Tribe: #{@merge_tribe.name}"
@merge_tribe.members.each {|member| puts "#{member.name}"}

3.times {
		@eliminated_contestant = @borneo.individual_immunity_challenge
		@merge_tribe.members.delete(@eliminated_contestant)
	}

puts "Tribe: #{@merge_tribe.name}"
@merge_tribe.members.each {|member| puts "#{member.name}"} 

# @jury = Jury.new
