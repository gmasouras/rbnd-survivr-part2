class Contestant

	attr_reader :name

	def initialize(contestant_name)
		@name = contestant_name
	end

	def to_s
		@name
	end
end