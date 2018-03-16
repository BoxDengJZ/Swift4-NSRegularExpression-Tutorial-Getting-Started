//
//  SearchViewController.swift
//  regular_den
//
//  Created by dengjiangzhou on 2018/3/14.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    struct Storyboard{
        struct Identifiers{
            static let SearchOptionsSegueIdentifier = "SearchOptionsSegue"
        }
        
    }
    
    
    
    @IBOutlet weak var textView: UITextView!
    var searchOptions: SearchOptions?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == Storyboard.Identifiers.SearchOptionsSegueIdentifier {
            if let options = self.searchOptions , let navigationController = segue.destination as? UINavigationController , let searchOptionsViewController = navigationController.topViewController as? SearchOptionsViewController{
                searchOptionsViewController.searchOptions = options
            }
        }
    }
 
    
    
    
    
    @IBAction func underlineInterestingData(_ sender: UIBarButtonItem) {
        
        underlineAllDates()
        underlineAllTimes()
        underlineAllLocations()
        
        
        
    }
    
    
    //MARK: Underline dates, times, and locations
    
    func underlineAllDates() {
    }
    
    func underlineAllTimes() {
    }
    
    func underlineAllLocations() {
    }
    
    
    
    
    @IBAction func unwindToTextHighlightViewController(segue: UIStoryboardSegue) {
        if let searchOptionsViewController = segue.source as? SearchOptionsViewController, let options = searchOptionsViewController.searchOptions{
            performSearchWithOptions(searchOptions: options)
        }
    }
    
    func performSearchWithOptions(searchOptions: SearchOptions){
        self.searchOptions = searchOptions
        if let replacementString = searchOptions.replacementString{
            searchForText(searchText: searchOptions.searchString, replaceWith: replacementString, inTextView: textView)
        }
        else{
            highlightText(searchText: searchOptions.searchString, inTextView: textView)
        }

    }
    
    //MARK: - Search and HighLight
    func searchForText(searchText: String, replaceWith replacementText: String, inTextView textView: UITextView){
        
        
    }
    
    func highlightText(searchText: String, inTextView textView: UITextView) {
        
        
    }
    
    
    //MARK: - Aid And Regex
    
    func rangeForAllTextInTextView() -> NSRange {
        return NSMakeRange(0, textView.text.count)
    }
    
    
    func matchesForRegularExpression(regex: NSRegularExpression, inTextView textView: UITextView) -> [NSTextCheckingResult] {
        if let string = textView.text{
            let range = rangeForAllTextInTextView()
            return regex.matches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range)
        }
        else{
            return []
        }
    }
    
    
    func highlightMatches(matches: [NSTextCheckingResult]){
        let attributedText = textView.attributedText.mutableCopy() as! NSMutableAttributedString
        let attributedTextRange = NSRange(location: 0, length: attributedText.length)
        attributedText.removeAttribute(NSAttributedStringKey.backgroundColor, range: attributedTextRange)
        for match in matches{
            let matchRange = match.range
            attributedText.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: matchRange)
            attributedText.addAttributes([NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle], range: matchRange)
        }
        textView.attributedText = attributedText.copy() as! NSAttributedString
    }
}



