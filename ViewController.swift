//
//  ViewController.swift
//  SectionInTableView
//
//  Created by SHUBHAM AGARWAL on 22/09/19.
//  Copyright © 2019 SHUBHAM AGARWAL. All rights reserved.
//

import UIKit

class MobileBrand {
    var brandName: String?
    var modelName: [String]?
    
    init(brandName: String, modelName: [String]) {
        self.brandName = brandName
        self.modelName = modelName
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var mobileBrand = [MobileBrand]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileBrand.append(MobileBrand.init(brandName: "Apple longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglong", modelName: ["iPhone 5s longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong","iPhone 6","iPhone 6s", "iPhone 7+", "iPhone 8", "iPhone 8+", "iPhone 11", "iPhone 11 Pro"]))
        mobileBrand.append(MobileBrand.init(brandName: "Samsung", modelName: ["Samsung M Series", "Samsung Galaxy Note 9", "Samsung Galaxy Note 9+", "Samsung Galaxy Note 10", "Samsung Galaxy Note 10 +"]))
        mobileBrand.append(MobileBrand.init(brandName: "Mi", modelName: ["Mi Note 7", "Mi Note 7 Pro", "Mi K20"]))
        mobileBrand.append(MobileBrand.init(brandName: "Huawei", modelName: ["Huawei Mate 20", "Huawei P30 Pro", "Huawei P10 Plus", "Huawei P20"]))
        tableView.backgroundColor = UIColor.clear
        
        // Register the custom header view.
        let nib = UINib(nibName: "CustomHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mobileBrand.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobileBrand[section].modelName?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell1
        cell.title?.text = mobileBrand[indexPath.section].modelName?[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                       "CustomHeaderView") as! CustomHeaderView
        view.title?.text = mobileBrand[section].brandName

       return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 5))
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        return view
    }
    
}
