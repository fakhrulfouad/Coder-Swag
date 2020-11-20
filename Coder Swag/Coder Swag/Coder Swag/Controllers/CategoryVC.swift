//
//  ViewController.swift
//  Coder Swag
//
//  Created by Muhammad Fakhrulghazi bin Mohd Fouad on 17/11/2020.
//

import UIKit

class CategoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.dataSource = self
        categoryTable.delegate = self 
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            
            /*
             Its the same as:
             let categories = DataService.instance.getCategories()
             let category = categories[indexPath.row]
             */
            
            cell.updateViews(category: category)
            
            //Dont write cell.imageView.image = category.imageName
            
            return cell
            
        } else {
            return CategoryCell()
        }
    }
    
    /*
     For func tableView below: We're gonna tap row and its gonna tell us which row was tapped and we can
        build out some logic in there
     -let category to grab appropriate category that was tapped
     -sender in performSegue is basically what data do we wanna pass in performSegue so that when prepareForSegue is called we can pass that over into our productsVC
     */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    
    /*
     initProducts below will set category for the viewcontroller
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let barBtn = UIBarButtonItem()
        barBtn.title = " "
        navigationItem.backBarButtonItem = barBtn
        if let productsVC = segue.destination as? ProductsVC {
            assert(sender as? Category != nil)
            productsVC.initProducts(category: sender as! Category)
            
        }
    }
    
    /*
     assert as a protection that will help you out. It is only for developer mode. Why dont we use guard statement or if let statement in the casting? Well, because the app requires it to be Category after as!. Its not chance, its not userbase where it might be something else. If that was the case, then you can use guard. Assertion will cause crash if it fails during development
     */
}

