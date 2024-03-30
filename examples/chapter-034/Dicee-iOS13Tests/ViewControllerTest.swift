import XCTest

@testable import Dicee_iOS13

final class ViewControllerTest: XCTestCase {

    let mockRandomGenerator = MockRandomGenerator()
    var sut: ViewController!
    
    override func setUpWithError() throws {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyBoard.instantiateInitialViewController() as? ViewController
        sut.randomGenerator = mockRandomGenerator
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_whenClickRollButton_thenChangeDiceImage() throws {
        let rollButton = sut.rollButton!
        mockRandomGenerator.addIndex(index: 5)
        mockRandomGenerator.addIndex(index: 2)
        mockRandomGenerator.addIndex(index: 0)
        
        
        rollButton.sendActions(for: .touchUpInside)
        
        
        XCTAssertEqual(sut.diceImageViewOne.image, UIImage(named: "DiceSix"))
        XCTAssertEqual(sut.diceImageViewTwo.image, UIImage(named: "DiceThree"))
        XCTAssertEqual(sut.diceImageViewThree.image, UIImage(named: "DiceOne"))
    }
}
