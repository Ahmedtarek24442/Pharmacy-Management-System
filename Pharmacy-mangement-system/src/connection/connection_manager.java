/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connection;
import com.mysql.cj.jdbc.PreparedStatementWrapper;
import java.sql.ResultSetMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.swing.JOptionPane;
import java.util.List;
import java.util.ArrayList;
/**
 *
 * @author ABO TAREK
 */
public class connection_manager {
   private Connection getconnect() {
    try {
        
        // إنشاء الاتصال
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/updated_pharamcy",
            "root",
            "El3aref#2023"
        );
        return con; // إعادة الاتصال إذا كان ناجحًا
    } catch (Exception e) {
        // طباعة الخطأ للمطورين
        e.printStackTrace();
        
        // عرض رسالة للمستخدم
        JOptionPane.showMessageDialog(
            null,
            "Connection to the database failed. Please check the configuration."
        );
        return null; // إعادة null إذا حدث خطأ
    }
}

    
   public String[] getColumn(String table_name, String column_name) {
    Connection con = null;
    int rowCount = 0;

    try {
        // الحصول على الاتصال
        con = getconnect();

        // الحصول على عدد الصفوف
        String countQuery = "SELECT COUNT(*) AS row_count FROM " + table_name;
        try (PreparedStatement st = con.prepareStatement(countQuery); 
             ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                rowCount = rs.getInt("row_count");
            }
        }

        // إذا كان عدد الصفوف 0
        if (rowCount == 0) {
            return null;
        }

        // استخراج البيانات
        String query = "SELECT " + column_name + " FROM " + table_name;
        String[] result = new String[rowCount];
        try (PreparedStatement st = con.prepareStatement(query); 
             ResultSet rs = st.executeQuery()) {
            int count = 0;
            while (rs.next()) {
                result[count] = rs.getString(column_name);
                count++;
            }
        }
        
        // إغلاق الاتصال
        con.close();
        // reverse result
        return result;

    } catch (Exception e) {
        e.printStackTrace(); // طباعة الخطأ للمطورين
        return new String[]{"Error retrieving data"};
    } finally {
        // التأكد من إغلاق الاتصال
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
   public String[] getColumn(String table_name, String column_name,String id) {
    Connection con = null;
    int rowCount = 0;

    try {
        // الحصول على الاتصال
        con = getconnect();
        String id_name = "";
        if (table_name.equals("purchaseinvoices"))
            id_name = "parchase_id";
        
        else id_name = "sells_id";
        

        // الحصول على عدد الصفوف
        String countQuery = "SELECT COUNT(*) AS row_count FROM "+table_name+" where "+ id_name +" = ?";
        try  {
            PreparedStatement st = con.prepareStatement(countQuery);
            st.setInt(1, Integer.parseInt(id));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                rowCount = rs.getInt("row_count");
            }
        }catch (Exception e) {
            e.printStackTrace();
        }

        // إذا كان عدد الصفوف 0
        if (rowCount == 0) {
            return null;
        }

        // استخراج البيانات
        String query = "SELECT " + column_name + " FROM " + table_name + " where "+id_name+" = ?";
        String[] result = new String[rowCount];
        try {
            PreparedStatement st = con.prepareStatement(query); 
            st.setInt(1,  Integer.parseInt(id));
            ResultSet rs = st.executeQuery();
            int count = 0;
            while (rs.next()) {
                result[count] = rs.getString(column_name);
                count++;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        
        // إغلاق الاتصال
        con.close();
        // reverse result
        return result;

    } 
    catch (Exception e) {
        e.printStackTrace(); // طباعة الخطأ للمطورين
        return new String[]{"Error retrieving data"};
    } finally {
        // التأكد من إغلاق الاتصال
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
   public boolean CheckCorrectPassword(String table, String FirstColumn, String SecondColumn, String FirstElement, String SecondElement) {
    Connection con = null;
    try {
        con = getconnect();
        if (con == null) {
            return false;
        }
        
        // استخدام استعلام محضر لمنع SQL Injection
        String query = "SELECT " + SecondColumn + " FROM " + table + " WHERE " + FirstColumn + " = ?";
        try (PreparedStatement st = con.prepareStatement(query)) {
            st.setString(1, FirstElement); // تعيين القيمة
            ResultSet rs = st.executeQuery();

            if (rs.next()) { // التأكد من وجود النتائج
                String password = rs.getString(SecondColumn);
                return SecondElement.equals(password); // مقارنة كلمات المرور
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    return false;
}

   public void pushData(String table,String columns,String values) {
       Connection con = null;
       
       try {
           con = getconnect();
           String Quary = "Insert into "+ table + "("+ columns + ") Values(";
           String[] arr = values.split(",");
           for (int i =0; i < arr.length - 1;i++){    
               Quary += "?,";
           }
           Quary += "?)";
           try {
               PreparedStatement st = con.prepareStatement(Quary);
               for (int i = 0; i < arr.length;i++) {                   
                    st.setString(i + 1, arr[i]);
               }
               st.execute();
           }
           catch(Exception e) {
               e.printStackTrace();
           }
       }catch (Exception e) {
           e.printStackTrace();
       }
   }
   
    public void deleteRow(String table,String column,String value) {
       Connection con = null;
        con = getconnect();
        String Quary = "delete from " +  table + " where " + column + " = ?";
       
       try {
           PreparedStatement st = con.prepareStatement(Quary);
           st.setString(1, value); 
           st.execute();
           
       }catch (Exception e) {
           e.printStackTrace();
       }
   }
    
    public String[] getRow(String table, String columnReference, String elementInColumnAndRow) {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        String[] result = null;
        try {
            con = getconnect();
            String query = "SELECT * FROM " + table + " WHERE " + columnReference + " = ?";
            st = con.prepareStatement(query);
            st.setString(1, elementInColumnAndRow);

            rs = st.executeQuery();

            if (rs.next()) {
                // استخدم النوع الصحيح لنتائج ميتا
                java.sql.ResultSetMetaData metaData = rs.getMetaData();
                int columnCount = metaData.getColumnCount();

                // إنشاء مصفوفة لتخزين القيم
                result = new String[columnCount];

                // تعبئة المصفوفة بالقيم من الصف
                for (int i = 1; i <= columnCount; i++) {
                    result[i - 1] = rs.getString(i);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public void updateData(String table,String column2,String column1,String ElementInColumn2,String ElementToUpdate) {
        Connection con = null;
        PreparedStatement st = null;
        String Qaury = "update " + table + " Set " + column1 + " = ? " + "Where " + column2 + " = ?" ;
        try {
            con = getconnect();
            st = con.prepareStatement(Qaury);
            st.setString(1, ElementToUpdate);
            st.setString(2, ElementInColumn2);
            st.execute();           
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    public String[] search(String table, String column, String someText) {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        List<String> results = new ArrayList<>(); // Correct declaration with generics
        
        String query = "SELECT " + column + " FROM " + table + " WHERE " + column + " LIKE ?";
        try {
            con = getconnect();
            st = con.prepareStatement(query);
            if(table.equals("sellsinvoices") || table.equals("purchaseinvoices"))
                st.setString(1, "%" + someText);
            else
                st.setString(1, someText + "%");
            rs = st.executeQuery();

            while (rs.next()) {
                results.add(rs.getString(column));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return results.toArray(new String[0]);
    }
    public String getFormattedDate() {
        // Current date-time
        LocalDateTime now = LocalDateTime.now();

        // MySQL format: YYYY-MM-DD HH:mm:ss
        DateTimeFormatter mysqlFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        // Format the date-time
        String formattedDate = now.format(mysqlFormatter);
        
        return formattedDate;
    }
    
    public void storeinvoices (String table, String user_id, String[] medicines_id, String[] medicine_quantity,String[] price,String[] total) {
        Connection con = null;
        PreparedStatement st = null;
        //complete the informations get user role
        String usercolumnname;
        if (table.equals("sellsinvoices"))  usercolumnname = "pharmacist_id";
        else usercolumnname = "admin_id";
        //complete informations get date
        String date = getFormattedDate();
        //complete informations get invoices id
        String columnname_;
        String AmountName_ = "";
        String DatesName_ = "";
        if (table.equals("sellsinvoices")){
            columnname_ = "sells_id";
            AmountName_ = "amount";
            DatesName_ = "sells_date";
        }
        else {
            columnname_ = "parchase_id";
            AmountName_ = "quantity";
            DatesName_ = "purchase_date";
        } 
        String[] temp = getColumn(table, columnname_);
        int invoice_id;
        if (temp == null){
            invoice_id = 1;
        }else {
            invoice_id = Integer.parseInt(temp[temp.length-1]) + 1;
        }
        //set invoice into database
        for (int i = 0; i < medicines_id.length;i++) {
            String Quary = "INSERT INTO " + table + " (" +columnname_ +"," + usercolumnname + ", medicine_id, " + AmountName_ + ", price, total, " + DatesName_ +") VALUES (?, ?, ?, ?, ?, ?, ?)";
            try {
                con = getconnect();
                st = con.prepareStatement(Quary);
                st.setInt(1, invoice_id);  // sells_id
                st.setString(2, user_id);   // pharmacist_id or admin_id
                st.setString(3, medicines_id[i]);  // medicine_id
                st.setInt(4, Integer.parseInt(medicine_quantity[i]));  // amount
                st.setDouble(5, Double.parseDouble(price[i]));  // price
                st.setDouble(6, Double.parseDouble(total[i]));  // total
                st.setString(7, date); 
                st.execute();
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
        String[] real_amount = new String[medicines_id.length];
        for (int i = 0; i < medicines_id.length; i++) {
            real_amount[i] = getRow("medicine", "medicine_id", medicines_id[i])[4];
        }
        //ubdate medicine database;
        if(table.equals("sellsinvoices")) {
           for (int i = 0; i < medicines_id.length;i++) {
            updateData("medicine", "medicine_id", "amount",medicines_id[i], Integer.toString(Integer.parseInt( real_amount[i]) - Integer.parseInt( medicine_quantity[i])));
        } 
        }else {
            for (int i = 0; i < medicines_id.length;i++) {
            updateData("medicine", "medicine_id", "amount",medicines_id[i], Integer.toString(Integer.parseInt( real_amount[i]) + Integer.parseInt( medicine_quantity[i])));
        }
        }
        
    }
}