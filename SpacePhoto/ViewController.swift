//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Arda Toprak on 6.03.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var copyrightLabel: UILabel!
    
    // MARK: - Properties
    let networkController = NetworkController()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        networkController.fetchPhotoInfo { photoInfo in
            guard let photoInfo = photoInfo else { return }
            
            
            //  Grand Central Dispatch
            DispatchQueue.main.async {
                // Main queue
                self.title = photoInfo.title
                self.descriptionLabel.text = photoInfo.description
                
                if let copyright = photoInfo.copyright {
                    self.copyrightLabel.text = copyright
                }else {
                    self.copyrightLabel.isHidden = true
                }
            }
        }
    }
    
    // MARK: - Functions
    
    // MARK: - Actions
    
}

