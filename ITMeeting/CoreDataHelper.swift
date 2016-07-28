//
//  CoreDataHelper.swift
//  ITMeeting
//
//  Created by test on 28/07/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper: NSObject
{
    
    func saveCompanyRegisterDetails(name : String , password:String)-> Bool
    {
        
        
        
        let managedContext = AppDelegate().managedObjectContext
        
        let person = NSEntityDescription.insertNewObjectForEntityForName("CompanyRegisterDetails", inManagedObjectContext: managedContext)
        
        // add our data
        person.setValue(name, forKey: "username")
        person.setValue(password, forKey: "password")
        
        // save it
        do {
            // this was the problem ///////////////
            try managedContext.save()
            
            return true
        }
        catch
        {
            fatalError("Failure to save context: \(error)")
            
            return false
            
        }
        //   return false
        
    }
    
    
    func saveCompanyDetails(companyName : String,description : String,date : String,intern : String)-> Bool
    {
        
        
        
        let managedContext = AppDelegate().managedObjectContext
        
        let data = NSEntityDescription.insertNewObjectForEntityForName("CompanyDetails", inManagedObjectContext: managedContext)
        
        // add our data
        data.setValue(companyName, forKey: "companyname")
        data.setValue(description, forKey: "meetingdescription")
        data.setValue(date, forKey: "date")
        data.setValue(intern, forKey: "offeringInternship")

        // save it
        do {
            // this was the problem ///////////////
            try managedContext.save()
            
            return true
        }
        catch
        {
            fatalError("Failure to save context: \(error)")
            
            return false
            
        }
        //   return false
        
    }

    func fetchCompanyDetails(companyName : String,password : String)->String
    {
        
        let managedContext = AppDelegate().managedObjectContext

        let request :NSFetchRequest = NSFetchRequest(entityName: "CompanyRegisterDetails")
        request.returnsObjectsAsFaults = false
      //  let error: NSError? = nil
        
        var matches = [CompanyRegisterDetails]()
        
        do
        {
            
            matches = try managedContext.executeFetchRequest(request) as! [CompanyRegisterDetails]
            if matches.count > 0
            {
                
                
//                for myObj in matches
//                {
//                 
//                    print(myObj.username)
//                    
//                    if myObj.username == companyName
//                    {
//                        
//                        if myObj.password == password
//                        {
//                            
//                            return "yes"
//                        }
//                        
//                        
//                    }
//                    
//                }
              return "no"
                
            }
            else
            {
                
                
            }
        
        } catch
        {
            // handle error
        }
        
        return "no"
    }
    
//      }
//        var matches: NSArray = managedContext.executeFetchRequest(request, error: &error)
//        
//        if matches.count > 0 {
//            return matches
//        }
//        else {
//            return nil
//        }
    }


