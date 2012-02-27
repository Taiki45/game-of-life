class Life
	def initialize(condition)
		@deadOrAlive = condition
	end
	
	attr_reader :deadOrAlive
	
	def die
		@deadOrAlive = DEAD
		true
	end
	
	def born
		@deadOrAlive = ALIVE
		true
	end
	
	def dead?
		return true if @deadOrAlive == DEAD
		false
	end
	
	def alive?
		return true if @deadOrAlive == ALIVE
		false
	end
	
	def deadOrAlive?
		return DEAD if @deadOrAlive == DEAD
		ALIVE
	end
end
