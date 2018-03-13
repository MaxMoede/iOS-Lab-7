//
//  ViewController.swift
//  lab7
//
//  Created by Max Moede on 2/24/18.
//  Copyright © 2018 Max Moede. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseDatabase

class ViewController: UIViewController {

    let schoolApi = "https://code.org/schools.json"
    
    //var schoolRoot
    var schoolRoot : DatabaseReference?
    var listOfSchools : [schools.eachSchool]?
    var zipSchools : [schools.eachSchool]?
    
    func toAnyObject(aSchool : schools.eachSchool) -> Any {
        return [
            "name" : aSchool.name as Any,
            "city" : aSchool.city as Any,
            "state" : aSchool.state as Any,
            "zip" : aSchool.zip as Any,
            "contact_email" : aSchool.contact_email as Any,
            "latitude" : aSchool.latitude as Any,
            "longitude" : aSchool.longitude as Any
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Database.database().isPersistenceEnabled = true
        schoolRoot = Database.database().reference(withPath: "Schools")
        print(schoolApi)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let request = URLRequest(url: URL(string: schoolApi)!)
        
        let task: URLSessionDataTask = session.dataTask(with: request)
        { (receivedData, response, error) -> Void in
            
            if let data = receivedData {
                do {
                    let decoder = JSONDecoder()
                    let aSchoolService = try decoder.decode(schools.self, from: data)
                    
                    self.listOfSchools = aSchoolService.listOfSchools
                    for eachSchool in self.listOfSchools! {
                        if (eachSchool.zip == nil || (eachSchool.zip?.isEmpty)!){
                            //print("uhhhh")
                        } else {
                            let schoolZip = eachSchool.zip
                            if (schoolZip != nil){
                                let intArr = schoolZip?.flatMap{Int(String($0))}
                                //print(intArr)
                                if (intArr?.count == 5 && intArr![0] == 9 && intArr![1] == 3){
                                    let newSchoolRef = self.schoolRoot?.child(eachSchool.name.replacingOccurrences(of: ".", with: ""))
                                    newSchoolRef?.setValue(self.toAnyObject(aSchool: eachSchool))
                                    print("okokok")
                                }
                            }
                            //print(eachSchool.name)
                            
                        }
                    }
                    print(self.listOfSchools?.count ?? 1)
                    
                    
                    
                } catch {
                    print("Exception on Decode: \(error)")
                }
            }
        }
        task.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

