//
//  ResultsViewController.swift
//  ios-bijles
//
//  Created by Tycho van der Ouderaa on 07/06/15.
//  Copyright (c) 2015 Suftwear. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK: Instance Variables
    
    @IBOutlet weak var tableView: UITableView!

    let cellIdentifier = "resultIdentifier"
    
    let items = ["Tycho van der Ouderaa", "Jan Jansen", "Peter Peterson"]
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        refreshData()
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    
    
    func configureTableView() {
        tableView.rowHeight = 128
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        deselectAllRows()
    }
    
    func deselectAllRows() {
        if let selectedRows = tableView.indexPathsForSelectedRows() as? [NSIndexPath] {
            for indexPath in selectedRows {
                tableView.deselectRowAtIndexPath(indexPath, animated: false)
            }
        }
    }
    // MARK: Refresh Content
    
    func refreshData() {
        self.reloadTableViewContent()
    }
    
    func reloadTableViewContent() {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
            self.tableView.scrollRectToVisible(CGRectMake(0, 0, 1, 1), animated: false)
        })
    }
    
    
    // MARK: UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("test")
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("test2")
        return resultCellAtIndexPath(indexPath)
    }
    
    func resultCellAtIndexPath(indexPath:NSIndexPath) -> ResultsTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! ResultsTableViewCell
        setTitleForResultCell(cell, indexPath: indexPath)
        setDescriptionForResultCell(cell, indexPath: indexPath)
        setImageForResultCell(cell, indexPath: indexPath)
        return cell
    }

    
    func setTitleForResultCell(cell:ResultsTableViewCell, indexPath:NSIndexPath) {
        let item = items[indexPath.row]
        cell.resultTitle.text = item
    }
    
    func setDescriptionForResultCell(cell:ResultsTableViewCell, indexPath:NSIndexPath) {
        let item = items[indexPath.row]
        cell.resultDescription.text = item
    }
    
    func setImageForResultCell(cell:ResultsTableViewCell, indexPath:NSIndexPath) {
        // Load Image
        cell.resultImage.image = UIImage(named: "face_example.jpg")
        
        
        // Circular image
        cell.resultImage.layer.cornerRadius = cell.resultImage.frame.size.width / 2;
        cell.resultImage.clipsToBounds = true
    }
    
    // MARK: UITableViewDelegate

    func isLandscapeOrientation() -> Bool {
        return UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation)
    }
    
    
    // MARK: Navigation
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //self.performSegueWithIdentifier("profileSegue", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = tableView.indexPathForSelectedRow()
        
        //profileViewController.profileTitle.text = "testert"
        //profileViewController.profileText.text = items[indexPath]
    }


}
