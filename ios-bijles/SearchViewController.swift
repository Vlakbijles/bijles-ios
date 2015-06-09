//
//  SearchViewController.swift
//  ios-bijles
//
//  Created by Tycho van der Ouderaa on 02/06/15.
//  Copyright (c) 2015 Suftwear. All rights reserved.
//

import UIKit
import CoreLocation


class SearchViewController: XLFormViewController, CLLocationManagerDelegate
 {
    // Design
    let blueColor = UIColor(red: 51/255, green: 105/255, blue: 204/255, alpha: 1)

    
    // Form
    let adressen: [String] = ["test", "test2","test3"]
    let niveaus: [String] = ["vmbo", "havo", "vwo", "hbo", "wo"]
    let vakken: [String] = ["Nederlands", "Duits", "Engels"]
    
    // Location
    let locationManager = CLLocationManager()
    var pm: CLPlacemark!

    let gpaViewController = GooglePlacesAutocomplete(
        apiKey: "AIzaSyCLOLxBlwzbaqi1FvyyYGuNy2-v7-Wu0Bw",
        placeType: .Address
    )
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Form
        self.loadForm()

        // Location
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
    // MARK: Location
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in
                if (error != nil) {
                    println("Error:" + error.localizedDescription)
                    return
                }
            if placemarks.count > 0 {
                self.pm = placemarks[0] as! CLPlacemark
                self.displayLocationInfo(self.pm)
            } else {
                println("Error with data")
            }
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark) {
        self.locationManager.stopUpdatingLocation()
        
        println(placemark.locality)
        println(placemark.postalCode)
        println(placemark.administrativeArea)
        println(placemark.country)

        //self.form.formRowWithTag("entry1").title = placemark.locality
        
        self.tableView.reloadData()
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: " + error.localizedDescription)
    }
    
    func testFunc() {
        gpaViewController.placeDelegate = self
        
        presentViewController(gpaViewController, animated: true, completion: nil)
    }
    
    func loadForm() {
        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "searchform") as XLFormDescriptor
        
        section = XLFormSectionDescriptor.formSection() as XLFormSectionDescriptor
        form.addFormSection(section)

        // Logo
        
        row = XLFormRowDescriptor(tag: "logo", rowType: XLFormRowDescriptorTypeRate, title: "First Rating")
        row.value = 3
        row.cellClass = XLFormRatingCell.self
        section.addFormRow(row)


        
        section = XLFormSectionDescriptor.formSectionWithTitle("Zoektermen") as XLFormSectionDescriptor
        form.addFormSection(section)
        
        // Adres
        row = XLFormRowDescriptor(tag: "entry1", rowType: XLFormRowDescriptorTypeCustom)
        row.value = "Adres"
        row.cellClass = XLFormCustomCell.self
        section.addFormRow(row)
        
        // Niveau
        row = XLFormRowDescriptor(tag: "entry2", rowType:XLFormRowDescriptorTypeSelectorPickerView, title:"Niveau")
        row.selectorOptions = niveaus
        row.value = niveaus[0]
        row.cellConfig.setObject(blueColor, forKey: "tintColor")
        section.addFormRow(row)
        
        // Vak / Studie
        row = XLFormRowDescriptor(tag: "entry3", rowType:XLFormRowDescriptorTypeSelectorPickerView, title:"Vak / Opleiding")
        row.selectorOptions = vakken
        row.value = vakken[0]
        row.cellConfig.setObject(blueColor, forKey: "tintColor")
        section.addFormRow(row)
        
        // Done
        section = XLFormSectionDescriptor.formSection()
        form.addFormSection(section)

        row = XLFormRowDescriptor(tag: "donebutton", rowType:XLFormRowDescriptorTypeButton, title:"Zoek!")
        row.action.viewControllerStoryboardId = "ResultsViewController"
        section.addFormRow(row)

        
        self.form = form;
    }
    
    // MARK: Navigation
    override func storyboardForRow(formRow: XLFormRowDescriptor!) -> UIStoryboard! {
        return UIStoryboard(name: "Main", bundle:nil)
    }
    
    @IBAction func unwindToSearchViewController(segue: UIStoryboardSegue) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension SearchViewController: GooglePlacesAutocompleteDelegate {
    func placeSelected(place: Place) {
        println(place.description)
        
        place.getDetails { details in
            println(details)
        }
    }
    
    func placeViewClosed() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

