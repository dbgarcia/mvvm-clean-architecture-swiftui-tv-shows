![](./assets/image1.png)

# TV Series App (TV Maze - free public API)

This project is a proof of concept to valid the architecture MVVM with SwiftUI and Unit Test and Code Coverage.

The propurse with this project try eliminate some commos problems in software applications.

- Rigidity
- Fragility
- Immobility
- Tight Coupling


# 📁 Layers
1. `Core`
2. `Modules` 
3. `Repositories` 

# 🚀 TV Maze data
The project works with the TV Maze API (free public API) through the requests:
1. `GET` => https://api.tvmaze.com/shows?page=0
2. `GET` => https://api.tvmaze.com/shows/1/episodes
3. `GET` => https://api.tvmaze.com/search/shows?q=arrow

These 3 requests will be called in `NetworkManager (External Layer)` receiving data in Json format, being processed in the `Repository (Contract Layer)` now with Model format and converted to Entity format.

As we already have the data available in entities, to allocate them to be worked in `Usecases (Domain Layer)`, therefore, 3 usecases were created:
1. `ShowsRepository` - get data from the first request flow
2. `EpisodesRepository` - get data from the second request flow
3. `SearchRepository` - get data from the search with query name

# 📈 Code Coverage
![](https://github.com/dbgarcia/tv_series_app/blob/7924b9fe44de529c7d983c1b3fb10e88ad375278/assets/CodeCoverage.png?raw=true)
---


# 📱 Screen Flow
 <img src="https://github.com/dbgarcia/tv_series_app/blob/master/assets/app_video.gif"  alt="App-Video"  width="200">
