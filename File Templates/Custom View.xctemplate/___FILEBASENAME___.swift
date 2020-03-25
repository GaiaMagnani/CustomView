//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
// ___COPYRIGHT___
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: UIView {
    
    /// Any subviews should be added to contentView
	
    // MARK: - Lifecycle
    
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		xibSetup()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		xibSetup()
	}
	
	func xibSetup() {
		let view = loadFromNib()
		addSubview(view)
		stretch(view: view)
	}
	
	func loadFromNib<T: UIView>() -> T {
		let selfType = type(of: self)
		let bundle = Bundle(for: selfType)
		let nibName = String(describing: selfType)
		let nib = UINib(nibName: nibName, bundle: bundle)
		guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
			fatalError("Error loading nib with name \(nibName)")
		}
		return view
	}
	/// Stretches the input view to the UIView frame using Auto-layout
	///
	/// - Parameter view: The view to stretch.
	func stretch(view: UIView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			view.topAnchor.constraint(equalTo: topAnchor),
			view.leftAnchor.constraint(equalTo: leftAnchor),
			view.rightAnchor.constraint(equalTo: rightAnchor),
			view.bottomAnchor.constraint(equalTo: bottomAnchor)
			])
	}
}
