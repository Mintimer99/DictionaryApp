//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Минтимер Харасов on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var languageButton: UIBarButtonItem!
    @IBOutlet weak var dictionaryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func switchLanguageButton(_ sender: UIBarButtonItem) {
    }
    


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WordTVCell else {return UITableViewCell()}
        return cell
    }
    
    
    
    
}

