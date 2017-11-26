//
//  SwiftySoundTests.swift
//  Moonlight Apps
//
//  Created by Adam Cichy on 04/04/2017.
//  Copyright (c) 2017 Moonlight Apps. All rights reserved.
//

import Foundation
import XCTest
import SwiftySound

extension String: Error {}

final class MockPlayer: Player {

    var duration: TimeInterval = 1
    var volume: Float = 1

    required init(contentsOf url: URL) throws {
        let fm = FileManager.default
        let attributes = try fm.attributesOfItem(atPath: url.path)
        let size = attributes[FileAttributeKey.size]
        if let fileSize = size as? Int64, fileSize == 0 {
            throw "Empty file"
        }
    }

    func play(numberOfLoops: Int, completion: PlayerCompletion?) -> Bool {
        completion?(true)
        return true
    }

    func stop() {
    }

    func prepare() -> Bool {
        return true
    }

}

class SwiftySoundTests: XCTestCase {

    var catSound: Sound?

    let bundle = Bundle.main

    override func setUp() {
        super.setUp()
        Sound.playerClass = MockPlayer.self
        Sound.enabled = true
        if let url = bundle.url(forResource: "cat", withExtension: "wav") {
            catSound = Sound(url: url)
            catSound?.prepare()
        }
    }

    // MARK: Properties
    #if os(iOS) || os(tvOS)

    func testDefaultSoundCategory() {
        let defaultCategory = Sound.category
        XCTAssertEqual(defaultCategory, .ambient)
    }

    func testCategoryChange() {
        Sound.category = SoundCategory.playAndRecord
        XCTAssertEqual(Sound.category, .playAndRecord)
        Sound.category = SoundCategory.record
        XCTAssertEqual(Sound.category, .record)
        Sound.category = SoundCategory.playback
        XCTAssertEqual(Sound.category, .playback)
        Sound.category = SoundCategory.soloAmbient
        XCTAssertEqual(Sound.category, .soloAmbient)
        Sound.category = SoundCategory.ambient
        XCTAssertEqual(Sound.category, .ambient)
    }

    #endif

    func testEnabled() {
        Sound.enabled = false
        XCTAssertFalse(Sound.enabled)
        Sound.enabled = true
        XCTAssertTrue(Sound.enabled)
    }

    func testPlayersPerSound() {
        Sound.playersPerSound = 10
        XCTAssertEqual(Sound.playersPerSound, 10)
        Sound.playersPerSound = 5
        XCTAssertEqual(Sound.playersPerSound, 5)
    }

    // MARK: Playback
    func testCreatingInstance() {
        if let url = bundle.url(forResource: "dog", withExtension: "wav") {
            let sound = Sound(url: url)
            XCTAssertNotNil(sound)
        }
    }

    func testCreatingInstanceNonExistentFile() {
        if let url = bundle.url(forResource: "nonexistent", withExtension: "wav") {
            let sound = Sound(url: url)
            XCTAssertNil(sound)
        }
    }

    func testCreatingInstanceEmptyFile() {
        if let url = bundle.url(forResource: "empty", withExtension: "wav") {
            let sound = Sound(url: url)
            XCTAssertNil(sound)
        }
    }

    func testNonExisting() {
        let result = Sound.play(file: "nonexistent.mp3")
        XCTAssertFalse(result)
    }

    func testDog() {
        if let url = bundle.url(forResource: "dog", withExtension: "wav") {
            let result = Sound.play(url: url)
            XCTAssert(result)
        }
    }

    func testCat() {
        if let url = bundle.url(forResource: "cat", withExtension: "wav") {
            let result = Sound.play(url: url)
            XCTAssert(result)
        }
    }

    func testEmpty() {
        if let url = bundle.url(forResource: "empty", withExtension: "wav") {
            let result = Sound.play(url: url)
            XCTAssertFalse(result)
        }
    }

    func testStop() {
        if let url = bundle.url(forResource: "dog", withExtension: "wav"), let sound = Sound(url: url) {
            sound.play()
            sound.stop()
            Sound.play(url: url, numberOfLoops: -1)
            Sound.stop(for: url)
            Sound.stopAll()
            XCTAssert(true)
        }
    }

    func testVolume() {
        if let url = bundle.url(forResource: "dog", withExtension: "wav"), let sound = Sound(url: url) {
            sound.volume = 0.5
            XCTAssertEqual(sound.volume, 0.5)
            sound.volume = 0.0
            XCTAssertEqual(sound.volume, 0.0)
            sound.volume = 1.0
            XCTAssertEqual(sound.volume, 1.0)
        }
    }

    func testDuration() {
        if let url = bundle.url(forResource: "dog", withExtension: "wav"), let sound = Sound(url: url) {
            XCTAssert(sound.duration > 0)
        }
    }

    func testNotEnabledPlayback() {
        Sound.enabled = false
        if let url = bundle.url(forResource: "dog", withExtension: "wav"), let sound = Sound(url: url) {
            let result = sound.play()
            XCTAssertFalse(result)
            let resultForStaticMethod = Sound.play(file: "dog.wav")
            XCTAssertFalse(resultForStaticMethod)
            let resultForStaticMethodWithUrl = Sound.play(url: url)
            XCTAssertFalse(resultForStaticMethodWithUrl)
            Sound.enabled = true
            let resultWhenSoundEnabled = sound.play()
            XCTAssert(resultWhenSoundEnabled)
        }
        Sound.enabled = true
    }

    func testPrepare() {
        if let url = bundle.url(forResource: "dog", withExtension: "wav"), let sound = Sound(url: url) {
            let prepareResult = sound.prepare()
            XCTAssert(prepareResult)
            let playResult = sound.play()
            XCTAssert(playResult)
            sound.stop()
        }
    }

}
