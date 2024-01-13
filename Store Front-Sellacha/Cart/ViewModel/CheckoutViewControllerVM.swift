//
//  CheckoutViewControllerVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 09/01/24.
//

import Foundation
import UIKit

class CheckoutViewControllerVM: BaseViewModel {
    
    var addressInfo: AddressInfo? {
        didSet {
            self.reloadTableView?()
        }
    }
    
    var cardInfo: CardInfo? {
        didSet {
            self.reloadTableView?()
        }
    }
    
    func getAddressCardTableViewCellVM() ->CardTableViewCellVM {
        return CardTableViewCellVM(cardInfo: CardInfo(image: UIImage(named: "Location"),title: "Add Address"))
    }
    
    func getPaymentCardTableViewCellVM() ->CardTableViewCellVM {
        return CardTableViewCellVM(cardInfo: CardInfo(image: UIImage(named: "Payments"),title: "Add Payment Method"))
    }
    
    func getAddressFilledTableViewCellVM() ->AddressFilledTableViewCellVM {
        return AddressFilledTableViewCellVM(addressInfo: self.addressInfo ?? AddressInfo())
    }
    
    func getCardFilledTableViewCellVm() ->CardFilledTableViewCellVm {
        return CardFilledTableViewCellVm(cardInfo: self.cardInfo ?? CardInfo())
    }
}
