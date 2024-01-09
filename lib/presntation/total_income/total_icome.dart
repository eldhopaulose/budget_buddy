part of './bloc/total_icome_bloc.dart';

@RoutePage()
class TotalIncomePageScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const TotalIncomePageScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (ctx) => TotalIcomeBloc(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Income",
            style: GoogleFonts.rubik(),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocListener<TotalIcomeBloc, TotalIcomeState>(
                listener: _listeneradd,
                child: AddWidget(
                  onAdd: ({String? income, String? topic}) {
                    context.read<TotalIcomeBloc>().add(_OnBtnCliked(
                        money: income.toString(), topic: topic.toString()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _listeneradd(BuildContext ctx, TotalIcomeState state) {
    if (state is _Loading) {
      CircularProgressIndicator();
    } else {
      if (state is _Success) {
        Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent[300],
            textColor: Colors.white,
            fontSize: 16.0);

        ctx.router.replaceAll([BottomNavRoute()]);
      } else {
        if (state is _Faield) {
          Fluttertoast.showToast(
              msg: "This is Center Short Toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red[300],
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    }
  }
}
