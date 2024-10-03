with Kalman_1d;
with Ada.Text_IO;                  use Ada.Text_IO;
with Ada.Float_Text_IO;            use Ada.Float_Text_IO;
with Ada.Numerics;                 use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use  Ada.Numerics.Elementary_Functions;
with Ada.Numerics.Float_Random;    use Ada.Numerics.Float_Random;

procedure Tests is

   package K1 is new Kalman_1d (Float);
   package K2 is new Kalman_1d (Float);
   package K3 is new Kalman_1d (Float);


   D       : constant := 0.1;
   Amp     : constant := 10.0;
   Err_Amp : constant := 2.0;

   Sep : constant String := "; ";

   G : Generator;

   Pos     : Float := 0.0;
   Mea     : Float;
   Mea_Err : Float;
   Mea_F1  : Float;
   Mea_F2  : Float;
   Mea_F3  : Float;
begin
   K1.Init (Mea_E => 2.0,
            Est_E => 2.0,
            Q     => 1.0);
   K2.Init (Mea_E => 2.0,
            Est_E => 2.0,
            Q     => 5.0);
   K3.Init (Mea_E => 2.0,
            Est_E => 2.0,
            Q     => 10.0);
   Reset (G);

   Put ("pos");
   Put (Sep);
   Put ("m_orig");
   Put (Sep);
   Put ("m_err");
   Put (Sep);
   Put ("m_f1");
   Put (Sep);
   Put ("m_f2");
   Put (Sep);
   Put ("m_f3");
   New_Line;
   while Pos < 4.0 * Pi loop
      Mea     := Sin (Pos) * Amp;
      Mea_Err := Mea + (Random (G) - 0.5) * Err_Amp;
      Mea_F1  := K1.Update_Estimate (Mea_Err);
      Mea_F2  := K2.Update_Estimate (Mea_Err);
      Mea_F3  := K3.Update_Estimate (Mea_Err);

      Put (Pos, Aft => 3, Exp => 0);
      Put (Sep);
      Put (Mea, Aft => 3, Exp => 0);
      Put (Sep);
      Put (Mea_Err, Aft => 3, Exp => 0);
      Put (Sep);
      Put (Mea_F1, Aft => 3, Exp => 0);
      Put (Sep);
      Put (Mea_F2, Aft => 3, Exp => 0);
      Put (Sep);
      Put (Mea_F3, Aft => 3, Exp => 0);
      New_Line;

      Pos := Pos + D;
   end loop;

end Tests;
