!start.
!alert_blink.

+!start : .my_name(Me)
   <- .print("Hello from ", Me).

+!walk[source(S)] : S \== self & .intend(walk)
   <- .print("Ja estou andando").

+!walk : distance(D) & D <= 50
   <- .print("Obstacle...");
      .brakeLight(true);
      .buzzer(on);
      .wait(1000);
      .buzzer(off);
      .motorSpeed("low");
      .move("backward");
      .wait(1000);
      .move("stop");
      .wait(500);
      .move("right");
      .wait(2000);
      .move("stop");
      !walk.

+!walk
   <- .move("forward");         .wait(300);
      .turnSignal("off");       .wait(300);
      .brakeLight(false);       .wait(300);
      .motorSpeed("default");   .wait(300);
      .print("Moving forward");
      .wait(distance(D) & D <= 50);
      !walk.

-!walk
   <- .print("Parou");
      .move("stop").

+!stop
   <- .drop_intention(walk);
      .print("Parou");
      .move("stop").

+!alert_blink : not motor_status("running")
   <- .turnSignal("alert");
      .wait(300);
      .turnSignal("off");
      .wait(200);
      !alert_blink.

+!alert_blink
   <- .wait(motor_status(S) & S \== "running");
      !alert_blink.

+distance(D)
   <- .print("Distance: ", D).