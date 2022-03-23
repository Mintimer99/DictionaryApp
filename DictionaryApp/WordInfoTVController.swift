//
//  WordInfoTVController.swift
//  DictionaryApp
//
//  Created by Минтимер Харасов on 22.03.2022.
//

import UIKit

class WordInfoTVController: UITableViewController {

    var word = Word(word: "Word", translation: "Translation", transcription: "Transcription", example: ["Example", "Another example", "final example"])
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "backSegue",
            let vc = segue.destination as? ViewController,
            let indexPath = vc.dictionaryTableView.indexPathForSelectedRow
        else {return}
        vc.dictionaryTableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return word.example.count
        } else {
            return 1
        }
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath) as? WordTVCell else {return UITableViewCell()}
        switch indexPath.section {
        case 0: cell.wordLabel.text = word.word
        case 1: cell.wordLabel.text = word.translation
        case 2: cell.wordLabel.text = word.transcription
        case 3: cell.wordLabel.text = word.example[indexPath.row]
        default:
            break
        }
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Word"
        case 1: return "Translation"
        case 2: return "Transcription"
        case 3: return "Examples"
        default: return ""
        }
    }
    
}
