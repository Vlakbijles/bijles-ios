//
//  SearchViewController.swift
//  ios-bijles
//
//  Created by Tycho van der Ouderaa on 02/06/15.
//  Copyright (c) 2015 Suftwear. All rights reserved.
//

import UIKit

class SearchViewController: XLFormViewController {
    
    let adressen: [String] = ["test", "test2","test3"]
    let niveaus: [String] = ["vmbo", "havo", "vwo", "hbo", "wo"]
    let vakken: [String] = ["Nederlands", "Duits", "Engels"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadForm()
        
          // Do any additional setup after loading the view.
    }

    @IBAction func unwindToSearchViewController(segue: UIStoryboardSegue) {
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func loadForm() {
    
        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "searchform") as XLFormDescriptor
        
        section = XLFormSectionDescriptor.formSectionWithTitle("Zoektermen") as XLFormSectionDescriptor
        form.addFormSection(section)
        
        // Adres
        row = XLFormRowDescriptor(tag: "entry1", rowType:XLFormRowDescriptorTypeSelectorPush, title: "Adres")
        row.action.viewControllerStoryboardId = "MapViewController"
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
        row = XLFormRowDescriptor(tag: "donebutton", rowType:XLFormRowDescriptorTypeButton, title:"Zoek!")
        row.action.viewControllerStoryboardId = "ResultsViewController"
        section.addFormRow(row)

        
        self.form = form;
    }
    
    override func storyboardForRow(formRow: XLFormRowDescriptor!) -> UIStoryboard! {
        return UIStoryboard(name: "Main", bundle:nil)
    }
}
