//
//  imageEditViewController.swift
//  PhotoEditor
//
//  Created by Robert Lin on 2022/8/17.
//

import UIKit

class imageEditViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var mirrorView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    //selectItem儲存上一頁傳過來的圖片
    var selectItem = UIImage()
    //renderImage儲存最後編輯完輸出的圖片
    var renderImage = UIImage()
    //editedImage儲存這一頁編輯完的圖片
    var editedImage = UIImage()
    
    //顯示現在是哪個編輯畫面的圓點property
    @IBOutlet var dotImageViews: [UIImageView]!
    
    //調整照片亮度、對比、飽和度需要的property
    @IBOutlet weak var dialEditButton: UIButton!
    
    //連接到濾鏡編輯畫面的按鈕
    @IBOutlet weak var filterEditButton: UIButton!
    
    //連接到編輯圖片尺寸畫面的按鈕
    @IBOutlet weak var ratioEditButton: UIButton!
    
    //裝飾照片用的property
    @IBOutlet weak var decorationView: UIView!
    @IBOutlet weak var addFontButton: UIButton!
    @IBOutlet weak var fontSizeButton: UIButton!{
        didSet{
            fontSizeButton.configurationUpdateHandler = {
                fontSizeButton in fontSizeButton.alpha = fontSizeButton.isSelected ? 1 : 0.4
                // 1 : 0.4，代表按鈕在 isSelected 狀態時的透明度是1，normol 狀態時透明度是 0.4
            }
        }
    }
    
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontColorButton: UIButton!{
        didSet{
            fontColorButton.configurationUpdateHandler = {
                fontColorButton in fontColorButton.alpha = fontColorButton.isSelected ? 1 : 0.4
                // 1 : 0.4，代表按鈕在 isSelected 狀態時的透明度是1，normol 狀態時透明度是 0.4
            }
        }
    }
    
    @IBOutlet weak var addStickerButton: UIButton!
    @IBOutlet weak var adjustFontView: UIView!
    @IBOutlet weak var selectStickerView: UIView!
    
    //儲存文字跟貼圖的property
    var text = UITextField()
    var sticker = UIImageView()
    
    //儲存圖片水平旋轉狀態的property
    var mirrorNum = 1
    //儲存圖片向左旋轉次數的property
    var turnNum = 1
    
    //重設圖片的button
    @IBOutlet weak var resetButton: UIButton!
    
    //---
    
    
    //圖片檔案傳輸
    init?(coder: NSCoder, selectItem: UIImage){
        self.selectItem = selectItem
        super.init(coder: coder)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //點選畫面任一處收鍵盤
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    
    @objc func closeKeyboard() {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectItem
        for i in 0...2{
            dotImageViews[i].isHidden = true
        }
        //按return鍵收鍵盤
        text.addTarget(self, action: #selector(closeKeyboard), for: .editingDidEndOnExit)
        
        //---
        

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
