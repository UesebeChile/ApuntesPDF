//
//  Watermark.swift
//  Apuntes
//
//  Created by Cristian Torres on 7/10/18.
//  Copyright © 2018 Uesebe. All rights reserved.
//

import UIKit
import PDFKit

class Watermark: PDFPage {

    override func draw(with box: PDFDisplayBox, to context: CGContext) {
        //Dibuja la página actual del PDF
        super.draw(with: box, to: context)
        
        
        //Crear la marca de agua
        let stringText: NSString = "Capítulo de muestra\n del curso"
        let attributes : [NSAttributedStringKey: Any] = [.foregroundColor: UIColor(red: 1, green: 0, blue: 0, alpha: 0.4),
                                                         .font : UIFont.italicSystemFont(ofSize: 30)]
        let stringSize = stringText.size(withAttributes: attributes)
        
        UIGraphicsPushContext(context)
        context.saveGState()
        
        //Donde dibujar la marca de agua
        let pageBounds = bounds(for: box)
        context.translateBy(x: (pageBounds.size.width-stringSize.width)/2.0, y: pageBounds.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.rotate(by: CGFloat(Double.pi / 4.0))
        
        stringText.draw(at: CGPoint(x: 100, y: 50), withAttributes: attributes)
        context.restoreGState()
        UIGraphicsPopContext()
    }
    
}
