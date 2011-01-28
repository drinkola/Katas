require 'test/unit'
require 'tennis.rb'
require 'test/unit/ui/console/testrunner'

class TC_MyTest < Test::Unit::TestCase

	def test_ShouldReturnCorrectScoreBeforeGameStarts()
		tennis = Tennis.new
		assert_equal("0 0 | 0 0", tennis.Score, "Before Game Starts")
	end
	
	def test_Player1ScoresAPoint()
		tennis = Tennis.new
		tennis.GivePlayer1APoint()
		assert_equal("0 0 | 15 0", tennis.Score, "Player 1 scores")
	end
	
	def test_BothPlayersScoreAPoint()
		tennis = Tennis.new
		tennis.GivePlayer1APoint()
		tennis.GivePlayer2APoint()
		assert_equal("0 0 | 15 15", tennis.Score, "Both Players score")
	end
	
	def test_ScoreIsDeuce()
		tennis = Tennis.new
		tennis.GivePlayer1APoint()
		tennis.GivePlayer1APoint()
		tennis.GivePlayer1APoint()
		tennis.GivePlayer2APoint()
		tennis.GivePlayer2APoint()
		tennis.GivePlayer2APoint()
		assert_equal("0 0 | Deuce", tennis.Score, "Deuce")
	end
	
	def test_ScoreIsAdPlayer1()
		tennis = Tennis.new
		tennis.GivePlayer1APoint()
		tennis.GivePlayer1APoint()
		tennis.GivePlayer1APoint()
		tennis.GivePlayer2APoint()
		tennis.GivePlayer2APoint()
		tennis.GivePlayer2APoint()
		tennis.GivePlayer1APoint()
		assert_equal("0 0 | Advantage Player 1", tennis.Score, "Ad P1")
	end
	
	def test_ScoreIsAdPlayer2()
		tennis = Tennis.new
		tennis.GivePlayer1APoint()
		tennis.GivePlayer1APoint()
		tennis.GivePlayer1APoint()
		tennis.GivePlayer2APoint()
		tennis.GivePlayer2APoint()
		tennis.GivePlayer2APoint()
		tennis.GivePlayer2APoint()
		assert_equal("0 0 | Advantage Player 2", tennis.Score, "Ad P2")
	end
	
	def test_Player1WinsGame()
		tennis = Tennis.new
		tennis.GivePlayer1APoint()
		tennis.GivePlayer1APoint()
		tennis.GivePlayer1APoint()
		tennis.GivePlayer1APoint()
		assert_equal("1 0 | 0 0", tennis.Score, "Player 1 Wins")
	end
	
	def test_Player2WinsGame()
		tennis = Tennis.new
		tennis.GivePlayer2APoint()
		tennis.GivePlayer2APoint()
		tennis.GivePlayer2APoint()
		tennis.GivePlayer2APoint()
		assert_equal("0 1 | 0 0", tennis.Score, "Player 2 Wins")
	end
	
	
end