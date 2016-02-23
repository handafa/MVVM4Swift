//
//  ViewController.swift
//  MVVM4Swift
//
//  Created by Seven on 15/12/30.
//  Copyright © 2015年 Seven. All rights reserved.
//

import UIKit
import SVProgressHUD
class ViewController: UIViewController {

    @IBOutlet var mTableView: UITableView!
    var items:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MVVM4Swift"
        self.initiew()
        let vm = PulibcViewModel()
        vm.setCompliton({ (result) -> Void in
            SVProgressHUD.dismiss()
            self.items = result as? NSArray
            self.mTableView.reloadData()
            }, failure: { (result) -> Void in
            SVProgressHUD.showErrorWithStatus("\(result)")
        })
        vm.fetchPublicWeiBo();
        SVProgressHUD.show()
    }
    
    private func initiew() ->Void{
        items = NSArray()
        self.mTableView.delegate = self
        self.mTableView.dataSource = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.mTableView.estimatedRowHeight = 70.0
        self.mTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.mTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - UITableViewDataSource,UITableViewDelegate 扩展
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identify:String = "MyTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identify) as!MyTableViewCell
        let model = items[indexPath.row] as? PublicModel
        cell.setValueWithModel(model!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}

