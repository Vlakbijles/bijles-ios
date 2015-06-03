//
//  SearchViewController.swift
//  ios-bijles
//
//  Created by Tycho van der Ouderaa on 02/06/15.
//  Copyright (c) 2015 Suftwear. All rights reserved.
//

import UIKit

class SearchViewController: XLFormViewController {
    
    let niveaus: [String] = ["vmbo", "havo", "vwo", "hbo", "wo"]
    let vakken: [String] = ["Nederlands", "Duits", "Engels"]

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
    
        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "Search") as XLFormDescriptor
        
        section = XLFormSectionDescriptor.formSectionWithTitle("Zoektermen") as XLFormSectionDescriptor
        form.addFormSection(section)
        
        // Postcode
        row = XLFormRowDescriptor(tag: "entry1", rowType: XLFormRowDescriptorTypeText, title: "Postcode")
        row.required = true
        section.addFormRow(row)
        
        // Niveau
        row = XLFormRowDescriptor(tag: "entry2", rowType:XLFormRowDescriptorTypeSelectorPickerView, title:"Niveau")
        row.selectorOptions = niveaus
        row.value = niveaus[0]
        section.addFormRow(row)
        
        // Vak / Studie
        row = XLFormRowDescriptor(tag: "entry3", rowType:XLFormRowDescriptorTypeSelectorPickerView, title:"Vak / Opleiding")
        row.selectorOptions = vakken
        row.value = vakken[0]
        section.addFormRow(row)
        
        // Done
        row = XLFormRowDescriptor(tag: "donebutton",
            rowType:XLFormRowDescriptorTypeButton, title:"Zoek!")
        section.addFormRow(row)

        
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
