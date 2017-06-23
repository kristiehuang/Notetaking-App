//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var noteModify:Note?
    
    
    
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    @IBOutlet weak var noteContentTextView: UITextView!
    
    
    //diSPLAy
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1
        if let note = noteModify {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
            print("This is an existing note and is being edited")
        } else {
            // 3
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
            print("This is a new note")
        }
    }
    
    
    
    
    //cancel/save functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            // 1
            let listNotesTableViewController = segue.destination as! ListNotesTableViewController
            
            
            //cancel segue
            if identifier == "cancel" {
                print("Cancel button tapped")
                
                
                
                //save segue + function
            } else if identifier == "save" {
                print("Save button tapped")
                let note = self.noteModify ?? CoreDataHelper.createNote()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = Date() as NSDate
                CoreDataHelper.saveNote()
                    
                    
                }
            

                    else{
                        let newNote = Note ()
                        newNote.title = noteTitleTextField.text ?? ""
                        newNote.content = noteContentTextView.text ?? ""
                        listNotesTableViewController.notes.append(newNote)
                    
                    }
                    
                    
//                //"untitled note" title
//                let note = Note()
//                    if let noteTitle = noteTitleTextField.text {
//                    note.title = noteTitle
//                    
//                    
//                    if noteTitle.isEmpty {
//                        note.title = "Untitled Note"
//                    }
//                }
                
                
            }
        }
        

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
