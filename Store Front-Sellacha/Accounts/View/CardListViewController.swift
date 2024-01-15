//
//  CardListViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 15/01/24.
//

import UIKit

class CardListViewController: UIViewController {
    @IBOutlet weak var cardLsitTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        setupNavigationBar()
    }

    @IBAction func actionAddCard(_ sender: Any) {
        let cardsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CardsViewController") as! CardsViewController
        cardsViewController.cardClosure = { CardInfo in
          //  self.vm.cardInfo = CardInfo
        }
        self.navigationController?.pushViewController(cardsViewController, animated: true)
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Cards"
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

extension CardListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = cardLsitTableView.dequeueReusableCell(withIdentifier: "CardViewTableViewCell") as! CardViewTableViewCell
            return cell
        } else {
            let cell = cardLsitTableView.dequeueReusableCell(withIdentifier: "AddCardTableViewCell") as! AddCardTableViewCell
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
