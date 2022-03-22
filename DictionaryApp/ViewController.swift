//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Минтимер Харасов on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {
    var language = Language.Ru
    var dictionaryArray: Array<Word> = [
    Word(word: "Привет", translation: "Hello", transcription: "[transcription]", example: "[example]"),
    Word(word: "Доброе утро", translation: "Good morning", transcription: "[transcription]", example: "[example]"),
    Word(word: "Добрый день", translation: "Good afternoon", transcription: "[transcription]", example: "[example]"),
    Word(word: "Добрый вечер", translation: "Good evening", transcription: "[transcription]", example: "[example]"),
    Word(word: "Как твои дела?", translation: "How are you?", transcription: "[transcription]", example: "[example]"),
    ]

    @IBOutlet weak var languageButton: UIBarButtonItem!
    @IBOutlet weak var dictionaryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func switchLanguageButton(_ sender: UIBarButtonItem) {
        language = language == Language.Ru ? Language.En : Language.Ru
        dictionaryTableView.reloadData()
    }
    


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionaryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WordTVCell else {return UITableViewCell()}
        let word = dictionaryArray[indexPath.row]
        if language == Language.Ru {
            cell.wordLabel.text = word.word
        } else {
            cell.wordLabel.text = word.translation
        }
        return cell
    }
}

