//
//  ViewController.swift
//  LandMarkApp-TableViewExample
//
//  Created by Maddi on 29/11/20.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var landmarks = ["Dinajpur","Egypt","China","Mosque","Paris"]
    var images = [UIImage(named: "dinajpur"),UIImage(named: "egypt"),
                  UIImage(named: "china"),UIImage(named: "mosque"),
                  UIImage(named: "paris")]
    var selectedIndex:Int = -1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarks[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarks.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "secondView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondView"{
            let imageVc = segue.destination as! SecondViewController
            imageVc.label = landmarks[selectedIndex]
            imageVc.image = images[selectedIndex]!
        }
    }
}

