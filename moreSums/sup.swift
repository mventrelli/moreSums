import Foundation

func sUp(N: Int) -> Double {
  var sumSup: Double = 0.0
  for n in 1...N {
    sumSup += 1.0/Double(n)
  }
  return sumSup
}
