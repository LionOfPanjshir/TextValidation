//
//  ViewController2.swift
//  TextValidation
//
//  Created by Andrew Higbee on 10/1/23.
//

import UIKit

class ViewController2: UIViewController {
    
    var welcomeScreenLabelHolder: String = ""
    
    @IBOutlet weak var welcomeScreenLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeScreenLabel.text = welcomeScreenLabelHolder
        // Do any additional setup after loading the view.
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
