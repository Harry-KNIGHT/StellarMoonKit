# StellarMoonKit


Import this package on your project, create a ViewModel with a `@Published var articles = [Article]()` for add articles from API call on your array and display it on your view.

```
func getArticles(from hundredDayBefore: Int64 = Date().millisecondsSince1970, to today: Date) {
	Task {
		do {
			articles = try await FetchArticlesApi.fetchAstronomiesObject(from: hundredDayBefore, to: today)
			save()
		} catch {
			print("Error \(error.localizedDescription)")
		}
	}
}

```
