//
//  CategoryTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vieewAllLabel: UILabel!
    @IBOutlet weak var popularStylistCollectionView: UICollectionView!
    @IBOutlet weak var labelTitle: UILabel!
    
    var categoryTableViewCellVM: CategoryTableViewCellVM? {
        didSet {
            self.setupView()
        }
    }
    var reloadCollectionView = false
    var isFromDetailScreen = false
    var didSelectDelegate:((String)->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupView() {
        if self.reloadCollectionView == true {
            self.popularStylistCollectionView.reloadData()
        }
        self.vieewAllLabel.textColor = CommonConfig.colors.themeColor
        self.labelTitle.text = categoryTableViewCellVM?.title
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoryTableViewCellVM?.getnumberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.isFromDetailScreen = isFromDetailScreen
        cell.categoryCollectionViewCellVM = self.categoryTableViewCellVM?.gettStylistCollectionViewCellVM(indexRow: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didSelectDelegate?(String(self.categoryTableViewCellVM?.dressCellObject?[indexPath.row].id ?? 0))
    }
    
}
