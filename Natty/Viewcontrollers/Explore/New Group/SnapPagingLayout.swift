//
//  SnapPagingLayout.swift
//  CollectionViewPeekingPages
//
//  Snap page and center collection view cell
//  https://medium.com/@shaibalassiano/tutorial-horizontal-uicollectionview-with-paging-9421b479ee94
//

import UIKit

class SnapPagingLayout: UICollectionViewFlowLayout {
    let inset: CGFloat = UIConstants.inset
    
    override init() {
        super.init()
        minimumInteritemSpacing = inset
        minimumLineSpacing = inset
        scrollDirection = .horizontal
        sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: UIConstants.bottomPadding, right: inset)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint
    {
        if let collectionViewBounds = self.collectionView?.bounds
        {
            let halfWidthOfVC = collectionViewBounds.size.width * 0.5
            let proposedContentOffsetCenterX = proposedContentOffset.x + halfWidthOfVC
            if let attributesForVisibleCells = self.layoutAttributesForElements(in: collectionViewBounds)
            {
                var candidateAttribute : UICollectionViewLayoutAttributes?
                for attributes in attributesForVisibleCells
                {
                    let candAttr : UICollectionViewLayoutAttributes? = candidateAttribute
                    if candAttr != nil
                    {
                        let a = attributes.center.x - proposedContentOffsetCenterX
                        let b = candAttr!.center.x - proposedContentOffsetCenterX
                        if abs(a) < abs(b)
                        {
                            candidateAttribute = attributes
                        }
                    }
                    else
                    {
                        candidateAttribute = attributes
                        continue
                    }
                }
                
                if candidateAttribute != nil
                {
                    return CGPoint(x: candidateAttribute!.center.x - halfWidthOfVC + inset , y: proposedContentOffset.y);
                }
            }
        }
        return CGPoint.zero
    }

}
