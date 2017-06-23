//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
    
    
    var notes:[Note] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = CoreDataHelper.retrieveNotes()
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            CoreDataHelper.deleteNote(note: notes[indexPath.row])
            
            notes = CoreDataHelper.retrieveNotes()
            
        }
    }
    
    
    // 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notes.count
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
//
//        // 2
        cell.noteTitleLabel.text = "note's title!!"
        cell.noteModificationTimeLabel.text = "note's modification time"
        
        //return cell
        
        let row = indexPath.row
        let note = notes[row]
        
        // 3
        cell.noteTitleLabel.text = note.title
        print("The note title contains: \(String(describing: note.title))")
        
        // 4
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString()
        return cell
        
        
        
        
        
    }



            
            
            
    //identifying row of selected note
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                print("Table view cell tapped")
                
                let indexPath = tableView.indexPathForSelectedRow!
                let note = notes[indexPath.row]
                let displayNoteViewController = segue.destination as! DisplayNoteViewController
                displayNoteViewController.noteModify = note
                
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
    }
    

    
    


        
        //unwind segues
        @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
            
            self.notes = CoreDataHelper.retrieveNotes()
            
        }
}


