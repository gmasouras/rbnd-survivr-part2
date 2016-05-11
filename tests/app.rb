require_relative "../lib/contestant"
require_relative "../lib/jury"
require_relative "../lib/tribe"
require_relative "../lib/game"

@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }
@coyopa = Tribe.new({name: "Pagong", members: @contestants.shift(10)})
@hunapu = Tribe.new({name: "Tagi", members: @contestants.shift(10)})
@borneo = Game.new(@coyopa, @hunapu)

p @borneo.merge("combined_tribe")

   


