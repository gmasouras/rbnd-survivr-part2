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
end