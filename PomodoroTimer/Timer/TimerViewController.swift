//
//  ViewController.swift
//  PomodoroTimer
//
//  Created by Malik Em on 27.02.2023.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController {
    
    let segmentedControl = UISegmentedControl(items: ["Work", "Short break", "Long break"])
    let label = UILabel()
    let timerView = TimerView()
    let playButton = UIButton(type: .system)
    let stopButton = UIButton(type: .system)
    
    var timer = Timer()
    var timerStarted = false
    let timeArray = [1500, 300, 900]
    var secondsPassed = 0
    var timeOne = 1500
    var timeTwo = 1500
    
    var player: AVAudioPlayer?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension TimerViewController {
    private func style() {
        view.backgroundColor = UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1)))
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 9
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.masksToBounds = true
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.tintColor = UIColor.white
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Time to focus!"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        
        timerView.translatesAutoresizingMaskIntoConstraints = false
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setTitle("START", for: .normal)
        playButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        playButton.setTitleColor(UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1))), for: .normal)
        playButton.backgroundColor = .white
        playButton.layer.masksToBounds = true
        playButton.layer.cornerRadius = 10
        playButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.setTitle("STOP", for: .normal)
        stopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        stopButton.setTitleColor(UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1))), for: .normal)
        stopButton.backgroundColor = .white
        stopButton.layer.masksToBounds = true
        stopButton.layer.cornerRadius = 10
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(segmentedControl)
        view.addSubview(label)
        view.addSubview(timerView)
        view.addSubview(playButton)
        view.addSubview(stopButton)

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            segmentedControl.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: segmentedControl.trailingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 4),
            label.bottomAnchor.constraint(equalTo: timerView.topAnchor, constant: -32)
        ])

        NSLayoutConstraint.activate([
            timerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: timerView.trailingAnchor, multiplier: 2),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalToSystemSpacingBelow: timerView.bottomAnchor, multiplier: 4),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            playButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            stopButton.topAnchor.constraint(equalToSystemSpacingBelow: playButton.bottomAnchor, multiplier: 2),
            stopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            stopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            stopButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension TimerViewController {
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            timer.invalidate()
            view.backgroundColor = UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1)))
            zeroValueChanged()
            timeOne = timeArray[0]
            timeTwo = timeArray[0]
            secondsPassed = 0
        case 1:
            timer.invalidate()
            view.backgroundColor = UIColor((#colorLiteral(red: 0.5764705882, green: 0.6078431373, blue: 0.3843137255, alpha: 1)))
            firstValueChanged()
            timeOne = timeArray[1]
            timeTwo = timeArray[1]
            secondsPassed = 0
        default:
            timer.invalidate()
            view.backgroundColor = UIColor((#colorLiteral(red: 0.5254901961, green: 0.6392156863, blue: 0.7215686275, alpha: 1)))
            secondValueChanged()
            timeOne = timeArray[2]
            timeTwo = timeArray[2]
            secondsPassed = 0
        }
    }
    
    private func zeroValueChanged() {
        timerView.timerLabel.text = "25:00"
        label.text = "Time to focus!"
        playButton.setTitleColor(UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1))), for: .normal)
        stopButton.setTitleColor(UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1))), for: .normal)
        timerView.progressView.progress = 0.0
    }
    
    private func firstValueChanged() {
        timerView.timerLabel.text = "05:00"
        label.text = "Time to short relax!"
        playButton.setTitleColor(UIColor((#colorLiteral(red: 0.5764705882, green: 0.6078431373, blue: 0.3843137255, alpha: 1))), for: .normal)
        stopButton.setTitleColor(UIColor((#colorLiteral(red: 0.5764705882, green: 0.6078431373, blue: 0.3843137255, alpha: 1))), for: .normal)
        timerView.progressView.progress = 0.0
    }
    
    private func secondValueChanged() {
        timerView.timerLabel.text = "15:00"
        label.text = "Time to long relax!"
        playButton.setTitleColor(UIColor((#colorLiteral(red: 0.5254901961, green: 0.6392156863, blue: 0.7215686275, alpha: 1))), for: .normal)
        stopButton.setTitleColor(UIColor((#colorLiteral(red: 0.5254901961, green: 0.6392156863, blue: 0.7215686275, alpha: 1))), for: .normal)
        timerView.progressView.progress = 0.0
    }
}

extension TimerViewController {
    @objc private func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)     
    }
    
    @objc private func updateTimer() {
        timeOne -= 1
        timerView.timerLabel.text = formatTime()
        secondsPassed += 1
        timerView.progressView.progress = Float(secondsPassed)/Float(timeTwo)
        
        if timeOne == 0 {
            timer.invalidate()
            playSound()
        }
    }

    private func formatTime() -> String {
        let minutes = Int(timeOne) / 60 % 60
        let seconds = Int(timeOne) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    private func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    @objc private func stopTimer() {
        timer.invalidate()
    }
}
