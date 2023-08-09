//  Day64.swift
//  8/8/23


import SwiftUI
import AVKit


class SoundManager{
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound(){
        
        guard let url = Bundle.main.url(forResource: "notification", withExtension: ".mp3") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }
        catch let error{
            print("Error playing sound \(error.localizedDescription)")
        }
    }
}

struct Day64: View {
    
    
    var body: some View {
        VStack{
            Button("Notification"){
                SoundManager.instance.playSound()
            }.buttonStyle(.bordered)
                .tint(.orange)
        }
    }
}

struct Day64_Previews: PreviewProvider {
    static var previews: some View {
        Day64()
    }
}
