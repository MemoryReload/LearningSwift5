//
//  ViewController.swift
//  project1
//
//  Created by 何平 on 2020/11/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        print("\(pictures)")
        
        self.title = "Storm Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true;
        
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//        if let controller = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailController {
//            controller.imageName = pictures[indexPath.row]
//            navigationController?.pushViewController(controller, animated: true)
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue identifier: \(String(describing: segue.identifier)) source: \(segue.source) destination: \(segue.destination) sender:\(String(describing: sender))")
        if let cell = sender as? UITableViewCell {
            if let indexPath = tableView.indexPath(for: cell) {
                let imageName = pictures[indexPath.row]
                if let detailVC = segue.destination as? DetailController {
                    detailVC.imageName = imageName
                }
            }
        }
    }
}

