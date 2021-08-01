    import XCTest
    @testable import ISO8601DurationFormatter

    final class ISO8601DurationFormatterTests: XCTestCase {
        // MARK: - String to TimeInterval convertions
        func testThatInvalidFormatTriggerException() {
            // Given
            let durationString = "1Y1M1W1DT1H1M1S"
            let formatter = ISO8601DurationFormatter()

            // When
            do {
                let _ = try formatter.duration(from: durationString)
                XCTFail()
            }

            // Then
            catch {
                XCTAssertEqual(error as? ISO8601DurationFormatter.Exception, .invalidFormat)
            }
        }

        func testThatP0DWorks() {
            // Given
            let formatter = ISO8601DurationFormatter()

            // When
            let seconds = try? formatter.duration(from: "P0D")

            // Then
            XCTAssertEqual(seconds, 0)
        }

        func testThatSecondWorks() {
            // Given
            let formatter = ISO8601DurationFormatter()

            // When
            let secondsA = try? formatter.duration(from: "PT1S")
            let secondsB = try? formatter.duration(from: "PT12S")
            let secondsC = try? formatter.duration(from: "PT123S")
            let secondsD = try? formatter.duration(from: "PT123.45S")

            // Then
            XCTAssertEqual(secondsA, 1)
            XCTAssertEqual(secondsB, 12)
            XCTAssertEqual(secondsC, 123)
            XCTAssertEqual(secondsD, 123.45)
        }

        func testThatMinuteWorks() {
            // Given
            let formatter = ISO8601DurationFormatter()

            // When
            let secondsA = try? formatter.duration(from: "PT1M")
            let secondsB = try? formatter.duration(from: "PT12M")
            let secondsC = try? formatter.duration(from: "PT123M")
            let secondsD = try? formatter.duration(from: "PT123.45M")

            // Then
            XCTAssertEqual(secondsA, 60)
            XCTAssertEqual(secondsB, 12 * 60)
            XCTAssertEqual(secondsC, 123 * 60)
            XCTAssertEqual(secondsD, 123.45 * 60)
        }

        func testThatHourWorks() {
            // Given
            let formatter = ISO8601DurationFormatter()

            // When
            let secondsA = try? formatter.duration(from: "PT1H")
            let secondsB = try? formatter.duration(from: "PT12H")
            let secondsC = try? formatter.duration(from: "PT123H")
            let secondsD = try? formatter.duration(from: "PT123.45H")

            // Then
            XCTAssertEqual(secondsA, 60 * 60)
            XCTAssertEqual(secondsB, 12 * 60 * 60)
            XCTAssertEqual(secondsC, 123 * 60 * 60)
            XCTAssertEqual(secondsD, 123.45 * 60 * 60)
        }

        func testThatDayWorks() {
            // Given
            let formatter = ISO8601DurationFormatter()

            // When
            let secondsA = try? formatter.duration(from: "P1D")
            let secondsB = try? formatter.duration(from: "P12D")
            let secondsC = try? formatter.duration(from: "P123D")
            let secondsD = try? formatter.duration(from: "P123.45D")

            // Then
            XCTAssertEqual(secondsA, 24 * 60 * 60)
            XCTAssertEqual(secondsB, 12 * 24 * 60 * 60)
            XCTAssertEqual(secondsC, 123 * 24 * 60 * 60)
            XCTAssertEqual(secondsD, 123.45 * 24 * 60 * 60)
        }

        func testThatWeekWorks() {
            // Given
            let formatter = ISO8601DurationFormatter()

            // When
            let secondsA = try? formatter.duration(from: "P1W")
            let secondsB = try? formatter.duration(from: "P12W")
            let secondsC = try? formatter.duration(from: "P123W")
            let secondsD = try? formatter.duration(from: "P123.45W")

            // Then
            XCTAssertEqual(secondsA, 1 * 7 * 24 * 60 * 60)
            XCTAssertEqual(secondsB, 12 * 7 * 24 * 60 * 60)
            XCTAssertEqual(secondsC, 123 * 7 * 24 * 60 * 60)
            XCTAssertEqual(secondsD, 123.45 * 7 * 24 * 60 * 60)
        }

        func testThatMonthWorks() {
            // Given
            let formatter = ISO8601DurationFormatter()

            // When
            let secondsA = try? formatter.duration(from: "P1M")
            let secondsB = try? formatter.duration(from: "P12M")
            let secondsC = try? formatter.duration(from: "P123M")
            let secondsD = try? formatter.duration(from: "P123.45M")

            // Then
            XCTAssertEqual(secondsA, 1 * 30 * 24 * 60 * 60)
            XCTAssertEqual(secondsB, 12 * 30 * 24 * 60 * 60)
            XCTAssertEqual(secondsC, 123 * 30 * 24 * 60 * 60)
            XCTAssertEqual(secondsD, 123.45 * 30 * 24 * 60 * 60)
        }

        func testThatYearWorks() {
            // Given
            let formatter = ISO8601DurationFormatter()

            // When
            let secondsA = try? formatter.duration(from: "P1Y")
            let secondsB = try? formatter.duration(from: "P12Y")
            let secondsC = try? formatter.duration(from: "P123Y")
            let secondsD = try? formatter.duration(from: "P123.45Y")

            // Then
            XCTAssertEqual(secondsA, 1 * 365 * 24 * 60 * 60)
            XCTAssertEqual(secondsB, 12 * 365 * 24 * 60 * 60)
            XCTAssertEqual(secondsC, 123 * 365 * 24 * 60 * 60)
            XCTAssertEqual(secondsD, 123.45 * 365 * 24 * 60 * 60)
        }

        func testThatAllComponentsAreReadCombined() {
            // Given
            let durationString = "P1Y1M1W1DT1H1M1S"
            let formatter = ISO8601DurationFormatter()

            // When
            let seconds = try? formatter.duration(from: durationString)

            // Then
            XCTAssertEqual(seconds, 34822861)
        }

        // MARK: - TimeInterval to String convertions
        func testThatNegativeValuesTriggerException() {
            // Given
            let duration: TimeInterval = -123
            let formatter = ISO8601DurationFormatter()

            // When
            do {
                let _ = try formatter.string(from: duration)
                XCTFail()
            }

            // Then
            catch {
                XCTAssertEqual(error as? ISO8601DurationFormatter.Exception, .unsupportedNegativeDuration)
            }
        }
    }
