//
//  RegexHelpers.swift
//  regular_den
//
//  Created by dengjiangzhou on 2018/3/14.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation

extension NSRegularExpression{
    convenience init?(options: SearchOptions){
        let searchString = options.searchString
        let isCaseSensitive = options.matchCase
        let isWholeWords = options.wholeWords
        var regexOption: NSRegularExpression.Options
        
        if isCaseSensitive {
            regexOption = NSRegularExpression.Options(rawValue: 0)
        }
        else{
            regexOption = NSRegularExpression.Options.caseInsensitive
        }
        var pattern: String
            
        if isWholeWords {
            pattern = "\\b\(searchString)\\b"
        }
        else{
            pattern = searchString
        }
        try! self.init(pattern: pattern, options: regexOption)
    }
    
    
    
    class func regularExpressionForDates() -> NSRegularExpression?{
        let pattern = "(\\d{1,2}[-/.]\\d{1,2}[-/.]\\d{1,2})|(Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|Jun(e)?|Jul(y)?|Aug(ust)?|Sep(tember)?|Oct(ober)?|Nov(ember)?|Dec(ember)?)\\s*(\\d{1,2}(st|nd|rd|th)?+)?[,]\\s*\\d{4}"
        //let pattern = "(\\d{1,2}[-/.]\\d{1,2}[-/.]\\d{1,2})|(Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|Jun(e)?|Jul(y)?|Aug(ust)?|Sep(tember)?|Oct(ober)?|Nov(ember)?|Dec(ember)?)\\s*(\\d{1,2}(st|nd|rd|th)?+)?[.]\\s*\\d{4}"  , 这段 代码 有什么 差错
        
        
        return try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        // 第一段， "(\\d{1,2}[-/.]\\d{1,2}[-/.]\\d{1,2})|"
        // 第二段， "|(Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|Jun(e)?|Jul(y)?|Aug(ust)?|Sep(tember)?|Oct(ober)?|Nov(ember)?|Dec(ember)?)"
        // 第三段， "\\s*(\\d{1,2}(st|nd|rd|th)?+)[.]\\"
        // 第四段， "\\s*\\d{4}"
    }
    

/*
     
     let pattern = "(\\d{1,2}[-/.]\\d{1,2}[-/.]\\d{1,2})|(Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|Jun(e)?|Jul(y)?|Aug(ust)?|Sep(tember)?|Oct(ober)?|Nov(ember)?|Dec(ember)?)\\s*(\\d{1,2}(st|nd|rd|th)?+)?[,]\\s*\\d{4}"
     This pattern has two parts separated by the | (OR) character. That means either the first part or the second part will match.
     The first part reads: (\d{1,2}[-/.]\d{1,2}[-/.]\d{1,2}). That means two digits followed by one of - or / or . followed by two digits, followed by - or / or ., followed by a final two digits.
     The second part starts with (Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|Jun(e)?|Jul(y)?|Aug(ust)?|Sep(tember)?|Oct(ober)?|Nov(ember)?|Dec(ember)?), which will match a full or abbreviated month name.
     Next up is \\s*\\d{1,2}(st|nd|rd|th)? which will match zero or more spaces, followed by 1 or 2 digits, followed by an optional ordinal suffix. As an example, this will match both “1” and “1st”.
     Finally [,]\\s*\\d{4} will match a comma followed by zero or multiple spaces followed by a four-digit number for the year.
     That’s quite the intimidating regular expression! However, you can see how regular expressions are concise and pack a lot of information — and power! — into a seemingly cryptic string.
     Next up are the the patterns for regularExpressionForTimes and regularExpressionForLocations. Fill in the blank patterns with the following:
     
     
     */
    
    
    
    
    
    class func regularExpressionForTimes() -> NSRegularExpression?{
        let pattern = "\\d{1,2}\\s*(pm|am)"
        
        //"\\d{1,2}\\s*(pm|am)"
        return try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    class func regularExpressionForLocations() -> NSRegularExpression?{
        let pattern = "[a-zA-Z]+[,]\\s*([A-Z]{2})"
        
        //"[a-zA-Z]+[,]\\s*([A-Z]{2})"
        return try! NSRegularExpression(pattern: pattern, options: .init(rawValue: 0))
    }
}
/*
 
 Date Requirements:
 xx/xx/xx or xx.xx.xx or xx-xx-xx format. Day, month and year placement is not important since the code will just highlight them. Example: 10-05-12.
 Full or abbreviated month name (e.g. Jan or January, Feb or February, etc.), followed by a one or two digit number (e.g. x or xx). The day of the month can be ordinal (e.g. 1st, 2nd, 10th, 21st, etc.), followed by a comma as separator, and then a four-digit number (e.g. xxxx). There can be zero or more white spaces between the name of the month, day and year. Example: March 13th, 2001
 
 
 Time requirements:
 Find simple times like “9am” or “11 pm”: One or two digits followed by zero or more white spaces, followed by either lowercase “am” or “pm”.
 
 
 Location requirements:
 Any word at least one character long, immediately followed by a comma, followed by zero or more white spaces followed by any capitalized English letter combination that is exactly 2 characters long. For example “Boston, MA”.
 
 */



/*
 Whenever the user requests a case-insensitive search, the regular expression uses the .CaseInsensitive NSRegularExpressionOptions value. The default behavior of NSRegularExpression is to perform case-sensitive searches, but in this case you’re using the more user-friendly default of case-insensitive searches.
 If the user requests a whole word search, then the app wraps the regular expression pattern in the \b character class. Recall that \b is the word boundary character class, so putting \b before and after the search pattern will turn it into a whole word search (that is, the pattern “\bcat\b” will match only the word “cat”, but not “catch”).
 */
