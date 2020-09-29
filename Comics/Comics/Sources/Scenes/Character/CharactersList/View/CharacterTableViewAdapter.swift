//
//  CharacterTableViewAdapter.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import UIKit

protocol CharacterTableViewAdapterDelegate: AnyObject {
    func loadMoreCharactersWithOffset(
        _ offset: Int,
        _ completion: @escaping (() -> Void)
    )
    func characterTableViewAdapter(
        _ adapter: CharacterTableViewAdapter,
        didSelectRowAt indexPath: IndexPath
    )
}

final class CharacterTableViewAdapter: NSObject {
    
    private let tableView: UITableView
    
    private var currentOffset: Int = 0
    private var isDataLoaded: Bool = false
    
    private var characters: [Character] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self,
                          action: #selector(reloadCharacters),
                          for: .valueChanged)
        return control
    }()
    
    weak var delegate: CharacterTableViewAdapterDelegate?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterCell.self)
        tableView.refreshControl = refreshControl
    }
    
    @objc func reloadCharacters(_ sender: Any) {
        delegate?.loadMoreCharactersWithOffset(0) { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
    
    func render(characters: [Character], offset: Int) {
        self.characters = offset == 0
            ? characters
            : self.characters + characters
        currentOffset = offset + 50
    }
    
    func character(at idx: IndexPath) -> Character {
        characters[idx.row]
    }
}

//MARK: - UITableViewDataSource
extension CharacterTableViewAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CharacterCell.self,
                                     for: indexPath)
        cell.render(with: characters[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate
extension CharacterTableViewAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.characterTableViewAdapter(self, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        if characters.count - 1 == indexPath.row &&
            characters.count % 50 == 0 &&
            !isDataLoaded {
            isDataLoaded = !isDataLoaded
            delegate?.loadMoreCharactersWithOffset(currentOffset) { [weak self] in
                self?.isDataLoaded = false
            }
        }
    }
    
    func tableView(_ tableView: UITableView,
                   didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? CharacterCell
        cell?.highlighting(true)
    }
    
    func tableView(_ tableView: UITableView,
                   didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? CharacterCell
        cell?.highlighting(false)
    }
}
