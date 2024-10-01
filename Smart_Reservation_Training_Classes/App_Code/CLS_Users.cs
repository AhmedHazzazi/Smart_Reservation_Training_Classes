using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web;

namespace Smart_Reservation_Training_Classes.App_Code
{
    public class CLS_Users
    {
        DataAccessLayer DAL = new DataAccessLayer();

        //Retrieve Data From Database STRC_DB
        public DataTable LoginUsers(string UserName, string Password)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@UserName", SqlDbType.NVarChar);
            param[0].Value = UserName;
            param[1] = new SqlParameter("@Password", SqlDbType.NVarChar);
            param[1].Value = Password;
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_LoginUsers", param);
            DAL.CloseConnectionDB();
            return Dt;
        }
        public DataTable BindAllUsers()
        {
            DAL.OpenConnectionDB();
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_BindAllUsers", null);
            DAL.CloseConnectionDB();
            return Dt;
        }
        public DataTable SearchUser(string Criterion)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Criterion", SqlDbType.NVarChar);
            param[0].Value = Criterion;
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_SearchUser", param);
            DAL.CloseConnectionDB();
            return Dt;
        }
        public DataTable SearchAvailableUser(string Criterion)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Criterion", SqlDbType.NVarChar);
            param[0].Value = Criterion;
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_SearchAvailableUser", param);
            DAL.CloseConnectionDB();
            return Dt;
        }
        public DataTable SearchAvailableEmail(string Criterion)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Criterion", SqlDbType.NVarChar);
            param[0].Value = Criterion;
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_SearchAvailableEmail", param);
            DAL.CloseConnectionDB();
            return Dt;
        }
        public void InsertUser(decimal UserID, string Name, string UserName, string Password, string Email, string Role)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@UserID", SqlDbType.Decimal);
            param[0].Value = UserID;
            param[1] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[1].Value = Name;
            param[2] = new SqlParameter("@UserName", SqlDbType.NVarChar);
            param[2].Value = UserName;
            param[3] = new SqlParameter("@Password", SqlDbType.NVarChar);
            param[3].Value = Password;
            param[4] = new SqlParameter("@Email", SqlDbType.NVarChar);
            param[4].Value = Email;
            param[5] = new SqlParameter("@Role", SqlDbType.NVarChar);
            param[5].Value = Role;
            DAL.ExecuteCommandProcedure("SP_InsertUser", param);
            DAL.CloseConnectionDB();
        }
        public void UpdateUser(decimal UserID, string Name, string UserName, string Password, string Email, string Role)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@UserID", SqlDbType.Decimal);
            param[0].Value = UserID;
            param[1] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[1].Value = Name;
            param[2] = new SqlParameter("@UserName", SqlDbType.NVarChar);
            param[2].Value = UserName;
            param[3] = new SqlParameter("@Password", SqlDbType.NVarChar);
            param[3].Value = Password;
            param[4] = new SqlParameter("@Email", SqlDbType.NVarChar);
            param[4].Value = Email;
            param[5] = new SqlParameter("@Role", SqlDbType.NVarChar);
            param[5].Value = Role;
            DAL.ExecuteCommandProcedure("SP_UpdateUser", param);
            DAL.CloseConnectionDB();
        }
        public void DeleteUser(decimal UserID)
        {
            DAL.OpenConnectionDB();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@UserID", SqlDbType.Decimal);
            param[0].Value = UserID;
            DAL.ExecuteCommandProcedure("SP_DeleteUser", param);
            DAL.CloseConnectionDB();
        }
        public DataTable MaxIDUserID()
        {
            DAL.OpenConnectionDB();
            DataTable Dt = new DataTable();
            Dt = DAL.SelectDataProcedure("SP_MaxIDUserID", null);
            DAL.CloseConnectionDB();
            return Dt;
        }
    }
}