//
//  RecordSoundsViewController.swift
//  Week1
//
//  Created by 한용진 on 2017. 1. 7..
//  Copyright © 2017년 DalnaraCrater. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var record: UIButton!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var stop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        state.text = "Press Record Button"
        stop.isEnabled = false
        record.isEnabled = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        state.text = "Start record"
//    }


    @IBAction func recordAudio(_ sender: Any) {
        
        state.text = "recording now"
        record.isEnabled = false
        stop.isEnabled = true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopRecord(_ sender: Any) {
        state.text = "Press Record Button"
        record.isEnabled = true
        stop.isEnabled = false
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recoder : AVAudioRecorder, successfully flag : Bool){
        
//        if flag {
//            performSegue(withIdentifier: "stopRecording", sender : audioRecorder.url)
//        }
//        else{
//            print("recording was not succeed")
//        }
    }
    
    // MARK: setting URL. By sending url, we can explore the directory.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let playSoundsVC = segue.destination as! PlaySoundsViewController
//        let recordedAudioURL = sender as! URL
//        playSoundsVC.recordedAudioURL = recordedAudioURL
//        
    }
    
}

