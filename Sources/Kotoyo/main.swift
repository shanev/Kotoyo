let tool = Kotoyo()

do {
  try tool.run()
} catch {
  print("Whoops! An error occurred: \(error)")
}
