//
//  AccountsViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 06/01/24.
//

import UIKit

class AccountsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var helpView: UIView!
    @IBOutlet weak var referView: UIView!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var cardsView: UIView!
    @IBOutlet weak var wishListView: UIView!
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var buttonEdit: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!

    var vm = AccountsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logoImage.image = CommonConfig.colors.appSmallLogo

        self.orderView.layer.cornerRadius = 10
        self.wishListView.layer.cornerRadius = 10
        self.cardsView.layer.cornerRadius = 10
        self.settingsView.layer.cornerRadius = 10
        self.referView.layer.cornerRadius = 10
        self.helpView.layer.cornerRadius = 10
        
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        buttonEdit.layer.cornerRadius = buttonEdit.frame.size.width / 2
        profileImage.clipsToBounds = true
        
        self.buttonEdit.backgroundColor = CommonConfig.colors.themeColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.vm.allowToPhotos = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                let pickerController = UIImagePickerController()
                pickerController.delegate = self
                pickerController.allowsEditing = true
                self.present(pickerController, animated: true)
            }
        }
    }
    
    @IBAction func actionHelp(_ sender: Any) {
    }
    
    @IBAction func actionreferNow(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ReferViewController")
        
        if let presentationController = viewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large()]
            presentationController.preferredCornerRadius = 20

        }
        self.present(viewController, animated: true)
    }
    
    @IBAction func actionSettings(_ sender: Any) {
        let cardListViewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(cardListViewController, animated: true)
    }
    
    @IBAction func actionCards(_ sender: Any) {
        let cardListViewController = self.storyboard?.instantiateViewController(withIdentifier: "CardListViewController") as! CardListViewController
        self.navigationController?.pushViewController(cardListViewController, animated: true)
    }
    
    @IBAction func actionWishlist(_ sender: Any) {
        let wishListViewController = self.storyboard?.instantiateViewController(withIdentifier: "WishListViewController") as! WishListViewController
        wishListViewController.vm = self.vm.getWishListViewControllerVM()
        self.navigationController?.pushViewController(wishListViewController, animated: true)
    }
    
    @IBAction func actionOrderView(_ sender: Any) {
        let ordersViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrdersViewController") as! OrdersViewController
        self.navigationController?.pushViewController(ordersViewController, animated: true)
    }
    @IBAction func actionEdit(_ sender: Any) {
        self.vm.requestPhotoAccess()
    }
}

///MARK:- Image picker delegates
extension AccountsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImageFromPicker: UIImage?
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImageFromPicker = editedImage
        } else {
            selectedImageFromPicker = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        }
        self.profileImage.image = selectedImageFromPicker
     //   self.profileViewModel.selectedImage = selectedImageFromPicker
        dismiss(animated: true)
    }
}
