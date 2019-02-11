//
//  VideoFullScreenViewController.swift
//  Natty
//
//  Created by Neil García on 11/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit
import Transitional

class VideoFullScreenViewController: UIViewController {
    
    // MARK: - Vars
    weak var videoCellSection: VideoSectionTableViewCell?
    fileprivate var videoURL: URL!
    
    fileprivate var asset: AVURLAsset!
    var playerItem: AVPlayerItem!
    fileprivate var player: AVPlayer!
    fileprivate var playerLayer: AVPlayerLayer!
    fileprivate var assetGenerator: AVAssetImageGenerator!
    
    fileprivate var longPressGestureRecognizer: UILongPressGestureRecognizer!
    fileprivate var swipeGestureRecognizer: UISwipeGestureRecognizer!
    
    fileprivate var previousLocationX: CGFloat = 0.0
    
    fileprivate let rewindDimView = UIVisualEffectView()
    fileprivate let rewindContentView = UIView()
    public let rewindTimelineView = TimelineView()
    fileprivate let rewindPreviewShadowLayer = CALayer()
    fileprivate let rewindPreviewImageView = UIImageView()
    fileprivate let rewindCurrentTimeLabel = UILabel()
    
    
    var videoNode: ASVideoNode?
    /// Indicates the maximum height of rewindPreviewImageView. Default value is 112.
    open var rewindPreviewMaxHeight: CGFloat = 112.0 {
        didSet {
            assetGenerator.maximumSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: rewindPreviewMaxHeight * UIScreen.main.scale)
        }
    }
    
    /// Indicates whether player should start playing on viewDidLoad. Default is true.
    open var autoplays: Bool = true
    
    var videoSectionViewModel = VideoSectionViewModel()
    
    
    var isAlreadyPresenting = false
    
    override var prefersStatusBarHidden: Bool {
        return isAlreadyPresenting
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.isAlreadyPresenting = true
            UIView.animate(withDuration: 0.25) {
                self.setNeedsStatusBarAppearanceUpdate()
            }
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
         NotificationCenter.default.addObserver(self, selector: #selector(VideoFullScreenViewController.finishVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        //play()
    }
    // MARK: -
    
    override open func loadView() {
        super.loadView()
    }
    
    func initUI() {
        
//        [[AVAudioSession sharedInstance]
//            setCategory: AVAudioSessionCategoryPlayback
//            error: nil];
//
        //AVAudioSession.sharedInstance().setCategory(.playback, mode: <#T##AVAudioSession.Mode#>, options: <#T##AVAudioSession.CategoryOptions#>)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
        
        // try! AVAudioSession.sharedInstance().setCategory(.playback, options: [])
        
        videoNode?.style.preferredSize = view.bounds.size
        if let videoNode = self.videoNode,let currentItem = videoNode.currentItem, let urlAsset = currentItem.asset as? AVURLAsset {
            player = videoNode.player!
            playerItem = currentItem
            asset = urlAsset
            if (currentItem.duration == currentItem.currentTime()) {
                playerItem.seek(to: CMTime.zero, completionHandler: nil)
            }
        }
        
        playerLayer = AVPlayerLayer(player: player)
        
        assetGenerator = AVAssetImageGenerator(asset: asset)
        assetGenerator.maximumSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: rewindPreviewMaxHeight * UIScreen.main.scale)
        
       // view.backgroundColor = .black
        view.layer.insertSublayer(playerLayer, at: 0)
       // view.layer.addSublayer(playerLayer)
        
        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(VideoFullScreenViewController.longPressed(_:)))
        longPressGestureRecognizer.minimumPressDuration = 0.2
        view.addGestureRecognizer(longPressGestureRecognizer)
        
        
        
        swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(VideoFullScreenViewController.finishVideo))
        swipeGestureRecognizer.direction = .down
        view.addGestureRecognizer(swipeGestureRecognizer)
        view.addSubview(rewindDimView)
        
        rewindContentView.alpha = 0.0
        //view.insertSubview(rewindContentView, at: 0)
        view.addSubview(rewindContentView)
        
        rewindTimelineView.duration = CMTimeGetSeconds(asset.duration)
        rewindTimelineView.currentTimeDidChange = { [weak self] (currentTime) in
            guard let strongSelf = self, let playerItem = strongSelf.playerItem, let assetGenerator = strongSelf.assetGenerator else { return }
            
            let minutesInt = Int(currentTime / 60.0)
            let secondsInt = Int(currentTime) - minutesInt * 60
            strongSelf.rewindCurrentTimeLabel.text = (minutesInt > 9 ? "" : "0") + "\(minutesInt)" + ":" + (secondsInt > 9 ? "" : "0") + "\(secondsInt)"
            
            let requestedTime = CMTime(seconds: currentTime, preferredTimescale: playerItem.currentTime().timescale)
            
            assetGenerator.generateCGImagesAsynchronously(forTimes: [NSValue(time: requestedTime)]) { [weak self] (_, CGImage, _, _, _) in
                guard let strongSelf = self, let CGImage = CGImage else { return }
                let image = UIImage(cgImage: CGImage, scale: UIScreen.main.scale, orientation: .up)
                
                DispatchQueue.main.async {
                    strongSelf.rewindPreviewImageView.image = image
                    
                    if strongSelf.rewindPreviewImageView.bounds.size != image.size {
                        strongSelf.viewWillLayoutSubviews()
                    }
                }
            }
        }
        rewindContentView.addSubview(rewindTimelineView)
        
        rewindCurrentTimeLabel.text = " "
        rewindCurrentTimeLabel.font = .systemFont(ofSize: 16.0)
        rewindCurrentTimeLabel.textColor = .white
        rewindCurrentTimeLabel.textAlignment = .center
        rewindCurrentTimeLabel.sizeToFit()
        rewindContentView.addSubview(rewindCurrentTimeLabel)
        
        rewindPreviewShadowLayer.shadowOpacity = 1.0
        rewindPreviewShadowLayer.shadowColor = UIColor(white: 0.1, alpha: 1.0).cgColor
        rewindPreviewShadowLayer.shadowRadius = 15.0
        rewindPreviewShadowLayer.shadowOffset = .zero
        rewindPreviewShadowLayer.masksToBounds = false
        rewindPreviewShadowLayer.actions = ["position": NSNull(), "bounds": NSNull(), "shadowPath": NSNull()]
        rewindContentView.layer.addSublayer(rewindPreviewShadowLayer)
        
        rewindPreviewImageView.contentMode = .scaleAspectFit
        rewindPreviewImageView.layer.mask = CAShapeLayer()
        
        
        rewindContentView.addSubview(rewindPreviewImageView)
        
        
    }
    
    // MARK: - Methods
    
    /// Resumes playback
    open func play() {
        player.play()
    }
    
    /// Pauses playback
    open func pause() {
        player.pause()
    }
    
    @objc open func longPressed(_ gesture: UILongPressGestureRecognizer) {
        let location = gesture.location(in: gesture.view!)
        rewindTimelineView.zoom = (location.y - rewindTimelineView.center.y - 10.0) / 30.0
        
        if gesture.state == .began {
            player.pause()
            rewindTimelineView.initialTime = CMTimeGetSeconds(playerItem.currentTime())
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: {
                self.rewindDimView.effect = UIBlurEffect(style: .dark)
                self.rewindContentView.alpha = 1.0
            }, completion: nil)
        } else if gesture.state == .changed {
            rewindTimelineView.rewindByDistance(previousLocationX - location.x)
        } else {
            player.play()
            
            let newTime = CMTime(seconds: rewindTimelineView.currentTime, preferredTimescale: playerItem.currentTime().timescale)
            playerItem.seek(to: newTime) {(sikked) in
                
            }
            //playerItem.seek(to: newTime)
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: {
                self.rewindDimView.effect = nil
                self.rewindContentView.alpha = 0.0
            }, completion: nil)
        }
        
        if previousLocationX != location.x {
            previousLocationX = location.x
        }
    }
    

    // MARK: - Layout
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        playerLayer.frame = view.bounds
        rewindDimView.frame = view.bounds
        
        rewindContentView.frame = view.bounds
        
        let timelineHeight: CGFloat = 10.0
        let verticalSpacing: CGFloat = 25.0
        
        let rewindPreviewImageViewWidth = rewindPreviewImageView.image?.size.width ?? 0.0
        rewindPreviewImageView.frame = CGRect(x: (rewindContentView.bounds.width - rewindPreviewImageViewWidth) / 2.0, y: (rewindContentView.bounds.height - rewindPreviewMaxHeight - verticalSpacing - rewindCurrentTimeLabel.bounds.height - verticalSpacing - timelineHeight) / 2.0, width: rewindPreviewImageViewWidth, height: rewindPreviewMaxHeight)
        rewindCurrentTimeLabel.frame = CGRect(x: 0.0, y: rewindPreviewImageView.frame.maxY + verticalSpacing, width: rewindTimelineView.bounds.width, height: rewindCurrentTimeLabel.frame.height)
        rewindTimelineView.frame = CGRect(x: 0.0, y: rewindCurrentTimeLabel.frame.maxY + verticalSpacing, width: rewindContentView.bounds.width, height: timelineHeight)
        rewindPreviewShadowLayer.frame = rewindPreviewImageView.frame
        
        let path = UIBezierPath(roundedRect: rewindPreviewImageView.bounds, cornerRadius: 5.0).cgPath
        rewindPreviewShadowLayer.shadowPath = path
        (rewindPreviewImageView.layer.mask as! CAShapeLayer).path = path
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        
    }
    
    @objc func finishVideo() {
        if let videoSectionCell = videoCellSection {
            videoSectionCell.videoNode.currentItem?.seek(to:  CMTime.zero, completionHandler: nil)
            transitionalDismissal(TransitionalAnimationStyle.zoomOut)
            //dismiss(animated: true, completion: nil)
        }
       
    }
    
}

//extension VideoFullScreenViewController: ASVideoNodeDelegate {
//    func videoDidPlay(toEnd videoNode: ASVideoNode) {
//        finishVideo()
//    }
//
//}
