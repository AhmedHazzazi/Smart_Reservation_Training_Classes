using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Smart_Reservation_Training_Classes.App_Code
{
    public class CLS_Reservations
    {
        DataAccessLayer DAL = new DataAccessLayer();

        //Retrieve Data From Database STRC_DB
        public DataTable BindAllReservations()
        {
            DAL.OpenConnectionDB();
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_BindAllReservations", null);
            DAL.CloseConnectionDB();
            return Dt;
        }
        public DataTable SearchReservation(string Criterion)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Criterion", SqlDbType.NVarChar);
            param[0].Value = Criterion;
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_SearchReservation", param);
            DAL.CloseConnectionDB();
            return Dt;
        }
        public void InsertReservation(int ReservationID, int UserID, string CourseCode, string RoomCode, string TypeSubtraction, string StartDate, string EndDate,
            string Time, string Duration, string Status, string Language, string TargetGroup, string ExpectedNumber, string ImplementingEntity,
            string BeneficiaryEntity, string LecturerName, string Requirements, string UseOfComputer, string CourseTopics, string Notes)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[20];
            param[0] = new SqlParameter("@ReservationID", SqlDbType.Int);
            param[0].Value = ReservationID;
            param[1] = new SqlParameter("@UserID", SqlDbType.Int);
            param[1].Value = UserID;
            param[2] = new SqlParameter("@CourseCode", SqlDbType.NVarChar, 300);
            param[2].Value = CourseCode;
            param[3] = new SqlParameter("@RoomCode", SqlDbType.NVarChar, 300);
            param[3].Value = RoomCode;
            param[4] = new SqlParameter("@TypeSubtraction", SqlDbType.NVarChar);
            param[4].Value = TypeSubtraction;
            param[5] = new SqlParameter("@StartDate", SqlDbType.Char, 10);
            param[5].Value = StartDate;
            param[6] = new SqlParameter("@EndDate", SqlDbType.Char, 10);
            param[6].Value = EndDate;
            param[7] = new SqlParameter("@Time", SqlDbType.Char, 10);
            param[7].Value = Time;
            param[8] = new SqlParameter("@Duration", SqlDbType.NVarChar);
            param[8].Value = Duration;
            param[9] = new SqlParameter("@Status", SqlDbType.NVarChar);
            param[9].Value = Status;
            param[10] = new SqlParameter("@Language", SqlDbType.NVarChar);
            param[10].Value = Language;
            param[11] = new SqlParameter("@TargetGroup", SqlDbType.NVarChar);
            param[11].Value = TargetGroup;
            param[12] = new SqlParameter("@ExpectedNumber", SqlDbType.NVarChar);
            param[12].Value = ExpectedNumber;
            param[13] = new SqlParameter("@ImplementingEntity", SqlDbType.NVarChar);
            param[13].Value = ImplementingEntity;
            param[14] = new SqlParameter("@BeneficiaryEntity", SqlDbType.NVarChar);
            param[14].Value = BeneficiaryEntity;
            param[15] = new SqlParameter("@LecturerName", SqlDbType.NVarChar);
            param[15].Value = LecturerName;
            param[16] = new SqlParameter("@Requirements", SqlDbType.NVarChar);
            param[16].Value = Requirements;
            param[17] = new SqlParameter("@UseOfComputer", SqlDbType.NVarChar, 200);
            param[17].Value = UseOfComputer;
            param[18] = new SqlParameter("@CourseTopics", SqlDbType.NVarChar);
            param[18].Value = CourseTopics;
            param[19] = new SqlParameter("@Notes", SqlDbType.NVarChar);
            param[19].Value = Notes;

            DAL.ExecuteCommandProcedure("SP_InsertReservation", param);
            DAL.CloseConnectionDB();
        }
        public void UpdateReservation(int ReservationID, int UserID, string CourseCode, string RoomCode, string TypeSubtraction, string StartDate, string EndDate,
            string Time, string Duration, string Status, string Language, string TargetGroup, string ExpectedNumber, string ImplementingEntity,
            string BeneficiaryEntity, string LecturerName, string Requirements, string UseOfComputer, string CourseTopics, string Notes)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[20];
            param[0] = new SqlParameter("@ReservationID", SqlDbType.Int);
            param[0].Value = ReservationID;
            param[1] = new SqlParameter("@UserID", SqlDbType.Int);
            param[1].Value = UserID;
            param[2] = new SqlParameter("@CourseCode", SqlDbType.NVarChar, 300);
            param[2].Value = CourseCode;
            param[3] = new SqlParameter("@RoomCode", SqlDbType.NVarChar, 300);
            param[3].Value = RoomCode;
            param[4] = new SqlParameter("@TypeSubtraction", SqlDbType.NVarChar);
            param[4].Value = TypeSubtraction;
            param[5] = new SqlParameter("@StartDate", SqlDbType.Char, 10);
            param[5].Value = StartDate;
            param[6] = new SqlParameter("@EndDate", SqlDbType.Char, 10);
            param[6].Value = EndDate;
            param[7] = new SqlParameter("@Time", SqlDbType.Char, 10);
            param[7].Value = Time;
            param[8] = new SqlParameter("@Duration", SqlDbType.NVarChar);
            param[8].Value = Duration;
            param[9] = new SqlParameter("@Status", SqlDbType.NVarChar);
            param[9].Value = Status;
            param[10] = new SqlParameter("@Language", SqlDbType.NVarChar);
            param[10].Value = Language;
            param[11] = new SqlParameter("@TargetGroup", SqlDbType.NVarChar);
            param[11].Value = TargetGroup;
            param[12] = new SqlParameter("@ExpectedNumber", SqlDbType.NVarChar);
            param[12].Value = ExpectedNumber;
            param[13] = new SqlParameter("@ImplementingEntity", SqlDbType.NVarChar);
            param[13].Value = ImplementingEntity;
            param[14] = new SqlParameter("@BeneficiaryEntity", SqlDbType.NVarChar);
            param[14].Value = BeneficiaryEntity;
            param[15] = new SqlParameter("@LecturerName", SqlDbType.NVarChar);
            param[15].Value = LecturerName;
            param[16] = new SqlParameter("@Requirements", SqlDbType.NVarChar);
            param[16].Value = Requirements;
            param[17] = new SqlParameter("@UseOfComputer", SqlDbType.NVarChar, 200);
            param[17].Value = UseOfComputer;
            param[18] = new SqlParameter("@CourseTopics", SqlDbType.NVarChar);
            param[18].Value = CourseTopics;
            param[19] = new SqlParameter("@Notes", SqlDbType.NVarChar);
            param[19].Value = Notes;

            DAL.ExecuteCommandProcedure("SP_UpdateReservation", param);
            DAL.CloseConnectionDB();
        }
        public void DeleteReservation(int ReservationID)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@ReservationID", SqlDbType.Int);
            param[0].Value = ReservationID;
            DAL.ExecuteCommandProcedure("SP_DeleteReservation", param);
            DAL.CloseConnectionDB();
        }
        public DataTable MaxIDReservationID()
        {
            DAL.OpenConnectionDB();
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_MaxIDReservationID", null);
            DAL.CloseConnectionDB();
            return Dt;
        }
    }
}