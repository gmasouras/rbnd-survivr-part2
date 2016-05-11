require_relative "../lib/contestant"
require_relative "../lib/jury"
require_relative "../lib/tribe"

@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }
@coyopa = Tribe.new({name: "Pagong", members: @contestants.shift(10)})
@hunapu = Tribe.new({name: "Tagi", members: @contestants.shift(10)})

immune = @coyopa.members.first
immune_array = Array.new(9, immune)

p @coyopa.tribal_council(immune: immune)

p @coyopa.members

# 9.times do
#     result = @coyopa.tribal_council(immune: immune)
#     p result
#     if  result.class == Contestant && result != immune
#        immune_array.pop
#     end
#   end

   


