//
//  WelcomeTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import UIKit

class WelcomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var offerCollectionView: UICollectionView!
    @IBOutlet weak var carouselPageConrtrol: UIPageControl!

    var welcomeTableViewCellVM: WelcomeTableViewCellVM? {
        didSet {
            self.setupView()
        }
    }
    
    var scrollingTimer = Timer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setupView() {
        offerCollectionView.delegate = self
        offerCollectionView.dataSource = self
        // offerCollectionView.collectionViewLayout = layout
        offerCollectionView.reloadData()
        self.carouselPageConrtrol.currentPageIndicatorTintColor = CommonConfig.colors.themeColor
        self.carouselPageConrtrol.pageIndicatorTintColor = UIColor.white
        self.carouselPageConrtrol.numberOfPages = self.welcomeTableViewCellVM?.posts?.count ?? 0
      //  self.startTimer()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func startTimer() {

        let timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }


    @objc func scrollAutomatically(_ timer1: Timer) {
        
        if let coll  = offerCollectionView {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)! < (self.welcomeTableViewCellVM?.posts?.count ?? 0) - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
                
            }
        }
    }
}

extension WelcomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.welcomeTableViewCellVM?.getNumberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCollectionViewCell", for: indexPath) as! OffersCollectionViewCell
        cell.offersCollectionViewCellVM = self.welcomeTableViewCellVM?.getOffersCollectionViewCellVM(index: indexPath.row)
        
//        var rowIndex  = indexPath.row
//        let numberOfCount = (self.welcomeTableViewCellVM?.getNumberOfItems() ?? 0) - 1
//        if rowIndex < numberOfCount {
//            rowIndex = rowIndex + 1
//        } else {
//            rowIndex = 0
//        }
//
//        scrollingTimer =  Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: rowIndex, repeats: true)

        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        carouselPageConrtrol.currentPage =  Int(
            (offerCollectionView.contentOffset.x / offerCollectionView.frame.width)
            .rounded(.toNearestOrAwayFromZero))
    }
}
