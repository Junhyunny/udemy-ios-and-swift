import UIKit

class ViewController: UIViewController {
    
    private final let diceArray: [UIImage] = [
        UIImage(imageLiteralResourceName: "DiceOne"),
        UIImage(imageLiteralResourceName: "DiceTwo"),
        UIImage(imageLiteralResourceName: "DiceThree"),
        UIImage(imageLiteralResourceName: "DiceFour"),
        UIImage(imageLiteralResourceName: "DiceFive"),
        UIImage(imageLiteralResourceName: "DiceSix")
    ]
    var randomGenerator: RandomGenerator! = DefaultRandomGenerator()
    
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    @IBOutlet weak var diceImageViewThree: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    // View 로드 후 별도 작업이 없다면 viewDidLoad 메소드 호출 생략이 가능하다.
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    deinit {
        print("ViewController is being deinitialized")
    }
    
    @IBAction func clickRollButton(_ sender: UIButton) {
        diceImageViewOne.image = diceArray[randomGenerator.getRandomIndex()]
        diceImageViewTwo.image = diceArray[randomGenerator.getRandomIndex()]
        diceImageViewThree.image = diceArray[randomGenerator.getRandomIndex()]
    }
}
