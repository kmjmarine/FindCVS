//
//  DetailListBackGroundViewModel.swift
//  FindCVS
//
//  Created by kmjmarine on 2022/03/31.
//

import RxSwift
import RxCocoa

struct DetailListBackGroundViewModel {
    //ViewModel -> View
    let isStatusLabelHidden: Signal<Bool>
    
    //외부에서 전달받을 값
    let shouldHideStatusLabel = PublishSubject<Bool>()
    
    init() {
        isStatusLabelHidden = shouldHideStatusLabel
            .asSignal(onErrorJustReturn: true)
    }
}
