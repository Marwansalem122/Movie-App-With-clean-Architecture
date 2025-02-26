
import 'package:movie_app/movie/presentation/componnents/components.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MoviesBloc,MoviesState>(
      buildWhen: (previous, current) => previous.topRatedState != current.topRatedState,
      builder: (context,state) {
          print("Top Rated ReBuilding");
        switch(state.topRatedState){
          case RequestStatus.loading:
            return const SizedBox(
              height: 170.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestStatus.loaded:
            return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: state.topRatedMovies.length,
              itemBuilder: (context, index) {
                final movie = state.topRatedMovies[index];
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstant.imageUrl(
                            movie.backdropPath,
                          ),
                          placeholder:
                              (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                              ),
                          errorWidget:
                              (context, url, error) =>
                                  const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
    
           
          case RequestStatus.error:
               return SizedBox(
                height: 170.0,
                child: Center(
                  child: Text(state.topRatedMessage),
                ),
              );
        }
        }
    );
  }
}

