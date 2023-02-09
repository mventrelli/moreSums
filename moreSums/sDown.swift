import Foundation

func sDown(n: Int) -> Double {
  var sumDown: Double = 0.0
  for n in 1...n {
    sumDown += 1.0/Double(n)
  }
  return sumDown
}
