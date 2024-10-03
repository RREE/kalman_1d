package body Kalman_1d is

   procedure Init (Mea_E : Real; Est_E : Real; Q : Real) is
   begin
      Measurement_Err := Mea_E;
      Estimate_Err    := Est_E;
      Kalman_1d.Q     := Q;
   end Init;

   function Update_Estimate (Mea : Real) return Real is
   begin
      Kalman_Gain      := Estimate_Err / (Estimate_Err + Measurement_Err);
      Current_Estimate := Last_Estimate + Kalman_Gain * (Mea - Last_Estimate);
      Estimate_Err     := (1.0 - Kalman_Gain) * Estimate_Err + abs (Last_Estimate - Current_Estimate) * Q;
      Last_Estimate    := Current_Estimate;
      return Current_Estimate;
   end Update_Estimate;

   procedure Set_Measurement_Error (Mea_E : Real) is
   begin
      Measurement_Err := Mea_E;
   end Set_Measurement_Error;

   procedure Set_Estimate_Error (Est_E : Real) is
   begin
      Estimate_Err := Est_E;
   end Set_Estimate_Error;

   procedure Set_Process_Noise (Q : Real) is
   begin
      Kalman_1d.Q := Q;
   end Set_Process_Noise;

   function Get_Kalman_Gain return Real is
   begin
      return Kalman_Gain;
   end Get_Kalman_Gain;

   function Get_Estimate_Error return Real is
   begin
      return Estimate_Err;
   end Get_Estimate_Error;

end Kalman_1d;
