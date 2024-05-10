
from flask import Flask, render_template, request, redirect
import mysql.connector
from mysql.connector import Error
from Model.VongDau import vongDau_82
from Model.BXH import BangXepHangVongDau_82
from Model.CoThu import CoThu_82
from Model.CoThuGiaiDau import CoThuGiaiDau_82
from datetime import datetime

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
        thoiGianHienTai = datetime.now()
        return render_template('BXHFrm.html', dsVongDau=self.dsVongDau, thoiGianHienTai=thoiGianHienTai)

class DSCoThuBXHFrm_82:
    def __init__(self, dsCoThu):
        self.dsCoThu = dsCoThu

    def DsCoThuBXHFrm_82(self):
        # Hiển thị danh sách cờ thủ trong BXH
        return render_template('DsCoThuBXHFrm_82.html', dsCoThu=self.dsCoThu)

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
        query = "SELECT * FROM bxhvongdau_82 WHERE maVongDau = %s"
        cursor.execute(query, (vong_dau, ))
        result = cursor.fetchall()
        cursor.close()
        ds_co_thu = []
        for row in result:
            maCoThu = row[2]
            cursor = self.dbCon.cursor()
            query = "SELECT * FROM cothu_82 WHERE maCoThu = %s"
            cursor.execute(query, (maCoThu, ))
            rs = cursor.fetchall()
            cursor.close()
            coThu = CoThu_82(rs[0][0], rs[0][1], rs[0][2], rs[0][3], rs[0][4], rs[0][5])
            co_thu = BangXepHangVongDau_82(row[0], row[1], row[2], row[3], row[4], row[5], coThu)
            ds_co_thu.append(co_thu)
        ds_co_thu = sorted(ds_co_thu, key=lambda x: (x.getTongDiem(), x.getTongDiemDoiThu(), x.getHeSoElo()), reverse=True)
        return ds_co_thu

bxh_dao = BXHDAO_82(db_con)

@app.route('/')
def index():
    # Sử dụng lớp BHXDAO_82 để tìm kiếm danh sách vòng đấu và bảng xếp hạng vòng đấu
    ds_vong_dau = bxh_dao.searchDsVongDau(1)
    BXHFrm = BXHFrm_82(ds_vong_dau)
    return BXHFrm.BXHFrm_82()
    
@app.route('/process_vong_dau', methods=['GET'])
def process_vong_dau():
    selected_vong_dau = request.args.get('selectedVongDau')
    #chuyển hướng đến trang xử lý vòng đấu cụ thể
    return redirect(f'/vong_dau/{selected_vong_dau}')

@app.route('/vong_dau/<int:ma_vong_dau>')
def vong_dau(ma_vong_dau):
    # Trong ví dụ này, chỉ in ra mã vòng đấu
    ds_co_thu = bxh_dao.search_bxh_vong_dau(ma_vong_dau)
    DSCoThuBXHFrm = DSCoThuBXHFrm_82(ds_co_thu)
    return DSCoThuBXHFrm.DsCoThuBXHFrm_82()


if __name__ == '__main__':
    app.run(debug=True)