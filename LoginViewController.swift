//
//  LoginViewController.swift
//  OrdoApp
//
//  Created by Brandon Stillword on 11/13/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func postText(_ sender: Any) {
        let userText = user.text
        let myObj = PFObject(className:"FirstClass")
        myObj["message"] = userText
        myObj.saveInBackground { (success, error) in
            if(success){
                print("This actually worked")
            } else {
                print("You failed miserably")
            }
        }
        
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = user.text
        newUser.password = password.text
        
        newUser.signUpInBackground { success, error in
            if success{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
