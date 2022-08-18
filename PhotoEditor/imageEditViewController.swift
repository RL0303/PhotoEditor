//
//  imageEditViewController.swift
//  PhotoEditor
//
//  Created by Robert Lin on 2022/8/17.
//

import UIKit

class imageEditViewController: UIViewController {
    
    //selectItem儲存上一頁傳過來的圖片
    var selectItem = UIImage()
    //renderImage儲存最後編輯完輸出的圖片
    var renderImage = UIImage()
    //editedImage儲存這一頁編輯完的圖片
    var editedImage = UIImage()
    
    //圖片檔案傳輸
    init?(coder: NSCoder, selectItem: UIImage){
        self.selectItem = selectItem
        super.init(coder: coder)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
