//
//  HelpViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 18/01/24.
//

import UIKit

class HelpViewController: UIViewController {
    @IBOutlet weak var faqSearch: UISearchBar!
    
    @IBOutlet weak var faqTableView: UITableView!
    @IBOutlet weak var overViewEmail: UIView!
    @IBOutlet weak var overViewCall: UIView!
    @IBOutlet weak var overViewLiveChat: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.overViewCall.layer.cornerRadius = 10
        self.overViewEmail.layer.cornerRadius = 10
        self.overViewLiveChat.layer.cornerRadius = 10
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Help Center"
        self.navigationController?.isNavigationBarHidden = false
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.font: UIFont(name: "Roboto-Medium", size: 16)!,
                                          .foregroundColor: UIColor.black]
        
        // Customizing our navigation bar
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    
    @IBAction func actionCall(_ sender: Any) {
        let phoneNumber = "+123123123"
        let numberUrl = URL(string: "tel://\(phoneNumber)")!
        if UIApplication.shared.canOpenURL(numberUrl) {
            UIApplication.shared.open(numberUrl)
        }
    }
    
    @IBAction func actionEmail(_ sender: Any) {
        if let url: NSURL = NSURL(string: "mailto:test@gmail.com") {
            UIApplication.shared.canOpenURL((url as NSURL) as URL)
        }
    }
    
    @IBAction func actionLiveChat(_ sender: Any) {
    }
}

extension HelpViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = faqTableView.dequeueReusableCell(withIdentifier: "FAQTableViewCell") as! FAQTableViewCell
        return cell
    }
}
