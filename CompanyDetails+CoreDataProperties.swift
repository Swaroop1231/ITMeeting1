//
//  CompanyDetails+CoreDataProperties.swift
//  ITMeeting
//
//  Created by test on 28/07/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CompanyDetails {

    @NSManaged var companyname: String?
    @NSManaged var date: String?
    @NSManaged var meetingdescription: String?
    @NSManaged var offeringInternship: String?

}
