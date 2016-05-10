//
//  NetworkController.swift
//  MyTips
//
//  Created by Dean on 16/5/9.
//  Copyright © 2016年 Dean. All rights reserved.
//

import UIKit

class NetworkController  {
    static let sharedInstance = NetworkController() // singleton
    private init() {}

    func fnHttpTest(_url: String) -> Bool {
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://apis.haoservice.com/weather/city?key=93c921ea8b0348af8e8e7a6a273c41bd")!)
        // 这块就是区别啦，其实也差不多
        request.HTTPMethod = "POST"
//        let postString = "id=13&name=Jack"
//        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {
            (data:NSData?,response:NSURLResponse?,error:NSError?)->Void in
            if error == nil{
                do
                {
                    let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    print("Post --- > \(responseString)")
                }
                catch
                {
                    print("have catch")
                }
            }
        })
        task.resume()
        
        
        return true
    }
}
