status(green)[source("58c8b3e1-068f-45f9-83c7-52df2c5d73d3")].

!connect.
!getColor.

+!connect
   <- .connectCN("skynet.chon.group",5000,"2fa5664a-f3da-4f55-9515-ced6d18d6484").

+hermes::contextNetConfiguration(_,Server,Port,ID,Status,_)
   <- .print("Server ",Server," status=",Status);
      .print("Messenger with me at http://skynet.chon.group:5000/en?ip=",Server,"&port=",Port,"&agentUUID=",ID,"&userUUID=auto&strength=achieve&message=hello").

+!hello[source(Human)]
   <- .sendOut(Human,tell,"Hello Human!!!").

+!turnOff[source(Human)]
   <- .print("closing");
      .stopMAS.

+!walk[source(Human)] : status(C) & (C == green | C == blue)
   <- .print("Humano enviou achieve(walk)");
      .sendOut(Human, tell, "Walk recebido");
      .send(chonbot_agent, achieve, walk).

+!walk[source(Human)]
   <- .print("Walk negado").

+!stop
   <- .print("Stop recebido");
      .send(chonbot_agent, achieve, stop).

+status(C) : C == red
   <- .print("Mandar parar");
      !stop.

+!getColor
   <- !atualiza;
      .wait(5000);
      !getColor.

+!atualiza
   <- -+status(green)[source("58c8b3e1-068f-45f9-83c7-52df2c5d73d3")];
      .wait(15000);
      -+status(red)[source("58c8b3e1-068f-45f9-83c7-52df2c5d73d3")];
      .wait(5000).

// +!getColor
//    <- .sendOut("58c8b3e1-068f-45f9-83c7-52df2c5d73d3", askOne, status(C), Reply);
//       -+Reply;
//       .print(Reply);
//       .wait(3000);
//       !getColor.