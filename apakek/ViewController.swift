//
//  ViewController.swift
//  apakek
//
//  Created by Paramitha on 08/03/24.
//

import PDFKit
import SafariServices
import UIKit
import WebKit

class ViewController: UIViewController {
    
    enum Case: String, CaseIterable {
        case wkwebview = "WKWebView"
        case sfsafari = "SFSafari"
        case pdfkit = "PDFKit"
        case externalSafari = "External Safari"
    }

    let url = URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")
//    let url = URL(string: "https://google.com")
    
    private let titleList: [Case] = Case.allCases
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        title = "Open PDF"
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titleList[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url else { return }
        switch titleList[indexPath.row] {
        case .wkwebview:
            let wkVc = UIViewController()
            
            let webview = WKWebView(frame: wkVc.view.bounds)
            webview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            let request = URLRequest(url: url)
            webview.load(request)
            
            wkVc.view.addSubview(webview)
            present(wkVc, animated: true)
            
        case .sfsafari:
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true)
            
        case .pdfkit:
            let pdfVc = UIViewController()
            let pdfView = PDFView(frame: pdfVc.view.bounds)
            pdfView.document = PDFDocument(url: url)
            
            pdfView.autoScales = true
            pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            pdfVc.view.addSubview(pdfView)
            
            present(pdfVc, animated: true)
            
        case .externalSafari:
            UIApplication.shared.open(url)
        }
    }
}
