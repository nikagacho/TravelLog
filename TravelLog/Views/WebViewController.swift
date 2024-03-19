//
//  WebViewController.swift
//  TravelLog
//
//  Created by Nikoloz Gachechiladze on 18.03.24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    private let urlString: String
    private let webViewer = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(with urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.addSubview(webViewer)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissView))
        webViewer.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        guard let url = URL(string: urlString) else  {
            self.dismiss(animated: true)
            return
        }
        webViewer.load(URLRequest(url: url))
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            webViewer.topAnchor.constraint(equalTo: view.topAnchor),
            webViewer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webViewer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webViewer.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true)
    }
    
}
