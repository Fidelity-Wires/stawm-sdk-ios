//
//  DebugSettingViewController.swift
//  Example
//
//  Created by Saika Natsui on 2020/07/07.
//  Copyright © 2020 FidelityWires. All rights reserved.
//

import UIKit
import StawmServiceStatus

protocol DebugSettingViewControllerDelegate: AnyObject {

    func settingDidUpdate(settings: [ServiceStatusInspector.DebugSetting])
}

final class DebugSettingViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    weak var delegate: DebugSettingViewControllerDelegate?

    var settings: [ServiceStatusInspector.DebugSetting] = []

    static func instantiate() -> DebugSettingViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DebugSettingViewController")
        return viewController as! DebugSettingViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.settingDidUpdate(settings: settings)
    }

    @IBAction private func closeDidTap() {
        dismiss(animated: true)
    }
}

extension DebugSettingViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: DebugSettingCell.self),
            for: indexPath) as! DebugSettingCell
        let setting = settings[indexPath.row]
        cell.delegate = self
        cell.configure(name: setting.service.rawValue, isOn: setting.status == .green, at: indexPath)
        return cell
    }
}

extension DebugSettingViewController: DebugSettingCellDelegate {

    func switchValueDidChange(to newValue: Bool, at indexPath: IndexPath) {
        let status: ServiceStatusInfo.Status = newValue ? .green : .red
        settings[indexPath.row] = .init(service: settings[indexPath.row].service, status: status)
    }
}
