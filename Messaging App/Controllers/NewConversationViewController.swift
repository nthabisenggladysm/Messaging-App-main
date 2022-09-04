//
//  NewConversationViewController.swift
//  Messaging App
//
//  Created by IACD-024 on 2022/08/24.
//

import UIKit
import CloudKit
import JGProgressHUD

class NewConversationViewController: UIViewController {

    private let spinner = JGProgressHUD()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = " Search for new Users..."
        return searchBar
        
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.isHidden = true
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
        
    }()
    
    private let noResultsLabel: UILabel = {
       let label = UILabel()
        label.isHidden = true
        label.text = "No Results"
        label.textAlignment = .center
        label.textColor = .green
        label.font = .systemFont(ofSize: 21, weight: .medium)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(dismissSelf))
        
        searchBar.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }


}

extension NewConversationViewController: UISearchBarDelegate {
    
    func searchBarButtonClicked(_ searchBar: UISearchBar) {
        
        
        
        
    }
}





