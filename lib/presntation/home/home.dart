part of './bloc/home_bloc.dart';

@RoutePage()
class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().featchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double? money;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.rubik(),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                context.read<HomeBloc>().featchData();
              });
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: color,
                  width: 2.5,
                ),
                borderRadius: BorderRadius.circular(
                    (size.width / 1.2) / 2), // or size.height / 4
              ),
              child: StreamBuilder<Moneys?>(
                  stream: context.read<HomeBloc>()._featchDataControler.stream,
                  initialData: null,
                  builder: (context, snapshot) {
                    if (snapshot.data == null)
                      return const Center(
                        child: Text("NO DATA FOUND"),
                      );
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      final data = snapshot.data;

                      if (data!.totalMoney == "") {
                        money = 0;
                      } else {
                        money = double.parse(data.totalMoney.toString());
                      }
                      final String formattedAmount = NumberFormat.currency(
                        symbol: '₹', // Indian Rupee symbol
                        locale: 'en_IN', // India locale
                      ).format(money);
                      return CircleAvatar(
                        radius: size.width / 2.4,
                        backgroundColor: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data.topic.toString().toUpperCase(),
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  color: color,
                                  fontSize: 18,
                                  fontFamily: 'Fira Sans Condensed',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: size.width / 2,
                              child: Center(
                                child: Text(
                                  formattedAmount.toString(),
                                  style: GoogleFonts.rubik(
                                    textStyle: const TextStyle(
                                      color: color,
                                      fontSize: 18,
                                      fontFamily: 'Fira Sans Condensed',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: Text('Unexpected Error'),
                    );
                  }),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            SizedBox(
              width: size.width / 1.2,
              height: size.height / 15,
              child: ElevatedButton(
                onPressed: () {
                  context.router.push(TotalIncomePageRoute());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shadowColor: color,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  "add",
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Fira Sans Condensed',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    context.read<HomeBloc>().featchData();
    super.dispose();
  }
}
