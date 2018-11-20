//
//  ViewController.swift
//  rootbeer-swift
//
//  Created by eidoshack on 11/20/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var beersTableView: UITableView!
    
    var beersList: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadBeers()
    }

    func loadBeers() {
        Alamofire.request("https://api.punkapi.com/v2/beers", method: .get).responseJSON { (response) in
            
            switch response.result {
                
                case .success:
                    
                    let api = response.result.value
                
                    let json = JSON(api!)
                
                    let data = json.array
                
                    if let result = data {
                        
                        var beersList: [Beer] = []
                        
                        result.forEach({ (beer) in
                            beersList.append(Beer.parseToBeer(beer))
                        })
                        
                        self.beersList = beersList
                        self.beersTableView.reloadData()
                        
                    }
                
                    break
                
                case .failure:
                    print("fail call")
                break
                
            }
            
        }
    }
    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeersTableViewCell", for: indexPath) as! BeersTableViewCell
        
        let beer = beersList[indexPath.row]
        cell.ivImage.sd_setImage(with: URL(string: beer.image ?? "https://increasify.com.au/wp-content/uploads/2016/08/default-image.png"), placeholderImage: UIImage(named: "192"))
        //cell.ivImage.backgroundColor = getRandomColor()
        cell.lblTitle.text = beer.name
        cell.lblReleaseDate.text = beer.firstBrewed
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
}

