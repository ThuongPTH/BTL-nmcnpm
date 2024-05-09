
from flask import Flask, render_template, request, redirect
import mysql.connector
from mysql.connector import Error
from Model.VongDau import vongDau_82
from Model.BXH import BangXepHangVongDau_82
from Model.CoThu import CoThu_82
from Model.CoThuGiaiDau import CoThuGiaiDau_82

app = Flask(__name__)

# Thiết lập kết nối đến cơ sở dữ liệu MySQL
app.config['MYSQL_HOST'] = '127.0.0.1'  # Địa chỉ máy chủ MySQL
app.config['MYSQL_USER'] = 'root'   # Tên người dùng MySQL
app.config['MYSQL_PASSWORD'] = 'root'  # Mật khẩu MySQL
app.config['MYSQL_DB'] = 'quanlygiaidau'  # Tên cơ sở dữ liệu MySQL

# Khởi tạo kết nối MySQL
try:
    db_con = mysql.connector.connect(
        host=app.config['MYSQL_HOST'],
        user=app.config['MYSQL_USER'],
        password=app.config['MYSQL_PASSWORD'],
        database=app.config['MYSQL_DB']
    )
    if db_con.is_connected():
        print("Kết nối thành công đến cơ sở dữ liệu MySQL")
except Error as e:
    print("Lỗi khi kết nối đến cơ sở dữ liệu MySQL:", e)

class BXHFrm_82:
    def __init__(self, dsVongDau):
        self.dsVongDau = dsVongDau

    def BXHFrm_82(self):
        #print (self.dsVongDau)
        return render_template('BXHFrm.html', dsVongDau=self.dsVongDau)

class DSCoThuBXHFrm_82:
    def __init__(self, ds_co_thu):
        self.dsCoThu = ds_co_thu

    def DsCoThuBXHFrm(self):
        # Hiển thị danh sách cờ thủ trong BXH
        return render_template('ds_co_thu.html', ds_co_thu=self.dsCoThu)

class BXHDAO_82:
    def __init__(self, db_con):
        self.dbCon = db_con

    def searchDsVongDau(self, maGiaiDau):
        # Tìm kiếm danh sách vòng đấu theo giải đấu
        cursor = self.dbCon.cursor()
        query = "SELECT * FROM VongDau_82 WHERE maGiaiDau = %s"
        cursor.execute(query, (maGiaiDau, ))
        result = cursor.fetchall()
        cursor.close()
        ds_vong_dau = []
        for row in result:
            vong_dau = vongDau_82(row[0], row[1], row[2], row[3])  # Tạo đối tượng VongDau từ dữ liệu trong hàng
            ds_vong_dau.append(vong_dau)
        return ds_vong_dau

    def search_bxh_vong_dau(self, vong_dau):
        # Tìm kiếm bảng xếp hạng vòng đấu
        cursor = self.dbCon.cursor()
        query = "SELECT * FROM bang_xep_hang WHERE ma_vong_dau = %s"
        cursor.execute(query, (vong_dau, ))
        result = cursor.fetchall()
        cursor.close()
        return result

bxh_dao = BXHDAO_82(db_con)

@app.route('/')
def index():
    # Sử dụng lớp BHXDAO_82 để tìm kiếm danh sách vòng đấu và bảng xếp hạng vòng đấu
    ds_vong_dau = bxh_dao.searchDsVongDau(1)
    BXHFrm = BXHFrm_82(ds_vong_dau)
    return BXHFrm.BXHFrm_82()
    #bxh_vong_dau = bhx_dao.search_bxh_vong_dau('2')
    
@app.route('/process_vong_dau', methods=['GET'])
def process_vong_dau():
    selected_vong_dau = request.args.get('selectedVongDau')
    #chuyển hướng đến trang xử lý vòng đấu cụ thể
    return redirect(f'/vong_dau/{selected_vong_dau}')

@app.route('/vong_dau/<int:ma_vong_dau>')
def vong_dau(ma_vong_dau):
    # Trong ví dụ này, chỉ in ra mã vòng đấu
    ds_co_thu = bxh_dao.search_bxh_vong_dau(int(ma_vong_dau))
    DSCoThuBXHFrm = DSCoThuBXHFrm_82(ma_vong_dau)
    return f"Mã vòng đấu được chọn: {ma_vong_dau}"


if __name__ == '__main__':
    app.run(debug=True)