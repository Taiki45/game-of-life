class Life
	def initialize
		@deadOrAlive = DEAD
	end
	
	attr_reader :deadOrAlive
	
	def die
		@deadOrAlive = DEAD
	end
	
	def born
		@deadOrAlive = ALIVE
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
