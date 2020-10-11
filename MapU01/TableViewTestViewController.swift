//
//  TableViewTestViewController.swift
//  MapU01
//
//  Created by ting pan on 2020/10/7.
//  Copyright © 2020 MapU. All rights reserved.
//

import UIKit

class TableViewTestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
     
    let testArray = ["AAA", "BBB", "CCC", "DDD"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellTest = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = testArray[indexPath.row ]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
