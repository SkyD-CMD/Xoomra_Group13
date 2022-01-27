//
//  AccommodationsViewController.swift
//  Xoomra
//
//  Created by Nur Rony on 22/01/2022.
//

import UIKit
import Firebase

class AccommodationsViewController: UIViewController {
    
    
   private var listofacc = [Accommodation]()
    private var accocollection: CollectionReference!
   
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        
       
        
        print("Loading view")
        
        
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)

        setupUI()
        setupTableView()
        
//        let db = Firestore.firestore()
//        db.collection("Listing").addDocument(data: ["Aname":"House","Date":Date(),"AvailableRooms": 4])
//
        accocollection = Firestore.firestore().collection("AccommodationList")
        accocollection.getDocuments{ [self] (snapshot, error) in
            if let error = error {
                print("An error occured")
            }else{
                guard let snap = snapshot else {return}
                for document in snap.documents{
                    let data = document.data()
                    let aname = data["Aname"] as? String ?? "Anonymous"
                    let availableRooms = data["AvailableRooms"] as? Int ?? 0
                    let City = data["City"] as? String ?? "Anonymous"
                    let newEntry = Accommodation(aname: aname, availableRooms: availableRooms, City: City)
                    listofacc.append(newEntry)
                    
                    
                }
                tableView.reloadData()
            }
        }
        
        
        print("Array elements are: \(listofacc)")
        
        
      
        
        
        
        
        
        
    }
    
    // MARK: - Private Methods.
    
    private func setupUI(){
        tableView.separatorStyle = .none
    }
    private func setupTableView(){
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Button Action.
    
    

}

extension AccommodationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listofacc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
        
//        cell.configureCell(list: list[indexPath.row])
        cell.configureCell(listofacc: listofacc[indexPath.row])
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select index--: ", indexPath.row)
        
        let storyboard = storyboard?.instantiateViewController(withIdentifier: "AccommodationsDetailsViewController")
        self.navigationController?.pushViewController(storyboard!, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400;//Choose your custom row height
    }
}
