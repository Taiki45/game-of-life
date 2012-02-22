class Earth
	def initialize(fieldSize)
		@@generation = 1
		@size = fieldSize
		@field = Array.new(fieldSize) { Array.new(fieldSize) { Life.new } }
	end
	
	attr_reader :size
	
	def length
		@field.length * @field.length
	end
	
	def stepGeneration
		@@geberation += 1
	end
	
	def nowGeneration?
		return @@generation
	end
	
	def deadOrAlive?(row, colum)
		return @field[row][colum].deadOrAlive?
	end
	
	def born(row, colum)
		@field[row][colum].born
		return true
	end
end