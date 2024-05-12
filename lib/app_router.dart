import 'package:flutter/material.dart';
import 'package:transportation/presentation/drawer/drawer_pages/previous_tickets.dart';
import 'package:transportation/presentation/journey_page/journey_page.dart';
import 'package:transportation/presentation/main_page/home_screen.dart';
import 'package:transportation/presentation/search_screen/Search_screen.dart';
import 'package:transportation/presentation/ticket_pages/confirm_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name){
      case '/' :
        return MaterialPageRoute(builder: (_) => HomeView() );

      case '/search' :
        return MaterialPageRoute(builder: (_) => SearchScreen() );

      case '/journeyPage' :
        return MaterialPageRoute(builder: (_) => JourneyPage() );

      case '/book' :
        return MaterialPageRoute(builder: (_) => ConfirmTicketPage() );

      case '/previousTickets' :
        return MaterialPageRoute(builder: (_) => PreviousTicketsPage() );

      default:
    }
  }
}