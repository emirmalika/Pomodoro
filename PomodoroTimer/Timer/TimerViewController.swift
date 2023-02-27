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
        
        timerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(segmentedControl)
        view.addSubview(label)
        view.addSubview(timerView)

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            segmentedControl.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: segmentedControl.trailingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalToSystemSpacingBelow: segmentedControl.bottomAnchor, multiplier: 4),
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 4)
        ])
        
        NSLayoutConstraint.activate([
            timerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: timerView.trailingAnchor, multiplier: 1),
            timerView.heightAnchor.constraint(equalToConstant: 300)
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
