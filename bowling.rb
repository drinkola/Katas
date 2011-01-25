class Bowling
	@pinsPerFrame
	def Score()
		score = 0
		for i in (0..9)
			frameScore = GetFrameScore(i)
			score = score + frameScore
			if (IsSpare(i) == 10)
				score = score + GetSpareBonus(i)
			end
		end
		return score
	end
	
	def Throws(frames)
		@pinsPerFrame = frames.to_s.split("")
	end
	
	def GetFrameScore(frameNum)
		if (@pinsPerFrame[frameNum*2] == 'X')
			return 10
		end
		return @pinsPerFrame[frameNum * 2].to_i + @pinsPerFrame[frameNum * 2 + 1].to_i
	end
	
	def GetSpareBonus(frameNum)
		return @pinsPerFrame[frameNum*2 + 2].to_i
	end
	
	def IsSpare(frameNum)
		return GetFrameScore(frameNum) == 10 && !IsStrike(frameNum)
	end
	
	def IsStrike(frameNum)
		return @pinsPerFrame[frameNum * 2] == 'X'
	end
end