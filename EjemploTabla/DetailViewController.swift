//
//  DetailViewController.swift
//  EjemploTabla
//
//  Created by Mauricio Vasquez on 4/23/15.
//  Copyright (c) 2015 Mauricio Vasquez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var heroTitle: UILabel!
    @IBOutlet var heroImageView: UIImageView!
    
    var heroName = ""
    var heroImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroTitle.text = heroName
        heroImageView.image = UIImage(named: heroImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
