//
//  NoteUIViewController.swift
//  NoteAppDemo
//
//  Created by PhyuSandy Myat on 2023/11/08.
//

import UIKit

class NoteUIViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var noteDetail : String = K.emptyString
    
    public var completion : ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = noteDetail
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            //print("viewWillDisappear")
            if let text = textView.text {
                completion?(text)
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
