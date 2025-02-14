// ignore_for_file: unused_element

import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Theater {
  Map<String, Map<String, String>> bookingDetails = {};
  List<List> seat = List.generate(5, (int i) => List.filled(5, 'E'));
  Theater() {
    late bool flagg = true;
    while (flagg) {
      print("\t\t\t\t\t\t\t==> Welcome To Our Theater <=== \n\n");
      print("Press 1 To Book New Seat :");
      print("Press 2 To Show The Theater Seats :");
      print("press 3 to Show User data :");
      print("press 4 to Exit :");
      int replay = int.parse(stdin.readLineSync()!);
      int? a;
      int? b;
      if (replay == 1) {
        print("To Book new Seat,Please Enter Your Name & Your phone Number");
        String name = stdin.readLineSync()!;
        String phone = stdin.readLineSync()!;
        for (int i = 0; i < 5; i++) {
          for (int j = 0; j < 5; j++) {
            if (seat[i][j] == "E" || bookingDetails=='E') {
              seat[i][j] = "B";
              print(seat.join("\n"));
              bookingDetails["${i + 1},${j + 1}"] = {
                "name": name!,
                "phone": phone!
              };
              a = i;
              b = j;
              print("your name is $name and yor Phone Number is $phone and Your Seat is $a R $b Col");
              saveBookingDetails();
              break;
            } else {
              print("Sorry '_',All seats have been Booked");
            }
            break;
          }
          break;
        }
      } else if (replay == 2) {
        print("\nBooked Seats:");
        bool hasBookedSeats = false; // Flag to check if there are booked seats
        for (int i = 0; i < 5; i++) {
          for (int j = 0; j < 5; j++) {
            if (seat[i][j] == "B") {
              print("Seat ${i + 1},${j + 1} is booked.");
              hasBookedSeats = true;
            }
          }
        }
        if (!hasBookedSeats) {
          print("No seats have been booked yet.");
        }
      } else if (replay == 3) {
        if (bookingDetails.isEmpty) {
          print("\nNo bookings found.\n");
          //break;
        }
        print("\nUsers Booking Details:");
        bookingDetails.forEach((seat, userData) {
          print("Seat $seat: ${userData["name"]} - ${userData["phone"]}");
        });
        print("");
      } else if (replay == 4) {
        print("==> you Select The Exit Option <==");
      } else {
        print("You Enter Invaild Number You Have Number in range [0-4] '_'");
      }
      print("If You Want To Exit (N/n)");
      String flag = stdin.readLineSync()!;
      if (flag == "n" || flag == "N") {
        flagg = false;
      } else {}
    }
  }
  void saveBookingDetails() {
    File file = File('booking_details.json');
    file.writeAsStringSync(json.encode(bookingDetails));
  }

  void loadBookingDetails() {
    File file = File('booking_details.json');
    if (file.existsSync()) {
      String contents = file.readAsStringSync();
      bookingDetails =
          Map<String, Map<String, String>>.from(json.decode(contents));
    }
  }
}
void main(){
   Theater theater = Theater();

}
