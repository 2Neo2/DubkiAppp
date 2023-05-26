//
//  CustomSegmentedControl.swift
//  DubkiApp
//
//  Created by Иван Доронин on 11.01.2023.
//

import SwiftUI


public struct CustomSegmentedControl<SelectionValue, Content>: View
where SelectionValue: Hashable, Content: View {
    
    @Binding public var selection: SelectionValue
    @Namespace var namespace
    
    private let content: Content
    
    public init(selection: Binding<SelectionValue>,
                @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            content
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color("PrimaryColor")))
        .frame(width: 328, height: 55)
        .environment(\.selectedSegmentTag, $selection)
        .environment(\.segmentedControlNamespace, namespace)
    }
}


private struct SelectedSegmentTagKey: EnvironmentKey {
    static var defaultValue: Any?
}


private extension EnvironmentValues {
    var selectedSegmentTag: Any? {
        get { self[SelectedSegmentTagKey.self] }
        set { self[SelectedSegmentTagKey.self] = newValue }
    }
}


public extension View {
    func segmentedControlItemTag<SelectionValue: Hashable>(_ tag: SelectionValue) -> some View {
        return SegmentedControlItemContainer(tag: tag,
                                             content: self)
    }
}

private struct SegmentedControlItemContainer<SelectionValue, Content>: View
where SelectionValue: Hashable, Content: View {
    @Environment(\.selectedSegmentTag) var selectedSegmentTag
    @Environment(\.segmentedControlNamespace) var segmentedControlNamespace
    
    let tag: SelectionValue
    
    let content: Content
    
    @Namespace var namespace
    
    @ViewBuilder
    var body: some View {
        content
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .foregroundColor(isSelected ? .black : .white.opacity(0.8))
            .background(isSelected ? background : nil)
            .onTapGesture {
                select()
            }
            .disabled(isSelected)
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(.white)
            .padding(.vertical, 2)
            .padding(.horizontal, -7)
            .frame(width: 162, height: 51)
            .matchedGeometryEffect(id: "selection",
                                   in: segmentedControlNamespace ?? namespace)
    }
    
    private func select() {
        withAnimation(.easeInOut(duration: 0.2)) {
            if let binding = selectedSegmentTag as? Binding<SelectionValue> {
                binding.wrappedValue = tag
            }
        }
    }
    
    private var isSelected: Bool {
        let selectedTag = (selectedSegmentTag as? Binding<SelectionValue>)?.wrappedValue
        return tag == selectedTag
    }
}


private struct SegmentedControlNamespaceKey: EnvironmentKey {
    static var defaultValue: Namespace.ID?
}

private extension EnvironmentValues {
    var segmentedControlNamespace: Namespace.ID? {
        get { self[SegmentedControlNamespaceKey.self] }
        set { self[SegmentedControlNamespaceKey.self] = newValue }
    }
}
