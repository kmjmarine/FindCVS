//
//  LocationInformationModel.swift
//  FindCVS
//
//  Created by kmjmarine on 2022/03/31.
//

import Foundation
import RxSwift

struct LocationInformationModel {
    let locationNewtwork: LocalNetwork
    
    init(localNetwork: LocalNetwork = LocalNetwork()) {
        self.locationNewtwork = localNetwork
    }
    
    func getLocation(by mapPoint: MTMapPoint) -> Single<Result<LocationData, URLError>> {
        return locationNewtwork.getLocation(by: mapPoint)
    }
    
    func documentsToCellData(_ data: [KLDocument]) -> [DetailListCellData] {
        return data.map {
            let address = $0.roadAddressName.isEmpty ? $0.addressName : $0.roadAddressName
            let point = documentToMTMapPoint($0)
            return DetailListCellData(placeName: $0.placeName, address: address, distance: $0.distance, point: point)
        }
    }
    
    func documentToMTMapPoint(_ doc: KLDocument) -> MTMapPoint {
        let latitude = Double(doc.x) ?? .zero
        let longitude = Double(doc.y) ?? .zero
        
        return MTMapPoint(geoCoord: MTMapPointGeo(latitude: latitude, longitude: longitude))
    }
}
