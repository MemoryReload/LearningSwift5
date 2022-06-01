import SwiftUI
import PlaygroundSupport

//MARK: - Custom Alignments
extension HorizontalAlignment {
    private enum WeirdAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            debugPrint("defaultDimension: \(d)")
            return d.height
        }
    }

    static let weirdAlignment = HorizontalAlignment(WeirdAlignment.self)
}

struct CustomView1: View {

    struct ColorLabel: View {
        let label: String
        let color: Color
        let height: CGFloat

        var body: some View {
            Text(label).font(.title).foregroundColor(.primary).frame(height: height).padding(.horizontal, 20)
                .background(RoundedRectangle(cornerRadius: 8).fill(color))
        }
    }

    var body: some View {
        VStack(alignment: .weirdAlignment, spacing: 10) {

            Rectangle()
                .fill(Color.primary)
                .frame(width: 1)
                .alignmentGuide(.weirdAlignment, computeValue: { d in d[HorizontalAlignment.center] })

            ColorLabel(label: "Monday", color: .red, height: 50)
            ColorLabel(label: "Tuesday", color: .orange, height: 70)
            ColorLabel(label: "Wednesday", color: .yellow, height: 90)
            ColorLabel(label: "Thursday", color: .green, height: 40)
            ColorLabel(label: "Friday", color: .blue, height: 70)
            ColorLabel(label: "Saturday", color: .purple, height: 40)
            ColorLabel(label: "Sunday", color: .pink, height: 40)

            Rectangle()
                .fill(Color.primary)
                .frame(width: 1)
                .alignmentGuide(.weirdAlignment, computeValue: { d in d[HorizontalAlignment.center] })
        }
    }
}

//MARK: - Aligning Non-Siblings
extension VerticalAlignment {
    private enum MyAlignment : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    static let myAlignment = VerticalAlignment(MyAlignment.self)
}

struct CustomView2: View {
    @State private var selectedIdx = 1

    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    var body: some View {
            HStack(alignment: .myAlignment) {
                Image(systemName: "arrow.right.circle.fill")
                    .alignmentGuide(.myAlignment, computeValue: { d in d[VerticalAlignment.center] })
                    .foregroundColor(.green)

                VStack(alignment: .leading) {
                    ForEach(days.indices, id: \.self) { idx in
//                        Group {
                            if idx == self.selectedIdx {
                                Text(self.days[idx])
//                                    .transition(AnyTransition.identity)
                                    .alignmentGuide(.myAlignment, computeValue: { d in d[VerticalAlignment.center] })
                            } else {
                                Text(self.days[idx])
//                                    .transition(AnyTransition.identity)
                                    .onTapGesture {
                                        withAnimation {
                                            self.selectedIdx = idx
                                        }
                                }
                            }
//                        }
                    }
                }
            }
            .padding(20)
            .font(.largeTitle)
    }
}

//Mark: -  ZStack Custom Alignment

extension VerticalAlignment {
    private enum MyVerticalAlignment : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    
    static let myVerticalAlignment = VerticalAlignment(MyVerticalAlignment.self)
}

extension HorizontalAlignment {
    private enum MyHorizontalAlignment : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.leading]
        }
    }
    
    static let myHorizontalAlignment = HorizontalAlignment(MyHorizontalAlignment.self)
}

extension Alignment {
    static let myAlignment = Alignment(horizontal: .myHorizontalAlignment, vertical: .myVerticalAlignment)
}

struct CustomView3: View {
    var body: some View {
        ZStack(alignment: .myAlignment) {
            Color(.red)
                .frame(width: 300, height: 300)
            Text("What is going on?")
                .alignmentGuide(HorizontalAlignment.myHorizontalAlignment, computeValue: {d in
                    print("d = size(\(d.width), \(d.height)), leading = \(d[.leading]), center = \(d[HorizontalAlignment.center]), trailing = \(d[.trailing])")
                    return d[.leading] - 40
                })
                .alignmentGuide(VerticalAlignment.myVerticalAlignment, computeValue: {d in
                    print("d = size(\(d.width), \(d.height)), top = \(d[.top]), center = \(d[VerticalAlignment.center]), trailing = \(d[.bottom])")
                    return d[.bottom] + 40
                })
                .background(.green)
        }
    }
}

//PlaygroundPage.current.setLiveView(UIHostingController(rootView: CustomView2()))
PlaygroundPage.current.liveView = UIHostingController(rootView: CustomView3())

