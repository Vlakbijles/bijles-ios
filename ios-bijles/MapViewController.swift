//
//  MapViewController.swift
//  ios-bijles
//
//  Created by Tycho van der Ouderaa on 04/06/15.
//  Copyright (c) 2015 Suftwear. All rights reserved.
//

import UIKit

//@objc(MapViewController)
//class MapViewController: UIViewController {
class MapViewController: UIViewController, XLFormRowDescriptorViewController {

    var rowDescriptor: XLFormRowDescriptor?
    
    let gpaViewController = GooglePlacesAutocomplete(
        apiKey: "AIzaSyCLOLxBlwzbaqi1FvyyYGuNy2-v7-Wu0Bw",
        placeType: .Address
    )
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        gpaViewController.placeDelegate = self
        
        presentViewController(gpaViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension MapViewController: GooglePlacesAutocompleteDelegate {
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
