//
//  RemoteSettingViewController.swift
//  Example
//
//  Created by Saika Natsui on 2021/08/31.
//  Copyright © 2021 FidelityWires. All rights reserved.
//

import UIKit

protocol RemoteSettingViewControllerDelegate: AnyObject {

    func settingDidUpdate()
}

final class RemoteSettingViewController: UIViewController {

    weak var delegate: RemoteSettingViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    static func instantiate() -> RemoteSettingViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RemoteSettingViewController")
        return viewController as! RemoteSettingViewController
    }

    @IBAction private func closeDidTap() {
        delegate?.settingDidUpdate()
        dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
