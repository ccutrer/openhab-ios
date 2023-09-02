// Copyright (c) 2010-2023 Contributors to the openHAB project
//
// See the NOTICE file(s) distributed with this work for additional
// information.
//
// This program and the accompanying materials are made available under the
// terms of the Eclipse Public License 2.0 which is available at
// http://www.eclipse.org/legal/epl-2.0
//
// SPDX-License-Identifier: EPL-2.0

import Foundation
import SVGKit

extension SVGKImage {
    private func setFillColorForSubLayer(layer: CALayer, color: UIColor) {
        if layer is CAShapeLayer {
            let shapeLayer = layer as! CAShapeLayer
            shapeLayer.fillColor = color.cgColor
        }

        if let sublayers = layer.sublayers {
            for subLayer in sublayers {
                setFillColorForSubLayer(layer: subLayer, color: color)
            }
        }
    }

    func setFillColor(color: UIColor) {
        if let layer = caLayerTree {
            setFillColorForSubLayer(layer: layer, color: color)
        }
    }
}
