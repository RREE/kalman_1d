generic
   type Real is digits <>;
package Kalman_1d is
   procedure Init (Mea_E : Real; Est_E : Real; Q : Real);

   function Update_Estimate (Mea : Real) return Real;
   procedure Set_Measurement_Error (Mea_E : Real);
   procedure Set_Estimate_Error (Est_E : Real);
   procedure Set_Process_Noise (Q : Real);
   function Get_Kalman_Gain return Real with Inline;
   function Get_Estimate_Error return Real with Inline;

private
   Measurement_Err  : Real;
   Estimate_Err     : Real;
   Q                : Real;
   Current_Estimate : Real := 0.0;
   Last_Estimate    : Real := 0.0;
   Kalman_Gain      : Real := 0.0;

end Kalman_1d;
