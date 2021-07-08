//
//  DetailViewController.swift
//  MVVM_TopAlbum
//
//  Created by Mohit Gupta on 24/06/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet weak var parentView: CardView!
    var selectedcategory: Int?
    var accommodationselectedObj: Allgemein?
    var childcareselectedObj: ChildcareAllgemein?
    var schoolselectedObj: SchoolAllgemein?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Description"
        loadWebView() 
    }
}

extension DetailViewController: WKUIDelegate{
    
    func loadWebView() {
        var htmlString = ""
        let myWebView:WKWebView = WKWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        myWebView.uiDelegate = self
        self.parentView.addSubview(myWebView)
        switch selectedcategory {
        case 0: htmlString = accommodationselectedObj?.beschreibung ?? ""
            break
        case 1: htmlString = childcareselectedObj?.beschreibung ?? ""
            break
        default: htmlString = schoolselectedObj?.beschreibung ?? ""
            break
        }
         
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    
}
