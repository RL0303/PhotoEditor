//
//  imageEditViewController.swift
//  PhotoEditor
//
//  Created by Robert Lin on 2022/8/17.
//

import UIKit

extension imageEditViewController: UIColorPickerViewControllerDelegate{
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        //讓文字顏色等於所選擇的顏色
        text.textColor = viewController.selectedColor
    }
}

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
    
    @IBAction func addFont(_ sender: Any) {
        adjustFontView.isHidden = false
        fontSizeButton.isSelected = true
        fontColorButton.isSelected = false
        fontSizeSlider.isHidden = false
        selectStickerView.isHidden = true
        //先判斷containerView中是否有文字，沒有的話才加入文字，有的話就不執行動作
        if containerView.subviews.contains(text) == false{
            //設定text field的相關屬性
            text.placeholder = "輸入文字" //提示字
            text.borderStyle = .none //外框風格
            text.textAlignment = .center //文字對齊方式
            text.font = UIFont.systemFont(ofSize: 30) //文字預設大小
            text.textColor = .black //文字顏色
            text.frame.size = CGSize(width: 250, height: 100) //text field外框大小
            text.allowsEditingTextAttributes = true //設定可編輯文字屬性（選取字之後會顯示可執行的動作）
            text.center = imageView.center //讓文字出現在image view的中間
            
            //加入text field到containerView中
            containerView.addSubview(text)
        }
        
    }
    
    @IBAction func showSlider(_ sender: Any) {
        fontSizeButton.isSelected = true
        fontColorButton.isSelected = false
        fontSizeSlider.isHidden = false
        
    }
    
    @IBAction func setFontSize(_ sender: Any) {
        text.font = UIFont.systemFont(ofSize: CGFloat(fontSizeSlider.value))
    }
    
    @IBAction func editFontColor(_ sender: Any) {
        fontSizeButton.isSelected = false
        fontColorButton.isSelected = true
        fontSizeSlider.isHidden = true
        
        //設定並呼叫選顏色的controller畫面
        let controller = UIColorPickerViewController()
        controller.delegate = self
        present(controller, animated: true)
        
        adjustFontView.isHidden = false
        fontSizeButton.isSelected = true
        fontColorButton.isSelected = false
        fontSizeSlider.isHidden = false
        selectStickerView.isHidden = true
    }
    
    @IBAction func showSticker(_ sender: Any) {
        selectStickerView.isHidden = false
        adjustFontView.isHidden = true
    }
    
//    ---
    
    //儲存圖片水平旋轉狀態的property
    var mirrorNum = 1
    //儲存圖片向左旋轉次數的property
    var turnNum = 1
    
    //水平翻轉
    @IBAction func mirrorRotate(_ sender: Any) {
        //mirrorNum除2餘1的時候，表示圖片未水平翻轉過，做水平翻轉
        if mirrorNum % 2 == 1{
            mirrorView.transform = CGAffineTransform(scaleX: -1, y: 1)
        //mirrorNum除2餘0的時候，表示圖片已經翻轉過，轉回圖片原本的方向
        }else if mirrorNum % 2 == 0{
            mirrorView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        //每做完一次翻轉mirrorNum就+1，以判斷圖片現在的狀態
        mirrorNum += 1
        
    }
    
    
    //向左旋轉90度
    @IBAction func turnLeft(_ sender: Any) {
        //mirrorNum除2餘1，表示照片沒有水平翻轉過，仍是原本的方向
        if mirrorNum % 2 == 1{
            //判斷照片旋轉幾次，所以turnNum等於1~3的時候，要向左旋轉
            if turnNum < 4{
                //旋轉角度乘以-1代表逆時針旋轉
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2 * -1 * CGFloat(turnNum))
            //turnNum等於4表示回到原本方向了，不需旋轉，所以讓旋轉值值歸0
            }else if turnNum == 4{
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2 * 0)
                //讓turnNum等於0是因為最後會再+1，才會回到初始值
                turnNum = 0
            }
        //mirrorNum除2餘0，表示照片水平翻轉過，旋轉方向需改變
        }else if mirrorNum % 2 == 0{
            if turnNum < 4{
                //以照片視角來說，x軸顛倒，所以向右轉才是左轉
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2 * 1 * CGFloat(turnNum))
            }else if turnNum == 4{
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2 * 0)
                turnNum = 0
            }
        }
        turnNum += 1
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
