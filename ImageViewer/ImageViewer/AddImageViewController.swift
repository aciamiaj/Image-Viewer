//
//  AddImageViewController.swift
//  ImageViewer
//
//  Created by user232105 on 3/25/23.
//

import UIKit

class AddImageViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    // Declare a delegate object that conforms to the AddImageDelegate protocol
    var delegate: AddImageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func addClicked(_ sender: UIButton) {
        guard let title = titleTextField.text, !title.isEmpty,
              let urlString = urlTextField.text,
              let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                let newImage = Image(title: title, url: url, image: image)
                self.delegate?.addImage(newImage, withTitle: title)
                self.dismiss(animated: true, completion: nil)
            }
        }
        task.resume()
    }
    
    @IBAction func cancelClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
