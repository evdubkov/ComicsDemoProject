//
//  CharacterInfoViewController.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import UIKit
import WebKit

final class CharacterInfoViewController: UIViewController {

    @IBOutlet private weak var publisherLabel: UILabel!
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var webViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    private let presenter: CharacterInfoPresentable
    
    private var isObserving: Bool = false
    private let observationKeyPath = "contentSize"
    
    init(presenter: CharacterInfoPresentable) {
        self.presenter = presenter
        super.init(
            nibName: CharacterInfoViewController.className,
            bundle: nil
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        presenter.viewDidLoad()
    }
    
    @IBAction func close(_ sender: Any) {
        presenter.onCloseButtonClicked()
    }
    
    deinit {
        stopObservingHeight()
    }
}

//MARK: - WebView Observing
extension CharacterInfoViewController {
    private func startObservingHeight() {
        webView
            .scrollView
            .addObserver(self,
                         forKeyPath: observationKeyPath,
                         options: [.new],
                         context: nil)
        isObserving = true
    }
    
    private func stopObservingHeight() {
        if let webView = webView, isObserving {
            webView
                .scrollView
                .removeObserver(self,
                                forKeyPath: observationKeyPath,
                                context: nil)
            isObserving = false
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath else {
            super.observeValue(forKeyPath: nil,
                               of: object,
                               change: change,
                               context: nil)
            return
        }
        if keyPath == observationKeyPath {
            webViewHeightConstraint.constant = webView.scrollView.contentSize.height
        } else {
            super.observeValue(forKeyPath: keyPath,
                               of: object,
                               change: change,
                               context: context)
        }
    }
}

extension CharacterInfoViewController: CharacterInfoViewable {
    func startLoading() {
        activityIndicatorView.startAnimating()
    }
    
    func stopLoading() {
        activityIndicatorView.stopAnimating()
    }
    
    func render(viewModel: CharacterInfoViewModel) {
        publisherLabel.text = viewModel.title
        webView.loadHTMLString(viewModel.description, baseURL: nil)
    }
}

extension CharacterInfoViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        stopLoading()
        if !isObserving {
            startObservingHeight()
        }
    }
}
