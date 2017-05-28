//
//  AirportListViewController.swift
//  airport
//
//  Created by sean on 2017/5/28.
//  Copyright © 2017年 sean. All rights reserved.
//

import Foundation
import UIKit

struct airPort {
    var name:String
    var country:String
    var IATA:String
    var servedCity:String
    var shortedName:String
}

class AirportListViewController: UITableViewController{
    var noteTitles = [String]()
    var countrys = [String]()
    var countryNames = [String]()
    var airportNames = [String]()
    var IATAs = [String]()
    var servedCitys = [String]()
    var shortedNames = [String]()
    var airports = [airPort]()
    var groupedAirports = [Int:[airPort]]()
    var listIndex = 0
    override func numberOfSections(in tableView: UITableView) -> Int {
        for country in countryNames{
            if countrys.contains(country) == false{
                countrys.append(country)
            }
        }
       // print("count = \(countrys.count)")
        return countrys.count
    }
    func setGroup( group: inout [String],_ countryName: [String]){
        for country in countryName{
            if group.contains(country) == false{
                group.append(country)
            }
        }
    }
    func groupAirportsList(_ list: [airPort],by group: [String]){
        for sections in 0...16{
            var temp = [airPort]()
            for rows in 0...39{
                if group[sections] == list[rows].country{
                    temp.append(airPort(name: list[rows].name, country: list[rows].country, IATA: list[rows].IATA, servedCity: list[rows].servedCity, shortedName: list[rows].shortedName))
                }
                if rows == 39{
                    groupedAirports.updateValue(temp, forKey: sections)
                }
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("count = \(noteTitles.count)")
        var rowsCount = 0
        for index in 0...39{
            if countrys[section] == airports[index].country{
                rowsCount += 1
            }
        }
        return rowsCount
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countrys[section]
    }
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        print("raw =\(indexPath.row) name = \(String(describing: groupedAirports[indexPath.section]?[indexPath.row].name))")
        cell.textLabel?.text = groupedAirports[indexPath.section]?[indexPath.row].name
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "airports", ofType: "plist")
        let arrayOfItems = NSArray(contentsOfFile: path!)
    
        countryNames = arrayOfItems?.value(forKeyPath: "Country") as! NSArray as! [String]
        airportNames = arrayOfItems?.value(forKeyPath: "Airport") as! NSArray as! [String]
        IATAs = arrayOfItems?.value(forKeyPath: "IATA") as! NSArray as! [String]
        servedCitys = arrayOfItems?.value(forKeyPath: "ServedCity") as! NSArray as! [String]
        shortedNames = arrayOfItems?.value(forKeyPath: "ShortName") as! NSArray as! [String]
        for index in 0...39{
//            var oldValue = animals.updateValue(4, forKey: "Bird")
            airports.append(airPort(name: airportNames[index],country: countryNames[index],IATA: IATAs[index],servedCity: servedCitys[index],shortedName: shortedNames[index]))
        }
        setGroup(group: &countrys, countryNames)
        groupAirportsList(airports, by: countrys)
        noteTitles = countryNames
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
