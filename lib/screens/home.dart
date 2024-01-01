import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:music_player_glass_ui/widgets/genre_item.dart';
import 'package:music_player_glass_ui/widgets/glass_bottom_panel.dart';
import 'package:music_player_glass_ui/widgets/page_bar.dart';
import 'package:music_player_glass_ui/widgets/search.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: const Icon(
              MaterialCommunityIcons.beats,
              size: 32,
              color: Color.fromARGB(255, 91, 226, 91),
            ),
            actions: [
              //------------------
              // Tombol Search
              //------------------
              IconButton(
                icon: const Icon(
                  AntDesign.search1,
                  color: Colors.white,
                ),
                onPressed: () => searchFocusNode.requestFocus(),
              ),
              //------------------
              // Tombol Keranjang
              //------------------
              IconButton(
                icon: const Icon(
                  AntDesign.shoppingcart,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            behavior: HitTestBehavior.translucent,
            child: Stack(
              children: [
                SafeArea(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeadline(),
                        Search(
                          focusNode: searchFocusNode,
                        ),
                        _buildGenres(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: GlassBottomPanel(
              showCurrentPlay: true,
            ),
          ),
        ),
      ],
    );
  }

  //----------------------------
  // Method Genre
  //----------------------------
  Widget _buildGenres() {
    return Expanded(
      child: PageBar(
        tabs: const [
          'Commercial',
          'Now Playing',
          'Free license',
        ],
        itemBuilder: (context, index) {
          return GridView.count(
            padding: const EdgeInsets.only(
              top: 16,
              left: 24,
              right: 24,
              bottom: 240,
            ),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              GenreItem(
                label: 'Weezer',
                image: const AssetImage(
                    'assets/img/Weezer - Pacific daydream.jpg'),
              ),
              GenreItem(
                label: 'All Mixed Up',
                image: const AssetImage('assets/img/311 Greatest Hits_.jpg'),
              ),
              GenreItem(
                label: 'Kamshat Zholdybayeva',
                image: const AssetImage('assets/img/Kamshat Zholdybayeva_.png'),
              ),
              GenreItem(
                label: 'Feduk',
                image: const AssetImage('assets/img/Feduk.jpg'),
              ),
              GenreItem(
                label: 'Jamiroquai',
                image:
                    const AssetImage('assets/img/Jamiroquai - Automaton.jpg'),
              ),
              GenreItem(
                label: 'Evrencan Gunduz',
                image: const AssetImage('assets/img/Evrencan Gunduz.jpg'),
              ),
              GenreItem(
                label: 'Jamie Cullum',
                image: const AssetImage('assets/img/Jamie Cullum.jpg'),
              ),
              GenreItem(
                label: 'Janes Addiction',
                image: const AssetImage('assets/img/Janes Addiction.jpg'),
              ),
              GenreItem(
                label: 'Funk',
                image: const AssetImage('assets/img/funk_.png'),
              ),
              GenreItem(
                label: 'House',
                image: const AssetImage('assets/img/house.jpg'),
              ),
              GenreItem(
                label: 'Techno',
                image: const AssetImage('assets/img/techno.jpg'),
              ),
              GenreItem(
                label: 'Lo-Fi',
                image: const AssetImage('assets/img/lo_fi.jpg'),
              ),
              GenreItem(
                label: 'Rock',
                image: const AssetImage('assets/img/rock.jpg'),
              ),
              GenreItem(
                label: 'Country',
                image: const AssetImage('assets/img/country.jpg'),
              ),
              GenreItem(
                label: 'Blues',
                image: const AssetImage('assets/img/blues music.jpg'),
              ),
              GenreItem(
                label: 'Disco',
                image: const AssetImage('assets/img/disco.png'),
              ),
              GenreItem(
                label: 'King of Convenience',
                image: const AssetImage('assets/img/King of Convenience.jpg'),
              ),
              GenreItem(
                label: 'Coldplay',
                image: const AssetImage('assets/img/Coldplay.png'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeadline() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 16,
      ),
      child: Text(
        'Find the best music\nfor you soul',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 32,
          color: Colors.white70,
        ),
      ),
    );
  }
}
