//
//  CharacterViewController.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import UIKit

final class CharacterViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    private let presenter: CharacterListPresentable
    private var adapter: CharacterTableViewAdapter!
    
    init(presenter: CharacterListPresentable) {
        self.presenter = presenter
        super.init(
            nibName: CharacterViewController.className,
            bundle: nil
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        setupTableAdapter()
        presenter.viewDidLoad()
    }
    
    private func setupTableAdapter() {
        adapter =
            CharacterTableViewAdapter(tableView: tableView)
        adapter.delegate = self
    }
}

//MARK: - CharacterListViewable
extension CharacterViewController: CharacterListViewable {
    
    func startLoading() {
        activityIndicatorView.startAnimating()
    }
    
    func stopLoading() {
        activityIndicatorView.stopAnimating()
    }
    
    func render(characters: [Character],
                offset: Int) {
        adapter.render(characters: characters,
                       offset: offset)
    }
}

//MARK: - CharacterTableViewAdapterDelegate
extension CharacterViewController: CharacterTableViewAdapterDelegate {
    
    func loadMoreCharactersWithOffset(_ offset: Int,
                                      _ completion: @escaping (() -> Void)) {
        presenter
            .onLoadMoreCharactersWithOffset(offset,
                                            completion: completion)
    }
    
    func characterTableViewAdapter(_ adapter: CharacterTableViewAdapter,
                                   didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCell(with: adapter.character(at: indexPath))
    }
}

