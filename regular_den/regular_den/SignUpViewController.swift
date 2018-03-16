//
//  SignUpViewController.swift
//  regular_den
//
//  Created by dengjiangzhou on 2018/3/14.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class SignUpViewController: UITableViewController {

    
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var middleInitialField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var dateOfBirthField: UITextField!
    
    
    var textFields: [UITextField]!
    var regexes: [NSRegularExpression?]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func validateTextField(textField: UITextField) {
    }
    
    // MARK: - Actions
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        for textField in textFields{
            validateTextField(textField: textField)
            textField.resignFirstResponder()
        }
    }
}


extension SignUpViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = UIColor.black
        doneButton.isEnabled = true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        validateTextField(textField: textField)
        doneButton.isEnabled = false
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        validateTextField(textField: textField)
        makeNextTextFieldFirstResponder(textField: textField)
        return true
    }
    
    func makeNextTextFieldFirstResponder(textField: UITextField){
        textField.resignFirstResponder()
        if var index = textFields.index(of: textField){
            index += 1
            if index < textFields.count{
                textFields[index].becomeFirstResponder()
            }
        }
        
    }
}





extension UIColor {
    class func trueColor() -> UIColor {
        return UIColor(red: 0.1882, green:0.6784, blue:0.3882, alpha:1.0)
    }
    
    class func falseColor() -> UIColor {
        return UIColor(red:0.7451, green:0.2275, blue:0.1922, alpha:1.0)
    }
}





