//
//  ViewController.swift
//  GooglePlacesAutocompleteExample
//
//  Created by Howard Wilson on 15/02/2015.
//  Copyright (c) 2015 Howard Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let gpaViewController = GooglePlacesAutocomplete(
    apiKey: "AIzaSyCLOLxBlwzbaqi1FvyyYGuNy2-v7-Wu0Bw",
    placeType: .Address
  )

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    gpaViewController.placeDelegate = self

    presentViewController(gpaViewController, animated: true, completion: nil)
  }
}

extension ViewController: GooglePlacesAutocompleteDelegate {
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
