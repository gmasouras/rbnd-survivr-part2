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
@merge_tribe = @borneo.merge("Cello")
@jury = Jury.new







   


