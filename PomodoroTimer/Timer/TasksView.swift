//
//  TasksView.swift
//  PomodoroTimer
//
//  Created by Malik Em on 02.03.2023.
//

import UIKit

class TasksView: UIView {
    
    let segmentedControl = UISegmentedControl(items: ["Work", "Short break", "Long break"])
    let label = UILabel()
    let timerView = TimerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TasksView {
    private func style() {
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
    }
    
    private func layout() {
        addSubview(segmentedControl)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 2),
            
        ])
    }
}

extension TasksView {
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            backgroundColor = UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1)))
            zeroValueChanged()

        case 1:
            backgroundColor = UIColor((#colorLiteral(red: 0.5764705882, green: 0.6078431373, blue: 0.3843137255, alpha: 1)))
            firstValueChanged()

        default:
            backgroundColor = UIColor((#colorLiteral(red: 0.5254901961, green: 0.6392156863, blue: 0.7215686275, alpha: 1)))
            secondValueChanged()
        }
    }
    
    private func zeroValueChanged() {
        timerView.timerLabel.text = "25:00"
        label.text = "Time to focus!"
//        playButton.setTitleColor(UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1))), for: .normal)
//        stopButton.setTitleColor(UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1))), for: .normal)
        timerView.progressView.progress = 0.0
    }
    
    private func firstValueChanged() {
        timerView.timerLabel.text = "05:00"
        label.text = "Time to short relax!"
//        playButton.setTitleColor(UIColor((#colorLiteral(red: 0.5764705882, green: 0.6078431373, blue: 0.3843137255, alpha: 1))), for: .normal)
//        stopButton.setTitleColor(UIColor((#colorLiteral(red: 0.5764705882, green: 0.6078431373, blue: 0.3843137255, alpha: 1))), for: .normal)
        timerView.progressView.progress = 0.0
    }
    
    private func secondValueChanged() {
        timerView.timerLabel.text = "15:00"
        label.text = "Time to long relax!"
//        playButton.setTitleColor(UIColor((#colorLiteral(red: 0.5254901961, green: 0.6392156863, blue: 0.7215686275, alpha: 1))), for: .normal)
//        stopButton.setTitleColor(UIColor((#colorLiteral(red: 0.5254901961, green: 0.6392156863, blue: 0.7215686275, alpha: 1))), for: .normal)
        timerView.progressView.progress = 0.0
    }
}
