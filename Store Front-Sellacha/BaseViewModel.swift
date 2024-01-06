//
//  BaseViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
import Photos

class BaseViewModel {
    var navigationClosure:(()->())?
    var alertClosure:((String)->())?
    var errorClosure:((String)->())?
    var showLoadingIndicatorClosure:(()->())?
    var hideLoadingIndicatorClosure:(()->())?
    var updateView:(()->())?
    var reloadTableView:(()->())?
    var reloadCollectionView:(()->())?
    var allowToPhotos:(()->())?
    var updateProfileImage:(()->())?
    
    func convertDictionaryToJsonString(dict: NSDictionary) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject:dict, options:[])
            let jsonDataString = String(data: jsonData, encoding: String.Encoding.utf8)!
            return jsonDataString
        } catch {
            print("JSON serialization failed:  \(error)")
        }
        return nil
    }
    
    func requestPhotoAccess() {
        //Photos
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined || photos == .authorized {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    self.allowToPhotos?()
                } else {
                    self.alertClosure?(CommonConfig.messages.PHOTOS_ACCESS_ALERT)
                }
            })
        } else {
            
            self.alertClosure?(CommonConfig.messages.PHOTOS_ACCESS_ALERT)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
