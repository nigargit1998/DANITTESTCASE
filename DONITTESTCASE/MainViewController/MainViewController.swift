//
//  ViewController.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 29.10.22.
//

import UIKit
import SwiftUI
import Combine

class MainViewController: UIViewController, ViewLoad {
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel: MainViewModel = MainViewModel()
    private var characters = [ResultsModel?]()
    private var charactersCount = 0
    private var pageCount = 1
    private var hasMoreContent = true
    let indicator = ActivityIndicatorView(indicatorColor: .gray)
    var refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabLeView()
        showIndicator()
        
        getCount()
        getData(page: pageCount)
        refreshControlSetup()
    }
    private func refreshControlSetup() {
        refresh.addTarget(
            self,
            action: #selector(refreshData),
            for: .valueChanged)
        tableView.addSubview(refresh)
    }
    
    @objc private func refreshData() {
        showIndicator()
        viewModel.refresh = true
        pageCount = 1
        getData(page: pageCount)
    }
    
    private func getData(page: Int) {
        viewModel.getCharacters(page: page) { state in
            self.render(state: state)
            DispatchQueue.main.async{
                self.tableView.reloadData()
                self.hideIndicator()
                if self.viewModel.refresh {
                    self.refresh.endRefreshing()
                    self.viewModel.refresh = false
                }
            }
        }
    }
    
    private func getCount() {
        viewModel.getCharactersCount { count in
            self.charactersCount = count
        }
    }
    private func setUpTabLeView() {
        tableView.addSubview(indicator)
        tableView.register(CategoryCell.nib, forCellReuseIdentifier: CategoryCell.identifier)
        tableView.separatorStyle = .singleLine
        tableView.reloadData()
    }
    
    func render(state: MainViewModelState){
        switch state {
        case .idle:
            break
        case .loading:
            break
        case let .loaded(characters: results):
            if self.characters.count == results.info?.count { self.hasMoreContent = false }
            self.characters += results.results
        case let .error(errorMessage: error):
            print(error)
        case let .refresh(characters: results):
            self.characters = results.results
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        97
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.imagePerson.downloadImage(url: characters[indexPath.row]?.image ?? "")
        cell.config(item: CategoryCell.Item(name: characters[indexPath.row]?.name,
                                            species: characters[indexPath.row]?.species,
                                            status: characters[indexPath.row]?.status,
                                            gender: characters[indexPath.row]?.gender))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "CharactersInformationViewController") as! CharactersInformationViewController
        viewController.result = (characters[indexPath.row]!)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.tableFooterView?.isHidden = !hasMoreContent
        if hasMoreContent {
            let lastSectionIndex = tableView.numberOfSections - 1
            let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
            tableView.tableFooterView?.isHidden = !hasMoreContent
            if indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex && hasMoreContent {
                let spinner = ActivityIndicatorView(indicatorColor: .gray)
                spinner.startAnimating()
                spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
                tableView.tableFooterView = spinner
                pageCount += 1
                getData(page : pageCount)
                spinner.stopAnimating()
            }
        }
    }
    
    
}
