class CoThuGiaiDau_82:
    def __init__(self, maCoThuGiaiDau, maCoThu, maGiaiDau, maTranDau, thayDoiElo, coThu):
        self.__maCoThuGiaiDau = maCoThuGiaiDau
        self.__maCoThu = maCoThu
        self.__maGiaiDau = maGiaiDau
        self.__maTranDau = maTranDau
        self.__thayDoiElo = thayDoiElo
        self.__coThu = coThu

    def getMaCoThuGiaiDau(self):
        return self.__maCoThuGiaiDau

    def setMaCoThuGiaiDau(self, maCoThuGiaiDau):
        self.__maCoThuGiaiDau = maCoThuGiaiDau

    def getMaCoThu(self):
        return self.__maCoThu

    def setMaCoThu(self, maCoThu):
        self.__maCoThu = maCoThu

    def getCoThu(self):
        return self.__coThu

    def setCoThu(self, coThu):
        self.__maCoThu = coThu

    def getMaGiaiDau(self):
        return self.__maGiaiDau

    def setMaGiaiDau(self, maGiaiDau):
        self.__maGiaiDau = maGiaiDau

    def getMaTranDau(self):
        return self.__maTranDau

    def setMaTranDau(self, maTranDau):
        self.__maTranDau = maTranDau

    def getThayDoiElo(self):
        return self.__thayDoiElo

    def setThayDoiElo(self, thayDoiElo):
        self.__thayDoiElo = thayDoiElo
