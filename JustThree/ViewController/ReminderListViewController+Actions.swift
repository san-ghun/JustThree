//
//  ReminderListViewController+Actions.swift
//  JustThree
//
//  Created by Sanghun Park on 26.09.22.
//

import UIKit

extension ReminderListViewController {
    
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
