//
//  NoteTableViewController.swift
//  NoteAppDemo
//
//  Created by PhyuSandy Myat on 2023/11/08.
//

import UIKit
import Foundation

class NoteTableViewController: UITableViewController {

    var notesArray : [NoteModel] = []
//        NoteModel(todate: NoteUtility.getDateTime(), note: "new note 1"),
//        NoteModel(todate: NoteUtility.getDateTime(), note: "new note 2"),
//        NoteModel(todate: NoteUtility.getDateTime(), note: "new note 3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.editButtonItem.image = UIImage(systemName: K.trashImage)
        
        self.navigationItem.rightBarButtonItems?.first?.image = UIImage(systemName: K.documentPlusImage)
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if notesArray.count == 0 {
//            navigationItem.title = K.titleNoteIsEmpty
//            tableView.reloadData()
//        } else {
//            navigationItem.title = K.tableViewTitle
//        }
//    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if notesArray.count == 0 {
            return K.titleNoteIsEmpty
        } else {
            return K.emptyString
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "System", size: 18.0)
        header.textLabel?.textAlignment = NSTextAlignment.center
    }

    @IBAction func tapAddNoteButton(_ sender: Any) {
        guard let noteView = storyboard?.instantiateViewController(identifier: K.noteViewID) as? NoteUIViewController else {
            return
        }
        noteView.navigationItem.largeTitleDisplayMode = .never
        noteView.title = K.noteViewTitle
        noteView.noteDetail = K.emptyString
        noteView.completion = {text in
            self.navigationController?.popToRootViewController(animated: true)
            self.notesArray.append(NoteModel(todate: NoteUtility.getDateTime(), note: text))
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(noteView, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currNote = self.notesArray[indexPath.row]
        guard let noteView = storyboard?.instantiateViewController(identifier: K.noteViewID) as? NoteUIViewController else {
            return
        }
        noteView.navigationItem.largeTitleDisplayMode = .never
        noteView.title = K.noteViewTitle
        noteView.noteDetail = notesArray[indexPath.row].note
        
        noteView.completion = { text in
            self.navigationController?.popToRootViewController(animated: true)
            for note in self.notesArray {
                //print(note.todate)
                //print(currNote.todate)
                //print(text)
                if note.todate == currNote.todate {
                    self.notesArray[indexPath.row].note = text
                    break
                }
            }
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(noteView, animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.noteCellID, for: indexPath)

        let dateStr : String = NoteUtility.cutDateTimeToSeconds(DateTime: notesArray[indexPath.row].todate)
        cell.textLabel?.text = dateStr
        cell.detailTextLabel?.text = notesArray[indexPath.row].note
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the data row
            notesArray.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
//    override func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
//        if indexPath?.row == notesArray.count {
//            if notesArray.count == 0 {
//                navigationItem.title = K.titleNoteIsEmpty
//                tableView.reloadData()
//            } else {
//                navigationItem.title = K.tableViewTitle
//                tableView.reloadData()
//            }
//        }
//    }
    
    

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
