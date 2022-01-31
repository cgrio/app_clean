import 'package:app_clean/apresentacao/blocs/artigos_remoto/artigos_remoto_bloc.dart';
import 'package:app_clean/apresentacao/widgets/artigo_widget.dart';
import 'package:app_clean/dominio/entidades/artigo_entidade.dart';
import 'package:app_clean/nucleo/bloc/bloc_with_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BreakingNewsView extends HookWidget {
  const BreakingNewsView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = useScrollController();

    useEffect(() {
      scrollController
          .addListener(() => _onScrollListener(context, scrollController));
      return scrollController.dispose;
    }, <ScrollController>[scrollController]);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(scrollController),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.black)),
      actions: [
        Builder(
          builder: (BuildContext context) => GestureDetector(
            onTap: () => _onShowSavedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Ionicons.bookmark, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(ScrollController scrollController) {
    // return _buildArticle(scrollController);
    return BlocBuilder<ArtigosRemotoBloc, ArtigosRemotoState>(
      builder: (_, ArtigosRemotoState state) {
        if (state is ArtigosRemotoCarregando) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is ArtigosRemotoError) {
          return const Center(child: Icon(Ionicons.refresh));
        }
        if (state is ArtigosRemotoDone) {
          return _buildArticle(scrollController,
              state.artigos ?? <ArtigoEntidade?>[], state.semMaisDados ?? true);
        }
        return const SizedBox(height: 10);
      },
    );
  }

  Widget _buildArticle(
    ScrollController scrollController,
    List<ArtigoEntidade?> articles,
    bool noMoreData,
  ) {
    return ListView(
      controller: scrollController,
      children: <Widget>[
        // Items
        ...List<Widget>.from(
          articles.map(
            (ArtigoEntidade? e) => Builder(
              builder: (BuildContext context) => ArtigoWidget(
                key: UniqueKey(),
                artigo: e,
                onArticlePressed: (ArtigoEntidade? e) =>
                    _onArticlePressed(context, e!),
              ),
            ),
          ),
        ),

        // add Loading (circular progress indicator at the end),
        // if there are more items to be loaded
        if (noMoreData) ...[
          const SizedBox(),
        ] else ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: CupertinoActivityIndicator(),
          ),
        ]
      ],
    );
  }

  void _onScrollListener(
      BuildContext context, ScrollController scrollController) {
    final double maxScroll = scrollController.position.maxScrollExtent;
    final double currentScroll = scrollController.position.pixels;
    final ArtigosRemotoBloc remoteArticleBloc =
        BlocProvider.of<ArtigosRemotoBloc>(context);
    final BlocProcessState state = remoteArticleBloc.blocProcessState;

    if (currentScroll == maxScroll && state == BlocProcessState.idle) {
      remoteArticleBloc.add(const GetArtigos());
    }
  }

  void _onArticlePressed(BuildContext context, ArtigoEntidade article) {
    Navigator.pushNamed(context, '/ArticleDetailsView', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticlesView');
  }
}
