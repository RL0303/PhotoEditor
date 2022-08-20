//
//  imageRatioEditViewController.swift
//  PhotoEditor
//
//  Created by Robert Lin on 2022/8/17.
//

import UIKit

class imageRatioEditViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    //editImage儲存上一頁傳過來的圖片，用來顯示在這裡的imageView中
    var editedImage = UIImage()
    //renderImage儲存這一頁編輯完輸出的圖片，用來傳回到上一頁
    var renderImage = UIImage()
    //cropFrame用來裝裁切框線的layer，以及作為截圖範圍
    var cropFrame = UIView()
    
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
        //顯示傳遞過來的圖片
        imageView.image = editedImage

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
