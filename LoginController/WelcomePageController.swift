//
//  WelcomePageControllerViewController.swift
//  CarWorld
//
//  Created by yangxue_pc on 2018/12/21.
//  Copyright © 2018年 yangxue_pc. All rights reserved.
//

import UIKit

class WelcomePageController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageHeadings = ["Personalize", "Locate", "Discover"]
    var pageImages = ["foodpin-intro-1", "foodpin-intro-2", "foodpin-intro-3"]
    var pageContent = ["Pin your favorite restaurants and create your own foodguide", "Search and locate your favourite restaurant on Maps", "Find restaurants pinned by your friends and other foodies around the world"]
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WelcomeContentView).index
        index -= 1
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WelcomeContentView).index
        index += 1
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WelcomeContentView? {
        if index < 0 || index >= pageHeadings.count{
            return nil
        }
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "WelcomeContent") as? WelcomeContentView {
            pageContentViewController.imgFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.content = pageContent[index]
            pageContentViewController.index = index
            return pageContentViewController
        }
        return nil
    }
    
    func forward(index: Int) {
        if let nextViewController = contentViewController(at: index + 1) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let startingViewController = contentViewController(at: 0){
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }

}
