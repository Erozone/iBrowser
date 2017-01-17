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
    @IBOutlet weak var previousButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    var urlString : String?
    
    var url:URL?//= URL(string: "https://www.hackingwithswift.com/read/4/2/creating-a-simple-browser-with-wkwebview")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        previousButtonOutlet.isHighlighted = false
        nextButtonOutlet.isHighlighted = false
        
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
        if let urlString = URL(string: searchText){
            url = urlString
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlRequest = URLRequest(url: url!)
        myWebView.loadRequest(urlRequest)
        searchBar.resignFirstResponder()
        
    }
    
    
    @IBAction func previousButtonPressed(_ sender: Any) {
        myWebView.goBack()
        print("Previous Button Tapped")
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        myWebView.goForward()
        print("Next Button Tapped")
    }
    
    
}
