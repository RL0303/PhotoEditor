//
//  ViewController.swift
//  PhotoEditor
//
//  Created by Robert Lin on 2022/8/17.
//

import UIKit
import PhotosUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PHPickerViewControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //儲存點選的照片資訊的property，利用參數 info的.originalImage取得圖片相關資料
        let photo = info[.originalImage] as? UIImage
        self.coverView.isHidden = true
        dismiss(animated: true) {
            self.photoImage = photo!
            self.selectedImageView.image = self.photoImage
            self.editButton.isHidden = false
        }
        
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        <#code#>
    }
    
    //宣告儲存拍照的照片或是選擇相簿照片的變數
    var photoImage = UIImage()

    @IBOutlet weak var coverView: UIView!
    
    @IBOutlet weak var selectedImageView: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.isHidden = true
        
        // Do any additional setup after loading the view.
    }

    @IBAction func takePhoto(_ sender: Any) {
        let controller = UIImagePickerController()
        //sourceType設為.camera代表呼叫controller是用來開啟相機
        controller.sourceType = .camera
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func selectImage(_ sender: Any) {
        var configuration = PHPickerConfiguration()
        //PHPickerConfiguration可以設定選擇照片或影片，nil則兩種都可以選擇，我們只要選擇照片，所以設定 .images
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    
    
}

