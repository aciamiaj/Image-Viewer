//
//  ViewController.swift
//  ImageViewer
//
//  Created by user232105 on 3/25/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, AddImageDelegate {
    
    var images: [(title: String, image: Image)] = []
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        imageView.image = UIImage(named: "noimage")
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func addImage(_ image: Image, withTitle title: String) {
        images.append((title: title, image: image))
        imageView.image = image.image
        pickerView.reloadAllComponents()
        pickerView.selectRow(images.count-1, inComponent: 0, animated: true)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = images[row].image.image
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return images[row].title
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addImageVC = segue.destination as? AddImageViewController {
            addImageVC.delegate = self
        }
    }
   
    @IBAction func addImageClicked(_ sender: UIButton) {
            let addImageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddImageViewController") as! AddImageViewController
            addImageViewController.delegate = self
            self.present(addImageViewController, animated: true, completion: nil)
        }

}



