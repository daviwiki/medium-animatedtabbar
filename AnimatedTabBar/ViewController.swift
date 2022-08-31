
import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet private weak var tabBar: BubbleTabBar!
    
    private var cancellables: Set<AnyCancellable> = Set()
    private let colors: [UIColor] = [.brown, .blue, .black, .green]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabs: [BubbleTabBar.Tab] = [
            BubbleTabBar.Tab(id: "1", tint: colors[0], content: .image(uimage: .init(systemName: "bell")!)),
            BubbleTabBar.Tab(id: "2", tint: colors[1], content: .image(uimage: .init(systemName: "pencil.circle")!)),
            BubbleTabBar.Tab(id: "3", tint: colors[2], content: .image(uimage: .init(systemName: "paperplane.fill")!)),
            BubbleTabBar.Tab(id: "4", tint: colors[3], content: .image(uimage: .init(systemName: "scribble")!)),
        ]
        tabBar.show(tabs: tabs)
        
        tabBar.didSelectTab.sink { event in
            switch event {
            case let .didSelect(index):
                self.view.backgroundColor = self.colors[index]
            case let .willSelect(index):
                UIView.animate(withDuration: 0.3) {
                    self.view.backgroundColor = self.colors[index]
                }
            }
        }
        .store(in: &cancellables)
    }
}

