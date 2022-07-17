import UIKit

class CalculateViewController: UIViewController {

    var totalBill: TotalBill?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalBill!.getTotalBill())
        settingsLabel.text = "Split between \(totalBill!.peopleCount) people, with \(totalBill!.getTipPercentage())% tip"
    }

    @IBAction func pressedRecalculate(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
