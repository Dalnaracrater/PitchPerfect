//
//  PlaySoundsViewController.swift
//  Week1
//
//  Created by 한용진 on 2017. 1. 8..
//  Copyright © 2017년 DalnaraCrater. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    
    
    // MARK: Outlets
    
    @IBOutlet weak var speedAudioButton: UIButton!
    @IBOutlet weak var pitchAudioButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    var recordedAudioURL: URL!  //setupAudio()에서 url을 받아 재생할 오디오 결정함.
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    var soundsRate : Float = 0.5
    var soundsPitch : Float = 1000
    
    enum ButtonType: Int {
        case speed = 0, pitch, echo, reverb
    }
    
    // MARK: Actions
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
//        switch(ButtonType(rawValue: sender.tag)!) {
//        case .speed:
//            playSound(rate: soundsRate)
//        case .pitch:
//            playSound(pitch: soundsPitch)
//        case .echo:
//            playSound(echo: true)
//        case .reverb:
//            playSound(reverb: true)
//        }
//        
//        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop Audio Button Pressed")
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
