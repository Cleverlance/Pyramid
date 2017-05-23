//
//  NotificationCenterImplTests.swift
//  creditas
//
//  Created by Lukas Hakulin on 25/04/16.
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
@testable import Pyramid

class NotificationCenterImplTests: XCTestCase {

    let dummyNotification = "DummyNotification"
    var center: NotificationCenterImpl!

    var observer: Observer<String>?
    var secondObserver: Observer<String>?

    override func setUp() {
        super.setUp()

        self.center = NotificationCenterImpl()
    }

    func test_Communication_PostObservedNotification_itReceivesNotification() {

        var notificationReceived = false
        observer = center.addObserverForNotification(dummyNotification) {
            notificationReceived = true
        }

        center.postNotification(name: dummyNotification)

        expect (notificationReceived) == true
    }

    func test_Communication_PostCoupleOfObservedNotifications_itReceivesAllNotifications() {

        var firstNotificationReceived = false
        var secondNotificationRecieved = false
        observer = center.addObserverForNotification(dummyNotification) {
            firstNotificationReceived = true
        }
        secondObserver = center.addObserverForNotification(dummyNotification) {
            secondNotificationRecieved = true
        }

        center.postNotification(name: dummyNotification)

        expect (firstNotificationReceived && secondNotificationRecieved) == true
    }

    func test_Communication_PostNotificationToRemovedObserver_ItDoesNotReceiveNotification() {

        var notificationReceived = false
        observer = center.addObserverForNotification(dummyNotification) {
            notificationReceived = true
        }
        center.removeObserver(self.observer!)

        center.postNotification(name: dummyNotification)

        expect (notificationReceived) == false
    }

    func test_Communication_PostNotificationToReleasedObserver_ItDoesNotReceiveNotification() {

        var notificationReceived = false
        observer = center.addObserverForNotification(dummyNotification) {
            notificationReceived = true
        }
        observer = nil

        center.postNotification(name: dummyNotification)

        expect (notificationReceived) == false
    }
}
