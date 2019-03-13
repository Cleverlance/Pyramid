//
//  Copyright © 2018 Cleverlance. All rights reserved.
//

public typealias ListConverter<ItemConverter: ConverterProtocol> = Converter<
    [ItemConverter.Input], [ItemConverter.Output]
>

final class ListConverterImpl<ItemConverter: ConverterProtocol>: ListConverter<ItemConverter> {
    private let itemConverter: ItemConverter

    init(itemConverter: ItemConverter) {
        self.itemConverter = itemConverter
    }

    override func convert(_ input: [ItemConverter.Input]) throws -> [ItemConverter.Output] {
        return try itemConverter.convertArray(input)
    }
}
