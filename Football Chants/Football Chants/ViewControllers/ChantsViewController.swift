//
//  ChantsViewController.swift
//  Football Chants
//
//  Created by Darpan Choudhary on 26/08/23.
//

import UIKit

class ChantsViewController: UIViewController  {
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .none
//        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        return tv
    }()
    
     // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        setup()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        self.view.backgroundColor = .white
        
        navigationController?.navigationBar.topItem?.title = "Football Chants"


        navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
}

private extension ChantsViewController {
    
    func setup() {
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource
extension ChantsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId, for: indexPath) as! TeamTableViewCell
        
        cell.configure()
        
        return cell
    }
}
