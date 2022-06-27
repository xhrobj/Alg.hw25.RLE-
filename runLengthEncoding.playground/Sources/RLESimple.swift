public typealias RLEItem = (count: Int, chars: [Character])
public typealias RLEResult = [RLEItem]

typealias Counter = (char: Character, count: Int)

public func rle(for arrayOfCharacters: [Character]) -> RLEResult {
    var xx = [Counter]()
    var buffer: Counter = (Character("."), 0)
    for char in arrayOfCharacters {
        guard buffer.count != 0 else {
            buffer.char = char
            buffer.count = 1
            continue
        }

        guard buffer.char != char else {
            buffer.count += 1
            continue
        }

        xx.append(buffer)

        buffer.char = char
        buffer.count = 1
    }

    if buffer.count != 0 {
        xx.append(buffer)
    }

    var result = [RLEItem]()
    var currentItem: RLEItem = (0, [])
    for x in xx{
        var x = x
        guard x.count > 1 else {
            if currentItem.count < 0 {
                if currentItem.count == -128 {
                    result.append(currentItem)
                    currentItem = (0, [])
                }
                currentItem.count -= 1
                currentItem.chars.append(x.char)
            } else {
                currentItem.count = -1
                currentItem.chars = [x.char]
            }
            continue
        }
        if currentItem.count < 0 {
            result.append(currentItem)
        }
        while x.count > 127 {
            currentItem = (count: 127, chars: [x.char])
            result.append(currentItem)
            x.count -= 127
        }
        currentItem = (count: x.count, chars: [x.char])
        result.append(currentItem)
    }

    if currentItem.count < 0 {
        result.append(currentItem)
    }

    return result
}

public func printRLEResult(_ xx: RLEResult) {
    var (i, totalSize) = (1, 0)
    xx.forEach {
        let size = size(of: $0)
        print("\(i).", $0, "Размер:", size)
        i += 1
        totalSize += size
    }
    print("-------")
    print("Размер:", totalSize)
}

public func size(of xx: RLEResult) -> Int {
    xx.reduce(0, { $0 + size(of: $1) })
}

func size(of x: RLEItem) -> Int {
    x.count < 0 ? 1 + -x.count : 2
}
