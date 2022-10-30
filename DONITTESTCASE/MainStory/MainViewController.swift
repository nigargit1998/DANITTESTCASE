//
//  ViewController.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 29.10.22.
//

import UIKit
import SwiftUI


class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel: MainViewModel = MainViewModel()
    private var characters: Characters?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabLeView()
        viewModel.getCharacters(page: 1) { state in
            self.render(state: state)
        }
        DispatchQueue.main.async{
          self.tableView.reloadData()
        }

    }
    func setUpTabLeView() {
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
            characters = results
            tableView.reloadData()
        case let .error(errorMessage: error):
            print(error)
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        97
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.imagePerson.downloadImage(url: characters?.results[indexPath.row]?.image ?? "")
        cell.config(item: CategoryCell.Item(name: characters?.results[indexPath.row]?.name,
                                            species: characters?.results[indexPath.row]?.species,
                                            status: characters?.results[indexPath.row]?.status,
                                            gender: characters?.results[indexPath.row]?.gender))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "CharactersInformationViewController") as! CharactersInformationViewController
        viewController.result = (characters?.results[indexPath.row]!)!
        self.present(viewController, animated: true)
    }
    
}
