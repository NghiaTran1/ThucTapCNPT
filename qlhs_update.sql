
SET FOREIGN_KEY_CHECKS=0;
CREATE TABLE `chinhanh` (
  `IDCN` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenCN` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DiaChi` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`IDCN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

CREATE TABLE `hocsinh` (
  `IDHS` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `IDPH` char(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IDPhong` char(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TenHS` varchar(30) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `DiaChi` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `NgayNhapHoc` datetime DEFAULT NULL,
  PRIMARY KEY (`IDHS`),
  KEY `fk_phong` (`IDPhong`),
  KEY `fk_phuhuynh` (`IDPH`),
  CONSTRAINT `fk_phong` FOREIGN KEY (`IDPhong`) REFERENCES `phong` (`IDPhong`),
  CONSTRAINT `fk_phuhuynh` FOREIGN KEY (`IDPH`) REFERENCES `phuhuynh` (`IDPH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

CREATE TABLE `khoi` (
  `IDKhoi` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenKhoi` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IDCN` char(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`IDKhoi`),
  KEY `fk_chinhanh` (`IDCN`),
  CONSTRAINT `fk_chinhanh` FOREIGN KEY (`IDCN`) REFERENCES `chinhanh` (`IDCN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

CREATE TABLE `lop` (
  `IDLop` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenLop` varchar(20) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IDKhoi` char(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`IDLop`),
  KEY `fk_khoi` (`IDKhoi`),
  CONSTRAINT `fk_khoi` FOREIGN KEY (`IDKhoi`) REFERENCES `khoi` (`IDKhoi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

CREATE TABLE `phong` (
  `IDPhong` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenPhong` varchar(20) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IDLop` char(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`IDPhong`),
  KEY `fk_lop` (`IDLop`),
  CONSTRAINT `fk_lop` FOREIGN KEY (`IDLop`) REFERENCES `lop` (`IDLop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

CREATE TABLE `phuhuynh` (
  `IDPH` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenPH` varchar(30) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SDT` int(11) DEFAULT NULL,
  `Password` varchar(30) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`IDPH`),
  KEY `SDT` (`SDT`),
  CONSTRAINT `phuhuynh_ibfk_1` FOREIGN KEY (`SDT`) REFERENCES `user` (`SDT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

CREATE TABLE `user` (
  `SDT` int(11) NOT NULL,
  `Password` varchar(30) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Role` char(8) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`SDT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

