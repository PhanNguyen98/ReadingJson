//
//  HomeViewController.swift
//  ReadingJson
//
//  Created by Phan Nguyen on 28/12/2020.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSources = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setData()
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
    }
    
    func setData() {
        dataSources = DataManager.shared.loadData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell else {
            return DetailTableViewCell()
        }
        cell.tag = indexPath.row
        cell.setContent(item: dataSources[indexPath.row])
        cell.loadAvataImage(url: dataSources[indexPath.row].avatar ?? "", index: indexPath.row)
        return cell
    }
    
    
}
