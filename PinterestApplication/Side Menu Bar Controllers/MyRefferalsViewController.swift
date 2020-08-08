//
//  MyRefferalsViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class MyRefferalsViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var refferalcode: UILabel!
    @IBOutlet weak var filed: UITextField!
    
    let cornerRadius: CGFloat = 6.0
    
    fileprivate func CustomNavBar(){
        filed.attributedPlaceholder = NSAttributedString(string: "Enter Code", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        title = "My Referrals"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 41/255, blue: 122/255, alpha: 1)
    }
    
    fileprivate func CustomizeView(){
        myView.layer.shadowColor    = UIColor.gray.cgColor
        myView.layer.shadowOffset   = CGSize(width: 0, height: 1.0)
        myView.layer.shadowOpacity  = 0.5
        myView.layer.shadowRadius   = 2.0
        myView.layer.cornerRadius   = cornerRadius
        myView.layer.masksToBounds  = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.refferalcode.text = KeychainWrapper.standard.string(forKey: "refferalCode")
        CustomNavBar()
        CustomizeView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func share(_ sender: Any){
        let code = self.refferalcode.text
        let image = #imageLiteral(resourceName: "bulls point")
        let shares = [code, image] as [Any]
        let activityVC = UIActivityViewController(activityItems: shares, applicationActivities: nil)
               activityVC.popoverPresentationController?.sourceView = self.view
               self.present(activityVC, animated: true, completion: nil)
               print("hurray !!!!!!")
    }
}
