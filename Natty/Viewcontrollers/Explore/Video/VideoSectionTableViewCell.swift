//
//  VideoSectionTableViewCell'.swift
//  Natty
//
//  Created by Neil García on 11/8/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit


protocol VideoDelegate: class {
    func didTapFullScreen(videoNode: ASVideoNode?, videoSection: VideoSectionTableViewCell)
}



enum SoundState: Int {
    case muted = 0
    case on
}


/// Video section table view cell.
class VideoSectionTableViewCell: ASCellNode {
    
    var shouldPause = true
    
    var soundState = SoundState.muted
    weak var videoDelegate: VideoDelegate?
    
    let videoNode       = ASVideoNode()
    let titleLabel      = ASTextNode()
    let subtitleLabel   = ASTextNode()
    
//    let loadingActivityIndicator = ASDisplayNode { () -> UIView in
//        let activityIndicator = UIActivityIndicatorView(style: .white)
//        activityIndicator.color = .black
//        activityIndicator.backgroundColor = .black
//        return activityIndicator
//    }
    
   // let videoControls = VideoControlNode()
    let subtitleHeight  = 40.0
    let titleHeight     = 40.0
    let spaceBetweenTitleAndSubtitle = 2.0
    let spaceBetweenVideo = 16
    
    
    override init() {
        super.init()
        selectionStyle = .none
        automaticallyManagesSubnodes = true
        hideSeparator()
        videoNode.cornerRadius = 5.0
        videoNode.clipsToBounds = true
        videoNode.backgroundColor = ColorName.videoBackgroundColor.color
        videoNode.delegate = self
        videoNode.muted = false
        //videoNode.shouldAutoplay = true
    
        soundState = SoundState.muted
        videoNode.onDidLoad { (node) in
            self.videoNode.play()
            self.videoNode.shouldAutorepeat = true
        }
        clipsToBounds = true
    }
    
    convenience init(viewModel: VideoSectionViewModel, delegate: VideoDelegate) {
        self.init()
        self.videoDelegate = delegate
        let width = WindowSize.size.width - UIConstants.inset*2
        let height = width * 0.6
        videoNode.style.preferredSize = CGSize(width: width, height: height)
        
        if let videoURL = viewModel.videoURL {
            videoNode.asset = AVAsset(url: videoURL)
            videoNode.contentMode = .center
            videoNode.gravity = AVLayerVideoGravity.resizeAspectFill.rawValue
            videoNode.shouldAutorepeat = false
            videoNode.shouldCacheImage = true
        }
        titleLabel.attributedText = NSAttributedString(
            string: viewModel.title,
            attributes: [
                NSAttributedString.Key.font: FontFamily.SFProDisplay.bold.font(size: 25),
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.kern: -0.3
            ])
        subtitleLabel.attributedText = NSAttributedString(
            string: viewModel.subtitle,
            attributes: [
                NSAttributedString.Key.font: FontFamily.SFProDisplay.regular.font(size: 14),
                NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                NSAttributedString.Key.kern: -0.3
            ])
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
//        let centerActivityIndicatorSpec = ASCenterLayoutSpec(centeringOptions: ASCenterLayoutSpecCenteringOptions.XY, sizingOptions: ASCenterLayoutSpecSizingOptions.minimumXY, child: loadingActivityIndicator)
//
//        let overlaySpec = ASOverlayLayoutSpec(child: videoNode, overlay: centerActivityIndicatorSpec)
        let labelStack  =  ASStackLayoutSpec(
            direction: .vertical,
            spacing: 1,
            justifyContent: .start,
            alignItems: .start,
            children: [titleLabel, subtitleLabel])
        
        let stack  = ASStackLayoutSpec(
            direction: .vertical,
            spacing: CGFloat(spaceBetweenVideo),
            justifyContent: .start,
            alignItems: .stretch,
            children: [labelStack, videoNode])
        
        let insetLayout = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: UIConstants.inset, bottom: UIConstants.bottomPadding, right: UIConstants.inset), child: stack)

        return insetLayout
    }
}

extension VideoSectionTableViewCell: ASVideoNodeDelegate {
    
    func videoNode(_ videoNode: ASVideoNode, shouldChangePlayerStateTo state: ASVideoNodePlayerState) -> Bool {
        var returnValue = true
        switch state {
        case .paused:
            returnValue = shouldPause
            shouldPause = true
        default:
            break
        }
        return returnValue
    }
    
    func didTap(_ videoNode: ASVideoNode) {
        shouldPause = false
        if (videoNode.playerState == .playing) {
            self.videoDelegate?.didTapFullScreen(videoNode: videoNode, videoSection: self)
        }
        
    }
    
    func videoDidPlay(toEnd videoNode: ASVideoNode) {
    }
    
    func videoNodeDidStartInitialLoading(_ videoNode: ASVideoNode) {
        print("showLoading")
    }
    
    func videoNodeDidFinishInitialLoading(_ videoNode: ASVideoNode) {
        print("hideLoading")
    }
}
