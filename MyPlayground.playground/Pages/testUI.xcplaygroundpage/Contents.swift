import UIKit

protocol CardDecoratable: UIView {
    var decoratedView: UIView { get }
}

extension CardDecoratable {
    var decoratedView: UIView {
        print("default implementation")
        return self
    }
}

extension UIView: CardDecoratable { }

extension UITableViewCell{
    var decoratedView: UIView {
        print("cell implementation")
        return self.contentView
    }
}

extension UICollectionViewCell {
    var decoratedView: UIView {
        print("item implementation")
        return self.contentView
    }
}

let v = UIView()
let cell = UITableViewCell()
let item = UICollectionViewCell()

v.decoratedView
cell.decoratedView
item.decoratedView

