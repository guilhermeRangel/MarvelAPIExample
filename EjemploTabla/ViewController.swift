//
//  ViewController.swift
//  EjemploTabla
//
//  Created by Mauricio Vasquez on 4/23/15.
//  Copyright (c) 2015 Mauricio Vasquez. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var hero = ["Spiderman", "Batman", "Superman", "Ironman"]
    var image = ["spiderman.jpg","batman.jpg","superman.jpg","ironman.png"]
    var allHeroes = [NSDictionary]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RequestData("4", offset: "50")
    }
    
    func RequestData(limit: String, offset: String) {
        Alamofire.request(.GET, "http://gateway.marvel.com/v1/public/characters", parameters: [
            "limit" : limit,
            "offset" : offset,
            "apikey": "e7206e02ed4dc09304a8c2880e0ee6e9",
            "ts" : "15:18:45",
            "hash" : "772554f41689694e989e39403a53deea"])
            .responseJSON { (_, _, heroJson, _) in
                
                var json = JSON(heroJson!)
                
                for (key: String, subJson: JSON) in json["data"]["results"] {
                    //                    println(subJson)
                    
                    var heroes = [String:AnyObject]()
                    
                    let url = NSURL(string: subJson["thumbnail"]["path"].stringValue + "." + subJson["thumbnail"]["extension"].stringValue)
                    let data = NSData(contentsOfURL: url!)
                    heroes["picture"] = UIImage(data: data!)
                    heroes["name"] = subJson["name"].stringValue
                    
                    self.allHeroes.append(heroes)
                }
                self.tableView.reloadData()
        }

    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HeroTableViewCell
        
        var hero = self.allHeroes[indexPath.row]
        var heroImage = hero["picture"] as! UIImage

        cell.heroImage.image = heroImage

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allHeroes.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var nextScenes = segue.destinationViewController as! DetailViewController
        
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            println(nextScenes)
            
            nextScenes.heroName = hero[indexPath.row]
            nextScenes.heroImage = image[indexPath.row]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

