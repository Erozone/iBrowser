//
//  StartViewController.swift
//  iBrowser
//
//  Created by Mohit Kumar on 17/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//

import UIKit

class StartViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myWebView: UIWebView!
    var urlString : String?
    
    var url:URL? //= URL(string: "https://www.hackingwithswift.com/read/4/2/creating-a-simple-browser-with-wkwebview")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- SearchBar Functions
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        url = URL(string: searchText)!
        urlString = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlRequest = URLRequest(url: url!)
        myWebView.loadRequest(urlRequest)
        searchBar.resignFirstResponder()
        
    }
}
