//
//  DataHandle.swift
//  JMarriner Project 1
//
//  Created by admin on 4/22/21.
//

import Foundation
import CoreData
import UIKit

class DataHandle
{
    static var inst = DataHandle()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getData()-> [Credentials]
    {
        var cred = [Credentials]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Credentials")
        
        do
        {
            cred = try context.fetch(fetchReq) as! [Credentials]
        }
        catch
        {
            print("Data could not be fetched.")
        }
        
        return cred
    }
    
    func getCred(User: String) -> Credentials
    {
        var cred = Credentials()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Credentials")
        
        fetchReq.predicate = NSPredicate(format: "userN == %@", User)
        fetchReq.fetchLimit = 1
        
        do
        {
            let req = try context.fetch(fetchReq) as! [Credentials]
            
            if(req.count != 0)
            {
                cred = req.first as! Credentials
            }
            else
            {
                print("Login failed")
            }
        }
        catch
        {
            print("fetch failed")
            
        }
        
        return cred
    }
    
    func verifyLogin(User: String, Pass: String) -> Bool
    {
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Credentials")
        
        fetchReq.predicate = NSPredicate(format: "userN == %@", User)
        fetchReq.fetchLimit = 1
        
        do
        {
            let req = try context.fetch(fetchReq) as! [Credentials]
            
            if(req.count != 0)
            {
                for thing in req
                {
                    if(thing.userN == User && thing.passW == Pass)
                    {
                        print("User verified.")
                        return true
                    }
                }
                print("Verification failed :(")
            }
            else
            {
                print("Verification failed :(")
            }
        }
        catch
        {
            print("Error caught. couldn't verify user :(")
        }
        
        return false
    }
    
    func addCred(object: [String:String], question: String, answer: String)
    {
        let credent = NSEntityDescription.insertNewObject(forEntityName: "Credentials", into: context) as! Credentials
        credent.userN = object["userN"]
        credent.passW = object["passW"]
        credent.secQ = question
        credent.secAnsw = answer
        
        do
        {
            try context.save()
            print("Login saved")
        }
        catch
        {
            print("Save failed")
        }
    }
    
    func checkUser(user: String) -> Bool
    {
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Credentials")
        
        fetchReq.predicate = NSPredicate(format: "userN == %@", user)
        fetchReq.fetchLimit = 1
        
        do
        {
            let req = try context.fetch(fetchReq) as! [Credentials]
            
            if req.count == 0
            {
                return true
            }
        }
        catch
        {
            print("request failed")
        }
        
        return false
    }
    
    func checkSurv(user: String) -> Bool
    {
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "SurvRes")
        
        fetchReq.predicate = NSPredicate(format: "userName == %@", user)
        fetchReq.fetchLimit = 1
        
        do
        {
            let req = try context.fetch(fetchReq) as! [SurvRes]
            
            if req.count == 0
            {
                return false
            }
        }
        catch
        {
            print("No data found for user survey results")
            return false
        }
        return true
    }
    
    func saveSurv(usr: String, q1: Int, q2: Int, q3: String, type: String)
    {
        if !checkSurv(user: usr) // create entry if not already there
        {
            let surv = NSEntityDescription.insertNewObject(forEntityName: "SurvRes", into: context) as! SurvRes
            
            surv.userName = usr
            
            switch type
            {
            case "room":
                surv.rmQ1 = q1
                surv.rmQ2 = q2
                surv.rmQ3 = q3
            case "food":
                surv.fdQ1 = q1
                surv.fdQ2 = q2
                surv.fdQ3 = q3
            case "gym":
                surv.gymQ1 = q1
                surv.gymQ2 = q2
                surv.gymQ3 = q3
            default:
                print("Triggered default switch in saveSurv")
                return
            }
            
            do
            {
                try context.save()
                print("Survey saved")
            }
            catch
            {
                print("error caught when trying to save: \(error)")
            }
            
            return
        }
        
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "SurvRes")
        
        fetchReq.predicate = NSPredicate(format: "userName == %@", usr)
        fetchReq.fetchLimit = 1
        
        do
        {
            let req = try context.fetch(fetchReq) as! [SurvRes]
            
            if req.count != 0
            {
                switch type
                {
                case "room":
                    req[0].setValue(q1, forKey: "rmQ1")
                    req[0].setValue(q2, forKey: "rmQ2")
                    req[0].setValue(q3, forKey: "rmQ3")
                case "food":
                    req[0].setValue(q1, forKey: "fdQ1")
                    req[0].setValue(q2, forKey: "fdQ2")
                    req[0].setValue(q3, forKey: "fdQ3")
                case "gym":
                    req[0].setValue(q1, forKey: "gymQ1")
                    req[0].setValue(q2, forKey: "gymQ2")
                    req[0].setValue(q3, forKey: "gymQ3")
                default:
                    print("Triggered default clause line 231 in DataHandle")
                }
            }
        }
        catch
        {
            print("Fetch request failed in saveSurv line 213: \(error)")
            return
        }
        
        do
        {
            try context.save()
        }
        catch
        {
            print("error on save in DataHandle line 244: \(error)")
        }
        
    }
}
