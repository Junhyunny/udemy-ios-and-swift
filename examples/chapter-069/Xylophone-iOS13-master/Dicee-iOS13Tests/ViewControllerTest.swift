import XCTest

@testable import Xylophone

final class ViewControllerTest: XCTestCase {

    var sut: ViewController!
    var mockAudioPlayer: MockAudioPlayer!
    
    override func setUpWithError() throws {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyBoard.instantiateInitialViewController() as? ViewController
        mockAudioPlayer = MockAudioPlayer()
        sut.player = mockAudioPlayer
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_whenPressKey_thenPlaySound() throws {

        let uiButton = UIButton()
        uiButton.setTitle("C", for: .normal)
        
        
        sut.pressKey(uiButton)
        
        
        XCTAssertEqual("C", mockAudioPlayer.resourceName)
    }
    
    func test_whenPressEachKey_thenPlaySound() throws {
        let testCases = [
            (button: sut.cButton, expectedResult: "C"),
            (button: sut.dButton, expectedResult: "D"),
            (button: sut.eButton, expectedResult: "E"),
            (button: sut.fButton, expectedResult: "F"),
            (button: sut.gButton, expectedResult: "G"),
            (button: sut.aButton, expectedResult: "A"),
            (button: sut.bButton, expectedResult: "B"),
        ]
        
        for (button, expectedResult) in testCases {
    
            button?.sendActions(for: .touchUpInside)
            
        
            XCTAssertEqual(expectedResult, mockAudioPlayer.resourceName)
        }
    }
}
