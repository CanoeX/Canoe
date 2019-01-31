//
// Created by Igor Tarasenko on 2019-01-16.
// Licensed under the MIT license
//

import Foundation

public enum Logger {
    public enum Destination {
        case print
        case custom((Message, String) -> Void)
    }

    public enum Settings {
        public static var destinations: [Destination] = [.print]

        /*
         C - colored area start
         c - colored area end
         d - date
         t - time
         L - level
         F - file
         l - line
         f - function
         m - message
         */
        public static var format: String = "%C%t %L %F:%l %f %m%c"
        public static var timeFormatter: DateFormatter = .withDateFormat("HH:mm:ss.SSS")
        public static var dateFormatter: DateFormatter = .withDateFormat("yyyy-MM-dd")
    }

    public struct Message {
        public let value: Any
        public let level: Level
        public let function: StaticString
        public let file: StaticString
        public let line: UInt
        public let column: UInt
        public let date: Date
        public var fileName: String {
            return URL(fileURLWithPath: "\(file)").lastPathComponent
        }
    }

    public enum Level: String {
        case verbose = "V"
        case debug = "D"
        case info = "I"
        case warning = "W"
        case error = "E"

        internal var color: Color {
            switch self {
            case .verbose:
                return .blue
            case .debug:
                return .green
            case .info:
                return .cyan
            case .warning:
                return .yellow
            case .error:
                return .red
            }
        }
    }

    internal enum Color: String {
        case red = "\u{001B}[0;31m"
        case green = "\u{001B}[0;32m"
        case yellow = "\u{001B}[0;33m"
        case blue = "\u{001B}[0;34m"
        case magenta = "\u{001B}[0;35m"
        case cyan = "\u{001B}[0;36m"
        case white = "\u{001B}[0;37m"
        case reset = "\u{001B}[0;0m"
    }

    /// Prints formatted message to all destinations
    public static func print(
        level: Level,
        _ message: () -> Any,
        _ function: StaticString = #function,
        _ file: StaticString = #file,
        _ line: UInt = #line,
        _ column: UInt = #column,
        _ date: Date = Date()
    ) {
        let message = Message(
            value: message(),
            level: level,
            function: function,
            file: file,
            line: line,
            column: column,
            date: date
        )
        let formatted = Logger.format(message, format: Settings.format)
        for destination in Settings.destinations {
            switch destination {
            case .print:
                Swift.print(formatted)
            case let .custom(closure):
                closure(message, formatted)
            }
        }
    }

    /// Creates message string from Message struct using format defined in Settings.format
    public static func format(_ message: Message, format: String) -> String {
        return format
            /// C - colored area start
            .replacingOccurrences(of: "%C", with: message.level.color.rawValue)
            /// c - colored area end
            .replacingOccurrences(of: "%c", with: Color.reset.rawValue)
            /// d - date
            .replacingOccurrences(of: "%d", with: Settings.dateFormatter.string(from: message.date))
            /// t - time
            .replacingOccurrences(of: "%t", with: Settings.timeFormatter.string(from: message.date))
            /// L - level
            .replacingOccurrences(of: "%L", with: message.level.rawValue)
            /// F - file
            .replacingOccurrences(of: "%F", with: message.fileName)
            /// l - line
            .replacingOccurrences(of: "%l", with: "\(message.line)")
            /// f - function
            .replacingOccurrences(of: "%f", with: "\(message.function)")
            /// m - message
            .replacingOccurrences(of: "%m", with: "\(message.value)")
    }
}

// MARK: - Code Sugar
public extension Logger {
    func verbose(
        _ message: @autoclosure () -> Any,
        function: StaticString = #function,
        file: StaticString = #file,
        line: UInt = #line,
        column: UInt = #column
    ) {
        Logger.print(level: .verbose, message, function, file, line, column)
    }

    func debug(
        _ message: @autoclosure () -> Any,
        function: StaticString = #function,
        file: StaticString = #file,
        line: UInt = #line,
        column: UInt = #column
    ) {
        Logger.print(level: .debug, message, function, file, line, column)
    }

    func info(
        _ message: @autoclosure () -> Any,
        function: StaticString = #function,
        file: StaticString = #file,
        line: UInt = #line,
        column: UInt = #column
    ) {
        Logger.print(level: .info, message, function, file, line, column)
    }

    func warning(
        _ message: @autoclosure () -> Any,
        function: StaticString = #function,
        file: StaticString = #file,
        line: UInt = #line,
        column: UInt = #column
    ) {
        Logger.print(level: .warning, message, function, file, line, column)
    }

    func error(
        _ message: @autoclosure () -> Any,
        function: StaticString = #function,
        file: StaticString = #file,
        line: UInt = #line,
        column: UInt = #column
    ) {
        Logger.print(level: .error, message, function, file, line, column)
    }
}

// MARK: - Private helpers
private extension DateFormatter {
    static func withDateFormat(_ format: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter
    }
}
