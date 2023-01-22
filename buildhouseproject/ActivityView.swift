//
//  ActivityView.swift
//  buildhouseproject
//
//  Created by pooh on 25/12/2565 BE.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    @Binding var resultMessage : String
    @Binding var showActivityVC : Bool
    //ตัวแปรสําหรับการส่งวัตถุที่ต้องการทํางานร่วมกับ UIActivityViewController
    //โดยจะถูกส่งมาจากหน้า MainView
    let activityItems: [Any]
    //กําหนดคุณลักษณะของ UIActivityController
    let excludedActivityTypes: [UIActivity.ActivityType]? =
    [.copyToPasteboard, .saveToCameraRoll]
    func makeUIViewController(context: Context) ->
    UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = {
            (activityType, completed, returnedItems, error) in
            if completed {
                if error == nil {
                    self.resultMessage = "Successful!"
                    self.showActivityVC = false
                }
                else{
                    self.resultMessage = "Error : \(error!)"
                }
            }
        }
        return controller
    }
    func updateUIViewController(_ uiViewController:
                                UIActivityViewController, context: Context) {
      
    }
}

