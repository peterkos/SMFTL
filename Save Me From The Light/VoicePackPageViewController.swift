//
//  VoicePackPageViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 11/28/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit

class VoicePackPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
	
	var pages = [UIViewController]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.delegate = self
		self.dataSource = self
		
		// Label for each voice pack
		// TODO: Make functional sound previws!
		let voicePack1 = storyboard!.instantiateViewController(withIdentifier: "voicePack1")
		let voicePack2 = storyboard!.instantiateViewController(withIdentifier: "voicePack2")
		let voicePack3 = storyboard!.instantiateViewController(withIdentifier: "voicePack3")
		
		pages.append(voicePack1)
		pages.append(voicePack2)
		pages.append(voicePack3)
		
		setViewControllers([pages.first!], direction: .forward, animated: true, completion: nil)
		
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
	
	func presentationCount(for pageViewController: UIPageViewController) -> Int {
		return pages.count
	}
	
	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
		return 0
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	// In future, may wrap index
	private func viewControllerAtWrappedIndex(_ index: Int) -> UIViewController? {
		if (index >= 0 && index < pages.count) {
			return pages[index]
		} else {
			return nil
		}
	}

}
