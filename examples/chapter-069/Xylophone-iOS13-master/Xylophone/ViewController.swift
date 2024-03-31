import UIKit

class ViewController: UIViewController {
    
    var player: AudioPlayerProtocol = DefaultAudioPlayer()
    
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var fButton: UIButton!
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressKey(_ sender: UIButton) {
        guard let titleText = sender.titleLabel?.text else { return }
        player.play(resourceName: titleText)
    }
}
