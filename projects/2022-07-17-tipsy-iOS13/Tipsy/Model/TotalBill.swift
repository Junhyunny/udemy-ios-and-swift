
struct TotalBill {
    
    var billValue: Double
    var tipRateValue: Double
    var peopleCount: Int
    
    init(billValue: Double = 0.0, tipRateValue: Double = 0.1, peopleCount: Int = 2) {
        self.billValue = billValue
        self.tipRateValue = tipRateValue
        self.peopleCount = peopleCount
    }
    
    func getTotalBill() -> Double {
        return billValue * (1 + tipRateValue) / Double(peopleCount)
    }
    
    func getTipPercentage() -> Int {
        return Int(tipRateValue * 100)
    }
}
