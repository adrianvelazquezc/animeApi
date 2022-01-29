//
//  MainViewUI.swift
//  animeProgramatically
//
//  Created by Mac on 27/01/22.
//

import Foundation
import UIKit

protocol MainViewUIDelegate {
    func notifyOptionChosed(endPoint: String)
}

class MainViewUI: UIView{
    var delegate: MainViewUIDelegate?
    internal var tryImage = ""
    internal var estoCambiara = "neko"
    var navigationController: UINavigationController?
    let optionArray: [Option] = [Option(title: "Neko", endPoint: "neko"),
                                 Option(title: "Waifu", endPoint: "waifu"),
                                 Option(title: "shinobu", endPoint: "shinobu"),
                                 Option(title: "megumin", endPoint: "megumin"),
                                 Option(title: "bully", endPoint: "bully"),
                                 Option(title: "cuddle", endPoint: "cuddle"),
                                 Option(title: "cry", endPoint: "cry"),
                                 Option(title: "hug", endPoint: "hug"),
                                 Option(title: "awoo", endPoint: "awoo"),
                                 Option(title: "kiss", endPoint: "kiss"),
                                 Option(title: "lick", endPoint: "lick"),
                                 Option(title: "pat", endPoint: "pat"),
                                 Option(title: "smug", endPoint: "smug"),
                                 Option(title: "bonk", endPoint: "bonk"),
                                 Option(title: "yeet", endPoint: "yeet"),
                                 Option(title: "blush", endPoint: "blush"),
                                 Option(title: "smile", endPoint: "smile"),
                                 Option(title: "wave", endPoint: "wave"),
                                 Option(title: "highfive", endPoint: "highfive"),
                                 Option(title: "nom", endPoint: "nom"),
                                 Option(title: "bite", endPoint: "bite"),
                                 Option(title: "handhold", endPoint: "handhold"),
                                 Option(title: "glomp", endPoint: "glomp"),
                                 Option(title: "slap", endPoint: "slap"),
                                 Option(title: "kill", endPoint: "kill"),
                                 Option(title: "kick", endPoint: "kick"),
                                 Option(title: "happy", endPoint: "happy"),
                                 Option(title: "wink", endPoint: "wink"),
                                 Option(title: "poke", endPoint: "poke"),
                                 Option(title: "dance", endPoint: "dance"),
                                 Option(title: "cringe", endPoint: "cringe"),
                                 
    ]
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to suffering ^-^"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    //se esta creando una instancia del componente de tipo OptionChoosed
    private lazy var asdasdas: OptionChoosed = {
        let button = OptionChoosed(options: optionArray, parent: self)
        button.delegate = self
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var animeImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private lazy var randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Refresh", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(refreshPicture), for: .touchUpInside)
        return button
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: MainViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            setUI()
            setConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        self.backgroundColor = .gray
        self.addSubview(welcomeLabel)
        self.addSubview(animeImage)
        self.addSubview(asdasdas)
        self.addSubview(randomButton)
    }
    func setConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: self.topAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 80),
            
            
            asdasdas.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            asdasdas.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            asdasdas.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            asdasdas.heightAnchor.constraint(equalToConstant: 40),
            
            animeImage.topAnchor.constraint(equalTo: asdasdas.bottomAnchor),
            animeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            animeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            animeImage.heightAnchor.constraint(equalToConstant: 400),
            
            randomButton.topAnchor.constraint(equalTo: animeImage.bottomAnchor),
            randomButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            randomButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            randomButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        asdasdas.setUi(reference: asdasdas)
        
//        if let url = URL(string: "https://i.waifu.pics/n-Avxt-.jpg"){
//            if let data = try? Data(contentsOf: url) {
//                DispatchQueue.main.async {
//                    self.animeImage.image = UIImage(data: data)
//                }
//            }
//        }
        // fin imagen
    }
    @objc private func refreshPicture(){
        print(estoCambiara)
        self.delegate?.notifyOptionChosed(endPoint: estoCambiara)
    }
}
extension MainViewUI: OptionChoosenProtocol {
    func didChoiceOption(_ gender: String) {
        print(gender)
        estoCambiara = gender
        print(estoCambiara)
        self.delegate?.notifyOptionChosed(endPoint: gender)
    }
}


