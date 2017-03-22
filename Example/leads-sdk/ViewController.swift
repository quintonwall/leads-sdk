//
// Sample implemention of the leads button
//
//  Created by Quinton Wall on 01/27/2016.
//  Copyright (c) 2016 Quinton Wall. All rights reserved.
//

import UIKit
import leads_sdk


class ViewController: UIViewController {

    @IBOutlet weak var myLeadButton: LeadsButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add a theme: default, dark, or graphical
        //or simply exclude to set your own styling
        LeadsThemeManager.applyTheme(LeadsTheme.default, leadsbutton: myLeadButton)
    }

    
   
    @IBAction func leadTapped(_ sender: AnyObject) {
        
        var d :Dictionary = [String: String]()
        
       //populate the standard fields
        d[Leads.StandardFields.FIRST_NAME] = "Quinton"
        d[Leads.StandardFields.LAST_NAME] = "Wall"
        d[Leads.StandardFields.EMAIL] = "freddy@leadsdk.com"
        d[Leads.StandardFields.COMPANY] = "Salesforce"
        d[Leads.StandardFields.CITY] = "San Francisco"
        d[Leads.StandardFields.STATE] = "CA"
        
        //if you have custom fields, get your salesforce admin to 
        //use the web-to-lead form generator to generate field ids, and 
        //add them to the dictionary
        d["00NG000000CZxsC"] = "MyCustomValue"
       
        //add the fields to the button
        myLeadButton.formFields = d
        
        
        //finally, submit the leads to salesforce
        //make sure you set the org id either programatically with myLeadButton.setOrgId or 
        //using the storyboard fields.
        do {
           try myLeadButton.sendLead()
        }
        catch Leads.LeadError.noOrgId {
            print("no ord id set!")
        }
        catch Leads.LeadError.commsFailure {
            //comms problem
        }
        catch {
            //unexpected error
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

