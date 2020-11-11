//Bato, Gunting, Papel Game bot by Timothy A. Diosaban / BSCS-3A for CC206
import 'dart:io';
import 'dart:math';


//list of moves player can do and bot can pick out form
enum Move { bato, papel , gunting }

void main() {
  //bot logic
  final rng = Random();
  //an infinite loop to play forever until interrupted by typing q
  while (true) {
    stdout.write("Bato, Gunting, Papel! what's your pick? \n"
        "(Type q to quit playing)  ");
    final input = stdin.readLineSync();
    //statement where the code gets the input of the player
    if (input == 'bato' || input == 'Bato' || input == 'BATO'|| input == 'papel'|| input == 'Papel' || input == 'PAPEL'
        || input == 'gunting'|| input == 'Gunting' || input == 'GUNTING') {
      var playerMove;
      //these lines of code until the next comment means that it filters the inputs of the player to the correct actions
      if (input == 'bato'|| input == 'Bato' || input == 'BATO') {
        playerMove = Move.bato;
      } else if (input == 'papel'|| input == 'Papel' || input == 'PAPEL') {
        playerMove = Move.papel;
      } else {
        playerMove = Move.gunting;
      }
      //bot takes its moves from the list randomly
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      //prints out the moves both player and bot made
      print('You played: $playerMove');
      print('I played: $aiMove');
      //if the same move its a draw
      if (playerMove == aiMove) {
        print("It's a draw");
      } else if (playerMove == Move.bato && aiMove == Move.gunting ||
          playerMove == Move.papel && aiMove == Move.bato ||
          playerMove == Move.gunting && aiMove == Move.papel) {
        print("You win");
      } else {
        print("You lose");
      }
    } else if (input == 'q') {
      print('Thanks for Playing!');
      break;
    } else {
      print('That\'s not how you play this!');
    }
  }
}