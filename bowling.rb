class Bowling
	@rolls
	def Score()
		score = 0
		for i in (0..9)
			frameScore = GetFrameScore(i)
			score = score + frameScore
			if (IsSpare(i))
				score = score + GetSpareBonus(i)
			end
			if (IsStrike(i))
				score = score + GetStrikeBonus(i)
			end
		end
		return score
	end
	
	def Throws(frames)
		@rolls = frames.to_s.split("")
	end
	
	def GetFrameScore(frameNum)
		score = 0
		if (IsStrike(frameNum))
			score = 10
		else 
			score = @rolls[frameNum * 2].to_i + @rolls[frameNum * 2 + 1].to_i
		end
		if (frameNum == 9 && score == 10)
			score = score + GetFrameScore(10)
		end
		return score
	end
	
	def GetSpareBonus(frameNum)
		score = @rolls[frameNum * 2 + 2]
		if score == 'X'
			return 10
		end
		return score.to_i
	end
	
	def GetStrikeBonus(frameNum)
		frame = @rolls[frameNum * 2 + 2]
		if frame == 'X'
			score = 10
			frame = @rolls[frameNum * 2 + 4]
		else
			score = frame.to_i
			frame = @rolls[frameNum * 2 + 3]
		end
		if frame == 'X'
			score = score + 10
		else
			score = score + frame.to_i
		end
		return score
	end
	
	def IsSpare(frameNum)
		return (GetFrameScore(frameNum) == 10 && !IsStrike(frameNum))
	end
	
	def IsStrike(frameNum)
		return @rolls[frameNum * 2] == 'X'
	end
end