//
//  ItemListViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet weak var overVieFilter: UIView!
    @IBOutlet weak var overViewSort: UIView!
    @IBOutlet weak var overViewBrand: UIView!
    @IBOutlet weak var buttonCart: UIButton!
    @IBOutlet weak var itemListCollectionView: UICollectionView!
    var vm: ItemListViewModel?
    var isCartClicked:(()->())?
    var filterPicker = UIPickerView()
    var sortPicker = UIPickerView()
    var brandPicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        
        self.buttonCart.layer.cornerRadius = 10
        self.overVieFilter.layer.cornerRadius = 10
        self.overViewSort.layer.cornerRadius = 10
        self.overViewBrand.layer.cornerRadius = 10

        self.setupNavigationBar()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        itemListCollectionView.collectionViewLayout = layout
        
        let button1 = UIBarButtonItem(image: UIImage(named: "Search"), style: .plain, target: self, action: #selector(searchClicked(tapGestureRecognizer:)))
        self.navigationItem.rightBarButtonItem  = button1
        
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = self.vm?.title ?? ""
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

    @IBAction func actionFilter(_ sender: Any) {
        filterPicker = UIPickerView.init()
        filterPicker.delegate = self
        filterPicker.dataSource = self
        self.filterPicker.tag = 3
        filterPicker.backgroundColor = UIColor.white
        filterPicker.setValue(UIColor.black, forKey: "textColor")
        filterPicker.autoresizingMask = .flexibleWidth
        filterPicker.contentMode = .center
        filterPicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(filterPicker)
    }
    
    @IBAction func actionSort(_ sender: Any) {
        sortPicker = UIPickerView.init()
        sortPicker.delegate = self
        sortPicker.dataSource = self
        self.sortPicker.tag = 2
        sortPicker.backgroundColor = UIColor.white
        sortPicker.setValue(UIColor.black, forKey: "textColor")
        sortPicker.autoresizingMask = .flexibleWidth
        sortPicker.contentMode = .center
        sortPicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(sortPicker)
    }
    
    @IBAction func actionBrand(_ sender: Any) {
        brandPicker = UIPickerView.init()
        brandPicker.delegate = self
        brandPicker.dataSource = self
        self.brandPicker.tag = 1
        brandPicker.backgroundColor = UIColor.white
        brandPicker.setValue(UIColor.black, forKey: "textColor")
        brandPicker.autoresizingMask = .flexibleWidth
        brandPicker.contentMode = .scaleAspectFit
        brandPicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(brandPicker)
    }
    
    @IBAction func actionCart(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = false
        self.hidesBottomBarWhenPushed = false
        self.tabBarController?.selectedIndex = 3
    }
    
    @objc func searchClicked(tapGestureRecognizer: UITapGestureRecognizer) {
        let itemDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemSearchViewController") as! ItemSearchViewController
        self.navigationController?.pushViewController(itemDetailViewController, animated: true)
    }
}

extension ItemListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.vm?.getnumberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryCollectionViewCellVM = self.vm?.getCategoryCollectionViewCell(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
        self.navigationController?.pushViewController(itemDetailViewController, animated: true)
    }
    
}

extension ItemListViewController : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/2.07, height: 220)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension ItemListViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return self.vm?.brandArray.count ?? 0
        case 2:
            return self.vm?.sortArray.count ?? 0
        case 3:
            return self.vm?.filterArray.count ?? 0
        default:
            return 1
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return self.vm?.brandArray[row]
        case 2:
            return self.vm?.sortArray[row]
        case 3:
            return self.vm?.filterArray[row]
        default:
            return "Data not found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            return self.brandPicker.isHidden = true
        case 2:
            return self.sortPicker.isHidden = true
        case 3:
            return self.filterPicker.isHidden = true
        default:
            return self.brandPicker.isHidden = true
        }
    }
}
