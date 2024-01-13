//
//  OrdersViewControllerVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import Foundation
import UIKit

enum OrderStatus: String {
    case InProcess = "In Process"
    case Delivered = "Delivered"
    case Cancelled = "Cancelled"
    
}
struct OrdersInfo {
    var dresses = [DressCellObject()]
    var status = OrderStatus.Delivered
    var date = String()
    var total = String()
    var billInfo = BillInfo()
    var addressInfo = AddressInfo()
    var cardInfo = CardInfo()
    var orderId = String()
}

class OrdersViewControllerVM: BaseViewModel {
    var list: [OrdersInfo]?
    var selectedIndex = 0

    func setupDataModel() {
      
        var orderList = [OrdersInfo()]
        var item = OrdersInfo()
        item.dresses = self.getDressArray()
        item.status = .Delivered
        item.date = "Yesterday"
        item.total = "₹5,000"
        item.billInfo = BillInfo(subtotal: "₹5,000",deliveryFee: "₹50",discount: "₹10",gst: "25",total: "₹5,085")
        item.addressInfo = AddressInfo(streetName: "1st Stage, Wave Rock",city: "Hyderabad", state: "Telungana", mob: "+91 9489588595")
        item.cardInfo = CardInfo(image: UIImage(named: "Card"),title: "****9120")
        item.orderId = "BRJ388290"
        
        orderList.append(item)
        
        item.dresses = self.getDressArray()
        item.status = .InProcess
        item.date = "20/12/2024"
        item.total = "₹5,000"
        item.billInfo = BillInfo(subtotal: "₹5,000",deliveryFee: "₹50",discount: "₹10",gst: "25",total: "₹5,085")
        item.addressInfo = AddressInfo(streetName: "1st Stage, Wave Rock",city: "Hyderabad", state: "Telungana", mob: "+91 9489588595")
        item.cardInfo = CardInfo(image: UIImage(named: "Card"),title: "****9120")
        item.orderId = "BRJ388291"

        orderList.append(item)
        
        item.dresses = self.getDressArray()
        item.status = .Delivered
        item.date = "Today"
        item.total = "₹5,000"
        item.billInfo = BillInfo(subtotal: "₹5,000",deliveryFee: "₹50",discount: "₹10",gst: "25",total: "₹5,085")
        item.addressInfo = AddressInfo(streetName: "1st Stage, Wave Rock",city: "Hyderabad", state: "Telungana", mob: "+91 9489588595")
        item.cardInfo = CardInfo(image: UIImage(named: "Card"),title: "****9120")
        item.orderId = "BRJ388292"

        orderList.append(item)
        
        item.dresses = self.getDressArray()
        item.status = .Cancelled
        item.date = "11/11/2024"
        item.total = "₹5,000"
        item.billInfo = BillInfo(subtotal: "₹5,000",deliveryFee: "₹50",discount: "₹10",gst: "25",total: "₹5,085")
        item.addressInfo = AddressInfo(streetName: "1st Stage, Wave Rock",city: "Hyderabad", state: "Telungana", mob: "+91 9489588595")
        item.cardInfo = CardInfo(image: UIImage(named: "Card"),title: "****9120")
        item.orderId = "BRJ388294"

        orderList.append(item)
        
        item.dresses = self.getDressArray()
        item.status = .InProcess
        item.date = "Today"
        item.total = "₹5,000"
        item.billInfo = BillInfo(subtotal: "₹5,000",deliveryFee: "₹50",discount: "₹10",gst: "25",total: "₹5,085")
        item.addressInfo = AddressInfo(streetName: "1st Stage, Wave Rock",city: "Hyderabad", state: "Telungana", mob: "+91 9489588595")
        item.cardInfo = CardInfo(image: UIImage(named: "Card"),title: "****9120")
        item.orderId = "BRJ388295"

        orderList.append(item)
        
        item.dresses = self.getDressArray()
        item.status = .InProcess
        item.date = "Today"
        item.total = "₹5,000"
        item.billInfo = BillInfo(subtotal: "₹5,000",deliveryFee: "₹50",discount: "₹10",gst: "25",total: "₹5,085")
        item.addressInfo = AddressInfo(streetName: "1st Stage, Wave Rock",city: "Hyderabad", state: "Telungana", mob: "+91 9489588595")
        item.cardInfo = CardInfo(image: UIImage(named: "Card"),title: "****9120")
        item.orderId = "BRJ388296"

        orderList.append(item)
        
        item.dresses = self.getDressArray()
        item.status = .InProcess
        item.date = "Today"
        item.total = "₹5,000"
        item.billInfo = BillInfo(subtotal: "₹5,000",deliveryFee: "₹50",discount: "₹10",gst: "25",total: "₹5,085")
        item.addressInfo = AddressInfo(streetName: "1st Stage, Wave Rock",city: "Hyderabad", state: "Telungana", mob: "+91 9489588595")
        item.cardInfo = CardInfo(image: UIImage(named: "Card"),title: "****9120")
        item.orderId = "BRJ388297"

        orderList.append(item)
        
        item.dresses = self.getDressArray()
        item.status = .InProcess
        item.date = "Today"
        item.total = "₹5,000"
        item.billInfo = BillInfo(subtotal: "₹5,000",deliveryFee: "₹50",discount: "₹10",gst: "25",total: "₹5,085")
        item.addressInfo = AddressInfo(streetName: "1st Stage, Wave Rock",city: "Hyderabad", state: "Telungana", mob: "+91 9489588595")
        item.cardInfo = CardInfo(image: UIImage(named: "Card"),title: "****9120")
        item.orderId = "BRJ388298"

        orderList.append(item)
        
        item.dresses = self.getDressArray()
        item.status = .InProcess
        item.date = "Today"
        item.total = "₹5,000"
        item.billInfo = BillInfo(subtotal: "₹5,000",deliveryFee: "₹50",discount: "₹10",gst: "25",total: "₹5,085")
        item.addressInfo = AddressInfo(streetName: "1st Stage, Wave Rock",city: "Hyderabad", state: "Telungana", mob: "+91 9489588595")
        item.cardInfo = CardInfo(image: UIImage(named: "Card"),title: "****9120")
        item.orderId = "BRJ388299"

        orderList.append(item)
        
        item.dresses = self.getDressArray()
        item.status = .Cancelled
        item.date = "Today"
        item.total = "₹5,000"
        item.billInfo = BillInfo(subtotal: "₹5,000",deliveryFee: "₹50",discount: "₹10",gst: "25",total: "₹5,085")
        item.addressInfo = AddressInfo(streetName: "1st Stage, Wave Rock",city: "Hyderabad", state: "Telungana", mob: "+91 9489588595")
        item.cardInfo = CardInfo(image: UIImage(named: "Card"),title: "****9120")
        item.orderId = "BRJ388210"

        orderList.append(item)
        
        self.list = orderList
    }
    
    func getDressArray() -> [DressCellObject] {
        var dressArray = [DressCellObject]()
        
        var dressItem1 = DressCellObject()
        dressItem1.price = "₹1000"
        dressItem1.id = "1"
        dressItem1.isSelected = false
        dressItem1.description = "Suits Well For your skin tone & best fabric"
        dressItem1.image = "Men"
        dressItem1.rating = "5.0"
        dressArray.append(dressItem1)

        var dressItem2 = DressCellObject()
        dressItem2.price = "₹2000"
        dressItem2.id = "2"
        dressItem2.isSelected = false
        dressItem2.description = "Suits Well For your skin tone & best fabric"
        dressItem2.image = "Kids"
        dressItem2.rating = "4.0"
        dressArray.append(dressItem2)
        
        var dressItem3 = DressCellObject()
        dressItem3.price = "₹2,200"
        dressItem3.id = "3"
        dressItem3.isSelected = false
        dressItem3.description = "Suits Well For your skin tone & best fabric"
        dressItem3.image = "Formals"
        dressItem3.rating = "3.0"
        dressArray.append(dressItem3)
        
        var dressItem4 = DressCellObject()
        dressItem4.price = "₹1,200"
        dressItem4.id = "4"
        dressItem4.isSelected = false
        dressItem4.description = "Suits Well For your skin tone & best fabric"
        dressItem4.image = "Men"
        dressItem4.rating = "2.0"
        dressArray.append(dressItem4)
        
        var dressItem5 = DressCellObject()
        dressItem5.price = "₹500"
        dressItem5.id = "5"
        dressItem5.isSelected = false
        dressItem5.description = "Suits Well For your skin tone & best fabric"
        dressItem5.image = "Formals"
        dressItem5.rating = "1.0"
        dressArray.append(dressItem5)

        return dressArray
    }
    
    func getActiveList() ->[OrdersInfo] {
        return self.list?.filter{$0.status == .InProcess} ?? [OrdersInfo]()
    }
    
    func getPastList() ->[OrdersInfo] {
        return self.list?.filter{$0.status != .InProcess} ?? [OrdersInfo]()
    }
    
    func getOrdersTableViewCellVM(index: Int) ->OrdersTableViewCellVM {
        if selectedIndex == 0 {
            return OrdersTableViewCellVM(ordersInfo: self.getActiveList()[index])

        } else {
            return OrdersTableViewCellVM(ordersInfo: self.getPastList()[index])

        }
    }
}
