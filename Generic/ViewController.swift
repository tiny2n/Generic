//
//  ViewController.swift
//  Generic
//
//  Created by joongkwan.choi on 15/10/2018.
//  Copyright © 2018 tiny2n. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    private var items: [BookModel] = []
    
    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func onRefreshTouchUpInside(_ sender: Any) {
        do {
            items = try Data.value("items")
        }
        catch {
            print(error)
        }
        
        assert(items.count > 0, "[Assert] book items is empty")
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Identifier", for: indexPath) as! BookTableViewCell
        let item = items[indexPath.row]
        cell.configure(item)
        
        
        return cell
    }
}



/*
struct AStructure: ADecodable {
    let intValue: Int

    init(from decoder: ADecoder) throws {
        intValue = try decoder.decode(Int.self, forKey: CodingKeys.intValue)
    }

    enum CodingKeys: String {
        case intValue
    }
}
*/
