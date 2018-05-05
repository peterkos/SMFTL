//
//  VoicePackPageViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 11/28/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit

class SoundPackPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
	
	var pages = [UIViewController]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.delegate = self
		self.dataSource = self
		
		// Label for each voice pack
		// TODO: Make functional sound previews!
		pages.append(storyboard!.instantiateViewController(withIdentifier: "Grandalf"))
		pages.append(storyboard!.instantiateViewController(withIdentifier: "SomethingElse"))
		pages.append(storyboard!.instantiateViewController(withIdentifier: "8Bit"))
		
		setViewControllers([pages.first!], direction: .forward, animated: true, completion: nil)
	
		// Configure page control color
//		let pageControl = UIPageControl.appearance()
//		pageControl.backgroundColor = UIColor.red
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	// TODO: Handle case where VC isn't found
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		let previousIndex = pages.index(of: viewController)! - 1
		return viewControllerAtWrappedIndex(previousIndex)
	}
	
	// TODO: Handle case where VC isn't found
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		let nextIndex = pages.index(of: viewController)! + 1
		return viewControllerAtWrappedIndex(nextIndex)
	}
	
//	func presentationCount(for pageViewController: UIPageViewController) -> Int {
//		return pages.count
//	}
//
//	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//		return 0
//	}
	
	// In future, may wrap index
	private func viewControllerAtWrappedIndex(_ index: Int) -> UIViewController? {
		if (index >= 0 && index < pages.count) {
			return pages[index]
		} else {
			return nil
		}
	}
	
	
	// Delegate methods
	
	func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		
		// Return if user aborted swiping
		guard completed else {
			return
		}
		
		// Otherwise, send new color information so slider/label tint can match new "theme"
		
		let newVC = pageViewController.viewControllers!.first!
		
		if ((newVC as? SoundPackSomethingElseViewController) != nil) {
		}
		
		let colorProperties: [UIColor] = []
		
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PageViewDidChange"), object: nil)
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
