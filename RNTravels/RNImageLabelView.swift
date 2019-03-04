//
//  RNImageLabelView.swift
//  RNTravels
//
//  Created by Harish on 03/03/19.
//  Copyright © 2019 PACTS. All rights reserved.
//

import UIKit

class RNImageLabelView: UIView {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    

    private func initView(){
        Bundle.main.loadNibNamed("RNImageLabel", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }

}
