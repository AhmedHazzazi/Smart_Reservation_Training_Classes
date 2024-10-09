using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Smart_Reservation_Training_Classes.App_Code
{
    public class CLS_Courses
    {
        DataAccessLayer DAL = new DataAccessLayer();

        //Retrieve Data From Database STRC_DB
        public DataTable BindAllCourses()
        {
            DAL.OpenConnectionDB();
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_BindAllCourses", null);
            DAL.CloseConnectionDB();
            return Dt;
        }
        public DataTable SearchCourse(string Criterion)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Criterion", SqlDbType.NVarChar, 500);
            param[0].Value = Criterion;
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_SearchCourse", param);
            DAL.CloseConnectionDB();
            return Dt;
        }
        public void InsertCourse(string RoomCode, string RoomName, string RoomType)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@RoomCode", SqlDbType.NVarChar, 200);
            param[0].Value = RoomCode;
            param[1] = new SqlParameter("@RoomName", SqlDbType.NVarChar);
            param[1].Value = RoomName;
            param[2] = new SqlParameter("@RoomType", SqlDbType.NVarChar);
            param[2].Value = RoomType;

            DAL.ExecuteCommandProcedure("SP_InsertCourse", param);
            DAL.CloseConnectionDB();
        }
        public void UpdateCourse(string RoomCode, string RoomName, string RoomType)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@RoomCode", SqlDbType.NVarChar, 200);
            param[0].Value = RoomCode;
            param[1] = new SqlParameter("@RoomName", SqlDbType.NVarChar);
            param[1].Value = RoomName;
            param[2] = new SqlParameter("@RoomType", SqlDbType.NVarChar);
            param[2].Value = RoomType;

            DAL.ExecuteCommandProcedure("SP_UpdateCourse", param);
            DAL.CloseConnectionDB();
        }
        public void DeleteCourse(string CourseCode)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@CourseCode", SqlDbType.NVarChar, 200);
            param[0].Value = CourseCode;
            DAL.ExecuteCommandProcedure("SP_DeleteCourse", param);
            DAL.CloseConnectionDB();
        }
        public DataTable MaxIDRoomID()
        {
            DAL.OpenConnectionDB();
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_MaxIDRoomID", null);
            DAL.CloseConnectionDB();
            return Dt;
        }
    }
}