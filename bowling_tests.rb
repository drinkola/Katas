require 'test/unit'
require 'bowling.rb'
require 'test/unit/ui/console/testrunner'

class TC_MyTest < Test::Unit::TestCase

        def tet_ShouldReturnScoreZero()
			bowling = Bowling.new
            assert_equal(bowling.Score, 0, 'Null Score')
        end
		
		def test_AllGutterBallsShouldReturnCorrectScore()
			bowling = Bowling.new
			bowling.Throws('00000000000000000000')
			assert_equal(bowling.Score, 0, 'All Gutter Balls')
		end
		
		def test_NoSparesShouldReturnCorrectScore()
			bowling = Bowling.new
			bowling.Throws('01010101010101010101')
			assert_equal(bowling.Score, 10, 'No Spares')
		end
		
		def test_SparesShouldCountNextFrame()
			bowling = Bowling.new
			bowling.Throws('46500000000000000000')
			assert_equal(20, bowling.Score, 'One Spare')
		end
		
		def test_StrikeShouldCountNext2Frames()
			bowling = Bowling.new
			bowling.Throws('X0540000000000000000')
			assert_equal(28, bowling.Score, 'Strike')
		end
		
		def test_AllStrikesPerfectGame()
			bowling = Bowling.new
			bowling.Throws('X0X0X0X0X0X0X0X0X0XXX')
			assert_equal(300, bowling.Score, 'Perfect Game')
		end
end

Test::Unit::UI::Console::TestRunner.run(TC_MyTest)