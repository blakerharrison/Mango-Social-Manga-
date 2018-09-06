//
//  MangaDetail.swift
//  Mango (Social Manga)
//
//  Created by Blake Harrison on 9/6/18.
//  Copyright © 2018 Blake Harrison. All rights reserved.
//

import UIKit

var selectedIndex = 0

class MangaDetail: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var mangaImage: UIImageView!
    @IBOutlet weak var mangaTitle: UILabel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        print(searchedMangaList[selectedIndex].t!)
        
        mangaTitle.text = searchedMangaList[selectedIndex].t!
        setImage()
        
//        mangaTitle.text = filtere
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        selectedIndex = 0
    }

    //MARK: - Methods
    func setImage() {
        
        guard let url = URL(string: "https://cdn.mangaeden.com/mangasimg/" + searchedMangaList[selectedIndex].im!) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Failed fetching image:", error!)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Not a proper HTTPURLResponse or statusCode")
                
                let alert = UIAlertController(title: "Connection Error", message: "404", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                return
            }
            
            DispatchQueue.main.async {
                self.mangaImage.image = UIImage(data: data!)
            }
            }.resume()
    }
    
}
