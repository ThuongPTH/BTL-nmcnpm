CREATE DATABASE IF NOT EXISTS quanlygiaidau;

USE quanlygiaidau;

CREATE TABLE IF NOT EXISTS GiaiDau_82 (
    maGiaiDau INT AUTO_INCREMENT PRIMARY KEY,
    tenGiaiDau VARCHAR(255),
    nam YEAR,
    lanToChuc INT,
    diaDiem VARCHAR(255),
    moTa TEXT
);

CREATE TABLE IF NOT EXISTS VongDau_82 (
    maVongDau INT AUTO_INCREMENT PRIMARY KEY,
    soVong INT,
    thoiGian DATETIME,
    maGiaiDau INT,
    FOREIGN KEY (maGiaiDau) REFERENCES GiaiDau_82(maGiaiDau)
);

CREATE TABLE IF NOT EXISTS CoThu_82 (
    maCoThu INT AUTO_INCREMENT PRIMARY KEY,
    tenCoThu VARCHAR(255),
    namSinh YEAR,
    quocTich VARCHAR(50),
    heSoElo INT,
    ghiChu VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS CoThuGiaiDau_82 (
    maCoThuGiaiDau INT AUTO_INCREMENT PRIMARY KEY,
    maCoThu INT,
    maGiaiDau INT,
    maTranDau INT,
    thayDoiElo FLOAT,
    FOREIGN KEY (maCoThu) REFERENCES CoThu_82(maCoThu),
    FOREIGN KEY (maGiaiDau) REFERENCES GiaiDau_82(maGiaiDau)
);

CREATE TABLE IF NOT EXISTS BXHVongDau_82 (
    maBXH INT AUTO_INCREMENT PRIMARY KEY,
    maVongDau INT,
    maCoThu INT,
    tongDiem FLOAT,
    heSoElo FLOAT,
    tongDiemDoiThu FLOAT,
    FOREIGN KEY (maVongDau) REFERENCES VongDau_82(maVongDau),
    FOREIGN KEY (maCoThu) REFERENCES CoThu_82(maCoThu)
);
