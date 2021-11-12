//
//  ViewController.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 31/08/2021.
//

import UIKit
//import MOLH
//import CHIPageControl


class ChooseLanguageVC: UIViewController {
    
    //MARK: - Variables
    
    var imgArr = [#imageLiteral(resourceName: "splash"),#imageLiteral(resourceName: "hourseProfile"),#imageLiteral(resourceName: "select lang")]
    var index = 0
    var timer: Timer?
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var englishBtnOutlet: UIButton!{
        didSet{
            englishBtnOutlet.layer.cornerRadius = englishBtnOutlet.frame.height / 2
        }
    }
    @IBOutlet weak var arabicBtnOutlet: UIButton!{
        didSet{
            arabicBtnOutlet.layer.cornerRadius = arabicBtnOutlet.frame.height / 2
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPageControll()
        playSlider()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    
    //MARK: - HelperFunctions
    func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func setupPageControll(){
        pageControl.numberOfPages = imgArr.count
        //        pageControl.backgroundStyle = .prominent
        //
        //        pageControl.preferredIndicatorImage = UIImage(named: "selected")
        //
        //        pageControl.setIndicatorImage(UIImage(named: "unselected"), forPage: 0)
        //        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0, green: 0.5076485276, blue: 0.6416093707, alpha: 1)
        //        pageControl.layer.borderColor = #colorLiteral(red: 0, green: 0.5076485276, blue: 0.6416093707, alpha: 1)
        //        pageControl.pageIndicatorTintColor?.setStroke()
        //        pageControl.pageIndicatorTintColor = .white
    }
    
    
    //MARK: - IBActions
    @IBAction func arabicBtnPressed(_ sender: UIButton) {
        //  MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "ar")
        LocalizationManager.ChangeLanguage()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTabBarVC") as! MainTabBarVC
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    @IBAction func englishBtnPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTabBarVC") as! MainTabBarVC
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
}
//MARK: - UICollectionView Delegates

extension ChooseLanguageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseLangCell", for: indexPath) as! ChooseLangImgSliderCell
        cell.imageOutlet.image = imgArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

//MARK: - Image Slider

extension ChooseLanguageVC{
    
    @objc func checkIndex(){
        index = index != imgArr.count - 1 ?  index + 1 : 0
        pageControl.currentPage = index
        collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func playSlider(){
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.checkIndex), userInfo: nil, repeats: true)
    }
}

