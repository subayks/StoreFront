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
    }
    @IBAction func actionSettings(_ sender: Any) {
    }
    @IBAction func actionCards(_ sender: Any) {
    }
    @IBAction func actionWishlist(_ sender: Any) {
    }
    
    @IBAction func actionOrderView(_ sender: Any) {
    }
    @IBAction func actionEdit(_ sender: Any) {
        self.vm.requestPhotoAccess()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
