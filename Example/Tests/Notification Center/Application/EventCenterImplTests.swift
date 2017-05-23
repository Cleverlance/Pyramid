//
//  EventCenterImplTests.swift
//  creditas
//
//  Created by Lukas Hakulin on 29/04/16.
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
import Pyramid

class EventCenterImplTests: XCTestCase {

    let dummyNotification = "DummyNotification"
    var center: EventCenterImpl!

    var observer: Observer<String>?
    var secondObserver: Observer<String>?

    override func setUp() {
        super.setUp()

        self.center = EventCenterImpl()
    }

    func test_Communication_FireObservedEvent_ItDetectsEvent() {

        var eventDetected = false
        observer = center.observe {
            eventDetected = true
        }

        center.fire()

        expect (eventDetected) == true
    }

    func test_Communication_FireCoupleOfObservedEvents_ItDetectsAllEvents() {

        var firstEventDetected = false
        var secondEventDetected = false
        observer = center.observe {
            firstEventDetected = true
        }
        secondObserver = center.observe {
            secondEventDetected = true
        }

        center.fire()

        expect (firstEventDetected && secondEventDetected) == true
    }

    func test_Communication_FireEventOfRemovedObserver_ItDoesNotDetectEvent() {

        var eventDetected = false
        observer = center.observe {
            eventDetected = true
        }
        center.removeObserver(self.observer!)

        center.fire()

        expect (eventDetected) == false
    }

    func test_Communication_FireEventOfReleasedObserver_ItDoesNotDetectEvent() {

        var eventDetected = false
        observer = center.observe {
            eventDetected = true
        }
        observer = nil

        center.fire()

        expect (eventDetected) == false
    }
}
