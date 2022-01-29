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
    internal var estoCambiara = "sfw/neko"
    var navigationController: UINavigationController?
    let optionArray: [Option] = [Option(title: "Neko", endPoint: "sfw/neko"),
                                 Option(title: "Waifu", endPoint: "sfw/waifu"),
                                 Option(title: "shinobu", endPoint: "sfw/shinobu"),
                                 Option(title: "megumin", endPoint: "sfw/megumin"),
                                 Option(title: "bully", endPoint: "sfw/bully"),
                                 Option(title: "cuddle", endPoint: "sfw/cuddle"),
                                 Option(title: "cry", endPoint: "sfw/cry"),
                                 Option(title: "hug", endPoint: "sfw/hug"),
                                 Option(title: "awoo", endPoint: "sfw/awoo"),
                                 Option(title: "kiss", endPoint: "sfw/kiss"),
                                 Option(title: "lick", endPoint: "sfw/lick"),
                                 Option(title: "pat", endPoint: "sfw/pat"),
                                 Option(title: "smug", endPoint: "sfw/smug"),
                                 Option(title: "bonk", endPoint: "sfw/bonk"),
                                 Option(title: "yeet", endPoint: "sfw/yeet"),
                                 Option(title: "blush", endPoint: "sfw/blush"),
                                 Option(title: "smile", endPoint: "sfw/smile"),
                                 Option(title: "wave", endPoint: "sfw/wave"),
                                 Option(title: "highfive", endPoint: "sfw/highfive"),
                                 Option(title: "nom", endPoint: "sfw/nom"),
                                 Option(title: "bite", endPoint: "sfw/bite"),
                                 Option(title: "handhold", endPoint: "sfw/handhold"),
                                 Option(title: "glomp", endPoint: "sfw/glomp"),
                                 Option(title: "slap", endPoint: "sfw/slap"),
                                 Option(title: "kill", endPoint: "sfw/kill"),
                                 Option(title: "kick", endPoint: "sfw/kick"),
                                 Option(title: "happy", endPoint: "sfw/happy"),
                                 Option(title: "wink", endPoint: "sfw/wink"),
                                 Option(title: "poke", endPoint: "sfw/poke"),
                                 Option(title: "dance", endPoint: "sfw/dance"),
                                 Option(title: "cringe", endPoint: "sfw/cringe"),
    ]
    
    let optionArrayNSFW: [Option] = [Option(title: "waifu", endPoint: "nsfw/waifu"),
                                     Option(title: "neko", endPoint: "nsfw/neko"),
                                     Option(title: "trap", endPoint: "nsfw/trap"),
                                     Option(title: "blowjob", endPoint: "nsfw/blowjob"),
                                     ]
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to happiness ^-^"
        label.textColor = .link
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    //se esta creando una instancia del componente de tipo OptionChoosed y a su vez si utilizas sfw. utilizas la referencia con su OptionChoosed
    private lazy var sfw: OptionChoosed = {
        let button = OptionChoosed(options: optionArray, parent: self)
        button.delegate = self
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //se esta creando una instancia del componente de tipo OptionChoosed y a su vez si utilizas nsfw. utilizas la referencia con su OptionChoosed
    private lazy var nsfw: OptionChoosed = {
        let button = OptionChoosed(options: optionArrayNSFW, parent: self)
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
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(refreshPicture), for: .touchUpInside)
        return button
    }()
    public lazy var activityIndicator: UIActivityIndicatorView = {
       let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = .orange
        return activity
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
        self.backgroundColor = .white
        self.addSubview(welcomeLabel)
        self.addSubview(animeImage)
        self.addSubview(sfw)
        self.addSubview(nsfw)
        self.addSubview(randomButton)
        let gestoTap = UITapGestureRecognizer(target: self, action: #selector(dissmissStack(_:)))
        gestoTap.numberOfTapsRequired = 1
        gestoTap.numberOfTouchesRequired = 1
        self.addGestureRecognizer(gestoTap)
        self.isUserInteractionEnabled = true
        self.addSubview(activityIndicator)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        
    }
    func setConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 80),
            
            
            sfw.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            sfw.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            sfw.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -20),
            sfw.heightAnchor.constraint(equalToConstant: 40),

            nsfw.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            nsfw.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 20),
            nsfw.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            nsfw.heightAnchor.constraint(equalToConstant: 40),
            
            animeImage.topAnchor.constraint(equalTo: sfw.bottomAnchor),
            animeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            animeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            animeImage.heightAnchor.constraint(equalToConstant: 700),
            
            randomButton.topAnchor.constraint(equalTo: animeImage.bottomAnchor),
            randomButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            randomButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            randomButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            randomButton.heightAnchor.constraint(equalToConstant: 40),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
        sfw.setUi(reference: sfw)
        nsfw.setUi(reference: nsfw)
        
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
        activityIndicator.startAnimating()
        self.delegate?.notifyOptionChosed(endPoint: estoCambiara)
    }
    
    @objc func dissmissStack(_ sender: UITapGestureRecognizer){
        nsfw.hiddeWhenTapped()//se utiliza la referencia de nsfw para cambiar las propiedades del alto del stack view
        sfw.hiddeWhenTapped() //se utiliza la referencia de sfw para cambiar las propiedades del alto del stack view
    }
}
extension MainViewUI: OptionChoosenProtocol {
    func didChoiceOption(_ gender: String) {
        estoCambiara = gender
        self.delegate?.notifyOptionChosed(endPoint: gender)
    }
}


