class Tribe

	attr_reader :name, :members

	def initialize(tribe)
		@name = tribe[:name]
		@members = tribe[:members]
		puts tribe
	end

	def to_s
		@name
	end

	def tribal_council(contestant)
		@members_to_go = @members.select { |member| member != contestant[:immune]}
		return @members_to_go.sample
	end

	def print_tribe
		puts "Tribe: "+"#{name}".blue
		members.each_with_index {|member, index|
			puts "#{index+1}. " + "#{member}"
		}
	end
end