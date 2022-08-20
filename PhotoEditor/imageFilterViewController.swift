//
//  imageFilterViewController.swift
//  PhotoEditor
//
//  Created by Robert Lin on 2022/8/17.
//

import UIKit

class imageFilterViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    //editedImage是上一頁編輯後的UIImage
    var editedImage = UIImage()
    //renderImage儲存套用濾鏡後輸出的圖片，用來傳回到上一頁
    var renderImage = UIImage()
    
    //圖片檔案傳輸
    init?(coder: NSCoder, editedImage: UIImage){
        self.editedImage = editedImage
        super.init(coder: coder)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = editedImage
//        filterAdoptUI()

        // Do any additional setup after loading the view.
    }
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
