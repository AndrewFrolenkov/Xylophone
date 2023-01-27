//
//  ViewController.swift
//  Xylophone
//
//  Created by Андрей Фроленков on 22.01.23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: audioPlayer
    var player: AVAudioPlayer?
    
    let stackForView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    
    // MARK: View
    let firstView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let secondView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let thirdView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let fourthView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let fifthView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let sixthView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let seventhView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: Button
    lazy var firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = self.configButton("C", 40)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = self.configButton("D", 40)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var thirdButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = self.configButton("E", 40)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var fourthButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = self.configButton("F", 40)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var fifthButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = self.configButton("G", 40)
        button.backgroundColor = .systemIndigo
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var sixthButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = self.configButton("A", 40)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var seventhButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = self.configButton("B", 40)
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviewForView()
        setConstraints()
    }
    
    // MARK: Action For Buttons
    @objc func keyPressed(_ sender: UIButton) {
        
        guard let label = sender.titleLabel,
              let text = label.text else { return }
        
        playSound(text)
        
        print("Пуск")
        sender.layer.opacity = 0.5
    
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(20)) {
            print("Конец")
            sender.layer.opacity = 1
        }
        
    }
    
    // MARK: play Sound
    func playSound(_ soundName: String) {
        
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // MARK: Subview
    // Add Subview For View
    private func addSubviewForView() {
        
        self.view.addSubview(stackForView)
        self.firstView.addSubview(firstButton)
        self.secondView.addSubview(secondButton)
        self.thirdView.addSubview(thirdButton)
        self.fourthView.addSubview(fourthButton)
        self.fifthView.addSubview(fifthButton)
        self.sixthView.addSubview(sixthButton)
        self.seventhView.addSubview(seventhButton)
        
        // StackView
        addViewForStackView()
        
    }
    
    // Add View For StackView
    private func addViewForStackView() {
        
        stackForView.addArrangedSubview(firstView)
        stackForView.addArrangedSubview(secondView)
        stackForView.addArrangedSubview(thirdView)
        stackForView.addArrangedSubview(fourthView)
        stackForView.addArrangedSubview(fifthView)
        stackForView.addArrangedSubview(sixthView)
        stackForView.addArrangedSubview(seventhView)
    }
    
    // ConstraintsForElements
    private func setConstraints() {
        
        //  For Stack
        NSLayoutConstraint.activate([
            stackForView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stackForView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            stackForView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stackForView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        //  For firstButton in firstView
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: firstView.topAnchor),
            firstButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 5),
            firstButton.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -5),
            firstButton.bottomAnchor.constraint(equalTo: firstView.bottomAnchor)
        ])
        
        //  For secondButton in secondView
        NSLayoutConstraint.activate([
            secondButton.topAnchor.constraint(equalTo: secondView.topAnchor),
            secondButton.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 10),
            secondButton.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -10),
            secondButton.bottomAnchor.constraint(equalTo: secondView.bottomAnchor)
        ])
        
        //  For thirdButton in thirdView
        NSLayoutConstraint.activate([
            thirdButton.topAnchor.constraint(equalTo: thirdView.topAnchor),
            thirdButton.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor, constant: 15),
            thirdButton.trailingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: -15),
            thirdButton.bottomAnchor.constraint(equalTo: thirdView.bottomAnchor)
        ])
        
        // For fourthButton in fourthView
        NSLayoutConstraint.activate([
            fourthButton.topAnchor.constraint(equalTo: fourthView.topAnchor),
            fourthButton.leadingAnchor.constraint(equalTo: fourthView.leadingAnchor, constant: 25),
            fourthButton.trailingAnchor.constraint(equalTo: fourthView.trailingAnchor, constant: -25),
            fourthButton.bottomAnchor.constraint(equalTo: fourthView.bottomAnchor)
            
        ])
        
        // For fifthButton in fifthView
        NSLayoutConstraint.activate([
            fifthButton.topAnchor.constraint(equalTo: fifthView.topAnchor),
            fifthButton.leadingAnchor.constraint(equalTo: fifthView.leadingAnchor, constant: 30),
            fifthButton.trailingAnchor.constraint(equalTo: fifthView.trailingAnchor, constant: -30),
            fifthButton.bottomAnchor.constraint(equalTo: fifthView.bottomAnchor)
            
        ])
        
        // For sixthButton in sixthView
        NSLayoutConstraint.activate([
            sixthButton.topAnchor.constraint(equalTo: sixthView.topAnchor),
            sixthButton.leadingAnchor.constraint(equalTo: sixthView.leadingAnchor, constant: 35),
            sixthButton.trailingAnchor.constraint(equalTo: sixthView.trailingAnchor, constant: -35),
            sixthButton.bottomAnchor.constraint(equalTo: sixthView.bottomAnchor)
            
        ])
        
        // For seventhButton in seventhView
        NSLayoutConstraint.activate([
            seventhButton.topAnchor.constraint(equalTo: seventhView.topAnchor),
            seventhButton.leadingAnchor.constraint(equalTo: seventhView.leadingAnchor, constant: 40),
            seventhButton.trailingAnchor.constraint(equalTo: seventhView.trailingAnchor, constant: -40),
            seventhButton.bottomAnchor.constraint(equalTo: seventhView.bottomAnchor)
            
        ])
    }
}

extension ViewController {
    
    private func configButton(_ title: String, _ ofSize: CGFloat ) -> UIButton.Configuration {
        
        var configButton = UIButton.Configuration.plain()
        configButton.title = title
        configButton.attributedTitle?.font = .systemFont(ofSize: ofSize)
        configButton.attributedTitle?.foregroundColor = .white
        
        return configButton
        
    }
}
