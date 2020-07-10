//
//  DebugSettingCell.swift
//  Example
//
//  Created by Saika Natsui on 2020/07/07.
//  Copyright © 2020 FidelityWires. All rights reserved.
//

import UIKit

protocol DebugSettingCellDelegate: class {

    func switchValueDidChange(to newValue: Bool, at indexPath: IndexPath)
}

final class DebugSettingCell: UITableViewCell {

    var delegate: DebugSettingCellDelegate?

    @IBOutlet private weak var label: UILabel!

    @IBOutlet weak private var debugSwitch : UISwitch!

    private var indexPath: IndexPath!

    func configure(name: String, isOn: Bool, at indexPath: IndexPath) {
        label.text = String(format: "Enable %@ : ", name)
        debugSwitch.isOn = isOn
        self.indexPath = indexPath
    }

    @IBAction private func switchDidTap() {
        delegate?.switchValueDidChange(to: debugSwitch.isOn, at: indexPath)
    }

}
