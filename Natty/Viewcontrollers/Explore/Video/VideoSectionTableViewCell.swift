//
//  VideoSectionTableViewCell'.swift
//  Natty
//
//  Created by Neil García on 11/8/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit


enum SoundState: Int {
    case muted = 0
    case on
}


/// Video section table view cell.
class VideoSectionTableViewCell: ASCellNode, ASVideoNodeDelegate {
    
    var soundState = SoundState.muted
    
    let videoNode       = ASVideoNode()
    let titleLabel      = ASTextNode()
    let subtitleLabel   = ASTextNode()
    let subtitleHeight  = 40.0
    let titleHeight     = 40.0
    let spaceBetweenTitleAndSubtitle = 2.0
    let spaceBetweenVideo = 16
   // let centerButton = ASButtonNode()
   // let soundButton  = ASButtonNode()
   // let soundButtonSize: CGFloat = 30.0
    override init() {
        super.init()
        selectionStyle = .none
        automaticallyManagesSubnodes = true
        hideSeparator()
        videoNode.cornerRadius = 5.0
        videoNode.clipsToBounds = true
        videoNode.backgroundColor = ColorName.videoBackgroundColor.color
        videoNode.delegate = self
        videoNode.muted = true
        soundState = SoundState.muted
//        soundButton.style.preferredSize = CGSize(width: soundButtonSize, height: soundButtonSize)
//        soundButton.setBackgroundImage(Asset.volumeOffIcon.image, for: .normal)
//        soundButton.addTarget(self, action: #selector(VideoSectionTableViewCell.soundButtonPressed), forControlEvents: .touchDown)
        clipsToBounds = true
    }
    
    convenience init(viewModel: VideoSectionViewModel) {
        self.init()
        
        let width = WindowSize.size.width - UIConstants.inset*2
        let height = width * 0.6
    
        videoNode.style.preferredSize = CGSize(width: width, height: height)
        if let videoURL = viewModel.videoURL {
            videoNode.asset = AVAsset(url: videoURL)
            videoNode.contentMode = .center
            videoNode.gravity = AVLayerVideoGravity.resizeAspectFill.rawValue
            videoNode.shouldAutoplay = true
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
  
        //soundButton.style.preferredSize = CGSize(width: soundButtonSize, height: soundButtonSize)
    //    let soundInsets = UIEdgeInsets(top: CGFloat.infinity, left: WindowSize.size.width - UIConstants.inset*2 - soundButtonSize*1.5, bottom: 10, right: 0)
      //  let soundInsetLayout = ASInsetLayoutSpec(insets: soundInsets, child: soundButton)
        let labelStack  =  ASStackLayoutSpec(
            direction: .vertical,
            spacing: 1,
            justifyContent: .start,
            alignItems: .start,
            children: [titleLabel, subtitleLabel])
        
       // let soundLayout = ASAbsoluteLayoutSpec(children: [soundInsetLayout])
        //let videoPlayerLayout = ASOverlayLayoutSpec(child: videoNode, overlay: soundLayout)
        
        let stack  = ASStackLayoutSpec(
            direction: .vertical,
            spacing: CGFloat(spaceBetweenVideo),
            justifyContent: .start,
            alignItems: .stretch,
            children: [labelStack, videoNode])
        
        let insetLayout = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: UIConstants.inset, bottom: UIConstants.bottomPadding, right: UIConstants.inset), child: stack)

        return insetLayout
    }
    
//    @objc func soundButtonPressed() {
//        switch soundState {
//        case .muted:
//            soundState = SoundState.on
//            break
//        default:
//            soundState = SoundState.muted
//            break
//        }
//        updateSoundButton(soundState: soundState)
//    }
//    
//    func updateSoundButton(soundState: SoundState) {
//
//        switch soundState {
//        case .muted:
//            soundButton.setBackgroundImage(Asset.volumeOffIcon.image, for: .normal)
//            break
//        default:
//            soundButton.setBackgroundImage(Asset.volumeUpIcon.image, for: .normal)
//            break
//        }
//    }
}
