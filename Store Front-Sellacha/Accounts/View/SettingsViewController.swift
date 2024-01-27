//
//  SettingsViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 16/01/24.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTableView: UITableView!
    var vm = SettingsViewControllerVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vm.createDataStructure()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Settings"
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
    }


}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.vm.settingsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell") as! SettingsTableViewCell
        cell.vm = self.vm.getSettingsTableViewCellVM(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.clear
        let button = UIButton()
        button.frame =  CGRect(x: self.view.bounds.size.width/3,y: 25 ,width:136,height:45)
        button.setImage(UIImage(named: "LogOut"), for: .normal)
        button.scalesLargeContentImage = true
        button.tintColor = .red
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.setTitle(" Logout", for: .normal)
        button.setTitleColor(.red, for: .normal)
        vw.addSubview(button)
        return vw
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.vm.settingsArray?[indexPath.row].title == "Terms Policy" {
            let termsAndConditionViewController = self.storyboard?.instantiateViewController(withIdentifier: "TermsAndConditionViewController") as! TermsAndConditionViewController
            self.navigationController?.pushViewController(termsAndConditionViewController, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 150
    }
}
