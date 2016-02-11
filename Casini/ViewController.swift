//
//  ViewController.swift
//  Casini
//
//  Created by trevor jordet on 2/10/16.
//  Copyright © 2016 jord3t. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "Earth":
                        ivc.imageURL = DemoURL.NASA.Earth
                    
                    case "Saturn":
                        ivc.imageURL = DemoURL.NASA.Saturn
                    case "Cassini":
                        ivc.imageURL = DemoURL.NASA.Cassini
                    default:
                        ivc.imageURL = DemoURL.Stanford
                }
                ivc.title = identifier
            }
        }
    }

}

