//
//  EscapingBootcqmp.swift
//  CoreDataBootcamp
//
//  Created by Frank Bara on 12/13/21.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] returnedResult in
            self?.text = returnedResult.data
        }
    }
    
    func downloadData() -> String {
        return "New data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New data!")
        }
    }
    
    // make the above func more readable
    func downloadData4(completionHandler: @escaping (DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data result")
            completionHandler(result)
        }
    }
    
    // more refinements to the above func
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data result")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
    
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingBootcqmp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBootcqmp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcqmp()
    }
}
