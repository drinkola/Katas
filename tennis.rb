class Tennis
	@scoreA
	@scoreB
	@setA
	@setB
	
	def initialize()
		@scoreA = 0
		@scoreB = 0
		@setA = 0
		@setB = 0
	end
	
	def Score()
		return GetSetScore() + " | " + GetGameScore()
	end
	
	def GetSetScore()
		return @setA.to_s + " " + @setB.to_s
	end
	
	def GetGameScore()
		if IsDeuce()
			return "Deuce"
		end
		advantage = Advantage()
		if (advantage > 0)
			return "Advantage Player " + advantage.to_s
		end
		return GetPointScore(@scoreA) + " " + GetPointScore(@scoreB)
	end
	
	def GetPointScore(score)
		if (score == 1)
			return "15"
		end
		if (score == 2)
			return "30"
		end 
		if (score == 3)
			return "40"
		end
		return score.to_s
	end
	
	def GivePlayer1APoint()
		@scoreA = @scoreA + 1
		CalculateScore()
	end
	
	def GivePlayer2APoint()
		@scoreB = @scoreB + 1
		CalculateScore()
	end
	
	def CalculateScore()
		if (@scoreA > @scoreB + 1 && @scoreA > 3)
			@setA = @setA + 1
			@scoreA = 0
			@scoreB = 0
		end
		if (@scoreB > @scoreA + 1 && @scoreB > 3)
			@setB = @setB + 1
			@scoreA = 0
			@scoreB = 0
		end
	end
	
	def IsDeuce()
		return @scoreA == @scoreB && @scoreA > 2
	end
	
	def Advantage()
		if (@scoreA > @scoreB && @scoreB > 2)
			return 1
		end
		if (@scoreB > @scoreA && @scoreA > 2)
			return 2
		end
		return 0
	end
	
	
end