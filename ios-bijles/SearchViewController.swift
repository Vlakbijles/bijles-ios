//
//  SearchViewController.swift
//  ios-bijles
//
//  Created by Tycho van der Ouderaa on 02/06/15.
//  Copyright (c) 2015 Suftwear. All rights reserved.
//

import UIKit

class SearchViewController: XLFormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadForm()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadForm() {
        let dateTime = "dateTime"
        let date = "date"
        let time = "time"
        
        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "Dates") as XLFormDescriptor
        
        section = XLFormSectionDescriptor.formSectionWithTitle("Inline Dates") as XLFormSectionDescriptor
        form.addFormSection(section)
        

        
        self.form = form;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
