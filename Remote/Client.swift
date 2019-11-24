//
//  Commander.swift
//  Remote
//
//  Created by Klaus Meyer on 05.11.19.
//  Copyright © 2019 Klaus Meyer. All rights reserved.
//

import Foundation
import UIKit

class Client {
    func perform(cmd: RemoteCommand, completion: @escaping (Bool) -> Void) {
        UserDefaults.standard.synchronize()
        
        let host: String = UserDefaults.standard.string(forKey: "host")!
        let psk: String = UserDefaults.standard.string(forKey: "psk")!
        
        let xml: String = """
            <s:Envelope
                xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"
                s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
                <s:Body>
                    <u:X_SendIRCC xmlns:u="urn:schemas-sony-com:service:IRCC:1">
                        <IRCCCode>\(cmd.rawValue)</IRCCCode>
                    </u:X_SendIRCC>
                </s:Body>
            </s:Envelope>
        """;
        
        let session = URLSession.shared
        let url = URL(string: "http://\(host)/sony/IRCC")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("text/xml; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.setValue("\"urn:schemas-sony-com:service:IRCC:1#X_SendIRCC\"", forHTTPHeaderField: "SoapAction")
        request.setValue(psk, forHTTPHeaderField: "X-Auth-PSK")
        
        #if DEBUG
        print("--- REQUEST BODY: ---")
        print(xml)
        #endif
        
        let task = session.uploadTask(with: request, from: xml.data(using: .utf8)) { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            let success = error == nil && httpResponse != nil && httpResponse!.statusCode < 300
            
            #if DEBUG
            print("--- RESPONSE: ---")
            print(response.debugDescription)
            #endif
            
            completion(success)
        }
        
        task.resume()
    }
}
