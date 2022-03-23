//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Минтимер Харасов on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    var language = Language.Ru
    var dictionaryArray: Array<Word> = [
        Word(word: "Привет", translation: "Hello", transcription: "[həˈləʊ]", example: ["Hello, my friend!", "I want to say hello."]),
        Word(word: "Доброе утро", translation: "Good morning", transcription: "[transcription]", example: ["[example]"]),
        Word(word: "Добрый день", translation: "Good afternoon", transcription: "[transcription]", example: ["[example]"]),
        Word(word: "Добрый вечер", translation: "Good evening", transcription: "[transcription]", example: ["[example]"]),
        Word(word: "Как твои дела?", translation: "How are you?", transcription: "[transcription]", example: ["[example]"]),
    ]
    var filteredDictionaryArray: Array<Word> = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var languageButton: UIBarButtonItem!
    @IBOutlet weak var dictionaryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search a Word"
    }
    
    
    @IBAction func switchLanguageButton(_ sender: UIBarButtonItem) {
        if language == Language.Ru {
            language = Language.En
            languageButton.title = Language.En.rawValue
        } else {
            language = Language.Ru
            languageButton.title = Language.Ru.rawValue
        }
        dictionaryTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "infoSegue",
              let navVC = segue.destination as? UINavigationController,
              let vc = navVC.topViewController as? WordInfoTVController,
              let indexPath = dictionaryTableView.indexPathForSelectedRow
        else {return}
        if isFiltering {
            vc.word = filteredDictionaryArray[indexPath.row]
        } else {
            vc.word = dictionaryArray[indexPath.row]
        }
    }
    
    //Filtering the table view
    func filterSearchResult(_ searchText: String) {
        filteredDictionaryArray = dictionaryArray.filter { (word: Word) -> Bool in
            if language == Language.Ru {
                return word.word.lowercased().contains(searchText.lowercased())
            } else {
                return word.translation.lowercased().contains(searchText.lowercased())
            }
            
        }
        dictionaryTableView.reloadData()
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredDictionaryArray.count
        }
        return dictionaryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WordTVCell else {return UITableViewCell()}
        let word: Word
        if isFiltering {
            word = filteredDictionaryArray[indexPath.row]
        } else {
            word = dictionaryArray[indexPath.row]
        }
        if language == Language.Ru {
            cell.wordLabel.text = word.word
        } else {
            cell.wordLabel.text = word.translation
        }
        return cell
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterSearchResult(searchBar.text!)
    }
}

