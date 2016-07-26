//
//  DoubleExtension.swift
//  Swift19_扩展
//
//  Created by sks on 16/7/25.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

extension Double{
    
    var km: Double {return self * 1000.0}
    var m : Double {return self}
    var cm: Double {return self/100.0}
    var mm: Double {return self/1000.0}
    var ft: Double {return self/3.28084}
}




        