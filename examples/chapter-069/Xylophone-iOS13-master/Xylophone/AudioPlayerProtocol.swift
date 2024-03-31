import AVFoundation

protocol AudioPlayerProtocol {
    func play(resourceName: String)
}

class DefaultAudioPlayer: AudioPlayerProtocol {
    
    func play(resourceName: String) {
        guard let path = Bundle.main.path(forResource: resourceName, ofType:"wav") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

class MockAudioPlayer: AudioPlayerProtocol {
    
    var resourceName: String = ""
    
    func play(resourceName: String) {
        self.resourceName = resourceName
    }
}
