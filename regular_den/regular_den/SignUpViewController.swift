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
<<<<<<< HEAD
        textFields = [firstNameField, middleInitialField, lastNameField, dateOfBirthField]
        let patterns = ["^[a-z]{1,10}$",
                        "^[a-z]$",
            "^[a-z']{2,10}$",
            "^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\\d\\d$"]
        regexes = patterns.map({
            try! NSRegularExpression(pattern: $0, options: .caseInsensitive)
        })
        
        
    }
    /*
    There are two things you need to add to your app: the validation patterns themselves, and a mechanism to validate the user’s input with those patterns. To make things easy for the user, all of the validations in your app will be case-insensitive, so you can just use lower-case in your patterns.
    
    As an exercise, try to come up with the regular expressions to validate the following text strings (don’t worry about case sensitivity):
    
    
     First name — should consist of standard English letters and between one and ten characters in length.
     
     Middle initial — should consist of a single English letter.
     
     Last name — should consist of standard English letters plus the apostrophe (for names such as O’Brian) and between two and ten characters in length.
     
     Date of birth – should be one of the following date formats: dd/mm/yyyy, dd-mm-yyyy, or dd.mm.yyyy, and fall between 1/1/1900 and 31/12/2099.
     
     
     
     
     For the date of birth, you have a little more work to do. You match on the start of the string, then for the month portion you have a capturing group to match one of 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11 or 12, followed by another capturing group to match either -, / or ..
     
     For the day portion, you then have another capturing group to match one of 01, 02, … 29, 30, or 31, followed by capturing group to match either -, / or .
     
     Finally, there is a capturing group to match either 19 or 20, followed by any two numeric characters.
     
     You can get very creative with regular expressions. There are other ways to solve the above problem, such as using \d instead of [0-9]. However, any solution is perfectly fine as long as it works!
     
     
     
     
     
     Note: In real-world usage, you likely wouldn’t use a regular expression to verify a date (and certainly not to check it’s within a particular date range). Instead, you’d probably want to use an NSDateFormatter to attempt to parse a date from a string, and then compare your parsed NSDate against reference dates.
     
     
     */
    
    
=======
    }

>>>>>>> 2af15b36ed07041d166414a13d135cfe3e077cfc
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
<<<<<<< HEAD
        let index = textFields.index(of: textField)
        if let regex = regexes[index!], let textReal = textField.text{
            let text = textReal.stringByTrimmingLeadingAndTrailingWhitespace()
           // let text = textReal.trimmingCharacters(in: .whitespacesAndNewlines)
            let range = NSRange(location: 0, length: text.count)
            let matchRange = regex.rangeOfFirstMatch(in: text, options: .reportProgress, range: range)
            let valid = matchRange.location != NSNotFound
            textField.textColor = valid ? UIColor.trueColor() : UIColor.falseColor()
        }
    }
    
    /*
     
     To actually check for a match, the codes tests the result of rangeOfFirstMatchInString(_:options:range:). This is probably the most efficient way to check for a match, since this call exits early when it finds the first match. However, there are other alternatives such as numberOfMatchesInString(_:options:range:) if you need to know the total number of matches.
     */
    
    
=======
    }
    
>>>>>>> 2af15b36ed07041d166414a13d135cfe3e077cfc
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





<<<<<<< HEAD
extension String{
    func stringByTrimmingLeadingAndTrailingWhitespace() -> String{
        let leadingAndTrailingWhitespacePattern = "(?:^\\s+)|(?:^\\s+$)"
        if let regex = try? NSRegularExpression(pattern: leadingAndTrailingWhitespacePattern, options: .caseInsensitive){
            let range = NSRange(location: 0, length: self.count)
            let trimmedString = regex.stringByReplacingMatches(in: self, options: .reportProgress, range: range, withTemplate: "$1")
            return trimmedString
        }
        else{
            return self
        }
    }
    
}

/*
 The new string method uses the pattern from above to create a regular expression, and returns a new string with any regex matches replaced with $1. But what does $1 mean?
 
 When you have capture groups in a regular expression (denoted by (round brackets)), you can use $ and a number to reference the contents of a group. Regular expression documentation refers to this as a backreference. The number specifies which capture group you’re referencing.
 
 
 
 
 
 
 
 
 
 
 
 
 The new string method uses the pattern from above to create a regular expression, and returns a new string with any regex matches replaced with $1. But what does $1 mean?
 When you have capture groups in a regular expression (denoted by (round brackets)), you can use $ and a number to reference the contents of a group. Regular expression documentation refers to this as a backreference. The number specifies which capture group you’re referencing.
 As an example, given the regular expression:
 Customer ID: (\d{3})-(\d{4})
 Matched against the following text:
 Customer ID: 123-0089
 Then the value of $1 would be 123, and the value of $2 would be 0089. Useful stuff!
 Going back to the whitespace example, though – won’t $1 just replace the whitespace with itself — since it’s a captured group — which effectively does nothing?
 
 
 
 
 
 
 
 
 
 
 
 
 
 If you are still struggling to make sense out of non-capturing, capturing and back referencing, try out the following different scenarios in the playground to see what the results are (hint: you can use the `replaceMatches` function):
 replace the whitespace pattern above with “(^\\s+)|(\\s+$)” and template with “BOO”
 replace the whitespace pattern above with “(?:^\\s+)|(\\s+$)” and template with “$1BOO”
 replace the whitespace pattern above with “(?:^\\s+)|(\\s+$)” and template with “$2BOO”
 
 */


=======
>>>>>>> 2af15b36ed07041d166414a13d135cfe3e077cfc
