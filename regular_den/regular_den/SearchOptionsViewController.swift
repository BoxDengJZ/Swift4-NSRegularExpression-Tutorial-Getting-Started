//
//  SearchOptionsViewController.swift
//  regular_den
//
//  Created by dengjiangzhou on 2018/3/14.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

struct SearchOptions {
    let searchString: String
    var replacementString: String?
    let matchCase: Bool
    let wholeWords: Bool
}




class SearchOptionsViewController: UITableViewController {

    var searchOptions: SearchOptions?
    
    struct Storyboard {
        struct Identifiers {
            static let UnwindSegueIdentifier = "UnwindSegue"
        }
    }
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var replacementTextField: UITextField!
    @IBOutlet weak var replaceTextSwitch: UISwitch!
    
    @IBOutlet weak var matchCaseSwitch: UISwitch!
    @IBOutlet weak var wholeWordsSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let options = searchOptions{
            searchTextField.text = options.searchString
            replacementTextField.text = options.replacementString
            replaceTextSwitch.isOn = options.matchCase
            wholeWordsSwitch.isOn = options.wholeWords
        }
        searchTextField.becomeFirstResponder()
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
    
    
    //MARK:- Actions
    
    
    
    @IBAction func replaceTextSwitchToggled(_ sender: UISwitch) {
        
        replacementTextField.isEnabled = replaceTextSwitch.isOn
        
    }
    
    
    
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        searchOptions = nil
        performSegue(withIdentifier: Storyboard.Identifiers.UnwindSegueIdentifier, sender: self)
    }
    
    @IBAction func searchTapped(_ sender: UIBarButtonItem) {
        var replaceStr: String?
        if replaceTextSwitch.isOn {
<<<<<<< HEAD
            replaceStr = replacementTextField.text ?? nil
        }
        else{
            replaceStr = nil
        }
        
=======
            replaceStr = replacementTextField.text ?? ""
        }
        else{
            replaceStr = ""
        }
>>>>>>> 2af15b36ed07041d166414a13d135cfe3e077cfc
        searchOptions = SearchOptions(searchString: searchTextField.text!, replacementString: replaceStr, matchCase: matchCaseSwitch.isOn, wholeWords: wholeWordsSwitch.isOn)
        
        performSegue(withIdentifier: Storyboard.Identifiers.UnwindSegueIdentifier, sender: self)
        
    }
    
<<<<<<< HEAD
    /*
     Try searching for the word “the” using various options and see the effects. Notice, for example, that when using whole words, the ‘the’ in ‘them’ does not highlight.
     Also, test out the search and replace functionality to see that your text strings are replaced as expected, and try both the ‘match case’ and ‘whole words’ options.
     
     调一下 ， 开关就好了。
     */
=======
    
>>>>>>> 2af15b36ed07041d166414a13d135cfe3e077cfc

}




