//
//  ViewController.swift
//  PomodoroTimer
//
//  Created by Malik Em on 27.02.2023.
//

import UIKit

class TimerViewController: UIViewController {
    
    let segmentedControl = UISegmentedControl(items: ["Work", "Short break", "Long break"])
    let label = UILabel()
    let timerView = TimerView()
    let playButton = UIButton(type: .system)
    
    var timer = Timer()
    var timerStarted = false
    var time = 1500
    var secondsPassed = 0
  
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
    }
    
    private func layout() {
        view.addSubview(segmentedControl)
        view.addSubview(label)
        view.addSubview(timerView)
        view.addSubview(playButton)

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
    }
}

extension TimerViewController {
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1)))
            
        case 1:
            view.backgroundColor = UIColor((#colorLiteral(red: 0.7137254902, green: 0.8862745098, blue: 0.631372549, alpha: 1)))
        default:
            view.backgroundColor = UIColor((#colorLiteral(red: 0.5254901961, green: 0.6392156863, blue: 0.7215686275, alpha: 1)))
        }
    }
}

extension TimerViewController {
    @objc private func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        playButton.setTitle("STOP", for: .normal)
    }
    
    @objc func updateTimer() {
        if secondsPassed < time {
            time -= 1
            timerView.timerLabel.text = formatTime()
            secondsPassed += 1
            timerView.progressView.progress = Float(secondsPassed)/Float(time)
        } else {
            timer.invalidate()
        }

    }
    
    func formatTime() -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}
