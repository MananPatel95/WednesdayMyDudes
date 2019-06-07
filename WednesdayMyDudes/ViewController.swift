//
//  ViewController.swift
//  WednesdayMyDudes
//
//  Created by Manan on 2019-06-06.
//  Copyright © 2019 Manan Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // TO-DO: Remove ! if I get time
    var pulseLayer: CAShapeLayer!
    
    let calendar = Calendar.autoupdatingCurrent
    
    let btn: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 100))
        btn.tintColor = .white
        btn.backgroundColor = .red
        btn.setTitle("What day is it today?", for: .normal)
        btn.titleLabel?.numberOfLines = 0
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 16
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        btn.titleLabel?.textAlignment = .center
        return btn
    }()
    
    let notImg: UIImageView = {
        let iv = UIImageView()
        iv.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 400))
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let backImg: UIImageView = {
        let iv = UIImageView()
        iv.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 400))
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        btn.center = view.center
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnclick), for: .touchUpInside)
        
        backImg.frame = CGRect(origin: .zero, size: .init(width: view.bounds.width, height: view.bounds.height))
        backImg.loadGif(asset: "background")
        backImg.isHidden = true
        view.addSubview(backImg)
        
        notImg.center = view.center
        view.isUserInteractionEnabled = true
        view.addSubview(notImg)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:))))
    }
    
    @objc func btnclick(){
        let day = calendar.component(.day, from: Date())
        if day == 4 {
            btn.setTitle("It is Wednesday, my dudes", for: .normal)
        } else {
            view.backgroundColor = .white
            notImg.image = #imageLiteral(resourceName: "not")
            btn.isHidden = true

        }
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer){
        //let day = calendar.component(.day, from: Date())
        let day = Int.random(in: 0...5)
        if day == 4 {
            startAnimation()
            print("Wednesday")
        } else {
            view.backgroundColor = .white
            notImg.image = UIImage(named: "not")
            backImg.isHidden = true
            view.reloadInputViews()
            
            print("Not Wednesday")
        }
    }
    
    func startAnimation(){
        notImg.loadGif(asset: "hypno")
        notImg.reloadInputViews()
        
        backImg.isHidden = false
    }
}

