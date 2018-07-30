package com.modu.vo;

public class ReportVo {
    private int year;
    private int monthNo;
    //그룹 테이블
    private int groupNo;
    private String groupName;
//    private int memberFeeAmount;
//    private int memberFeeDate;
    //카테고리 테이블
    private int categoryNo;
    private String categoryName;
    //어카운트북_태그 테이블
//    private int accountbookTagNo;
    //어카운트북 테이블 
    private int accountbookNo;
    private String accountbookRegdate;
    private String accountbookUsage;
    private int totalSpend;
    private int totalIncome;
    //멤버피 테이블
//    private int memberFeeNo;
//    private int paymentFee;
//    private String paymentDate;
    private int paymentAmount;
    private String paymentDay;
    //테그_플래이스 테이블
//    private int tagPlaceNo;
    private String si;
    private String gu;
    //태그 테이블
    private int tagNo;
    private String tagName;
    private String tagDate;
    private String accountbookPlace;
    private int accountbookPersonnel;
//페이징
final int listCnt = 3;
    final int pageBtnCount = 1;
    private int crtPage;

    public ReportVo() {
    }

    public ReportVo(int year, int monthNo, int groupNo, String groupName, int categoryNo, String categoryName, int accountbookNo, String accountbookRegdate, String accountbookUsage, int totalSpend, int totalIncome, int paymentAmount, String paymentDay, String si, String gu, int tagNo, String tagName, String tagDate, String accountbookPlace, int accountbookPersonnel, int crtPage) {
        this.year = year;
        this.monthNo = monthNo;
        this.groupNo = groupNo;
        this.groupName = groupName;
        this.categoryNo = categoryNo;
        this.categoryName = categoryName;
        this.accountbookNo = accountbookNo;
        this.accountbookRegdate = accountbookRegdate;
        this.accountbookUsage = accountbookUsage;
        this.totalSpend = totalSpend;
        this.totalIncome = totalIncome;
        this.paymentAmount = paymentAmount;
        this.paymentDay = paymentDay;
        this.si = si;
        this.gu = gu;
        this.tagNo = tagNo;
        this.tagName = tagName;
        this.tagDate = tagDate;
        this.accountbookPlace = accountbookPlace;
        this.accountbookPersonnel = accountbookPersonnel;
        this.crtPage = crtPage;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonthNo() {
        return monthNo;
    }

    public void setMonthNo(int monthNo) {
        this.monthNo = monthNo;
    }

    public int getGroupNo() {
        return groupNo;
    }

    public void setGroupNo(int groupNo) {
        this.groupNo = groupNo;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public int getCategoryNo() {
        return categoryNo;
    }

    public void setCategoryNo(int categoryNo) {
        this.categoryNo = categoryNo;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getAccountbookNo() {
        return accountbookNo;
    }

    public void setAccountbookNo(int accountbookNo) {
        this.accountbookNo = accountbookNo;
    }

    public String getAccountbookRegdate() {
        return accountbookRegdate;
    }

    public void setAccountbookRegdate(String accountbookRegdate) {
        this.accountbookRegdate = accountbookRegdate;
    }

    public String getAccountbookUsage() {
        return accountbookUsage;
    }

    public void setAccountbookUsage(String accountbookUsage) {
        this.accountbookUsage = accountbookUsage;
    }

    public int getTotalSpend() {
        return totalSpend;
    }

    public void setTotalSpend(int totalSpend) {
        this.totalSpend = totalSpend;
    }

    public int getTotalIncome() {
        return totalIncome;
    }

    public void setTotalIncome(int totalIncome) {
        this.totalIncome = totalIncome;
    }

    public int getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(int paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public String getPaymentDay() {
        return paymentDay;
    }

    public void setPaymentDay(String paymentDay) {
        this.paymentDay = paymentDay;
    }

    public String getSi() {
        return si;
    }

    public void setSi(String si) {
        this.si = si;
    }

    public String getGu() {
        return gu;
    }

    public void setGu(String gu) {
        this.gu = gu;
    }

    public int getTagNo() {
        return tagNo;
    }

    public void setTagNo(int tagNo) {
        this.tagNo = tagNo;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public String getTagDate() {
        return tagDate;
    }

    public void setTagDate(String tagDate) {
        this.tagDate = tagDate;
    }

    public String getAccountbookPlace() {
        return accountbookPlace;
    }

    public void setAccountbookPlace(String accountbookPlace) {
        this.accountbookPlace = accountbookPlace;
    }

    public int getAccountbookPersonnel() {
        return accountbookPersonnel;
    }

    public void setAccountbookPersonnel(int accountbookPersonnel) {
        this.accountbookPersonnel = accountbookPersonnel;
    }

    public int getListCnt() {
        return listCnt;
    }

    public int getPageBtnCount() {
        return pageBtnCount;
    }

    public int getCrtPage() {
        return crtPage;
    }

    public void setCrtPage(int crtPage) {
        this.crtPage = crtPage;
    }

    @Override
    public String toString() {
        return "ReportVo{" +
                "year=" + year +
                ", monthNo=" + monthNo +
                ", groupNo=" + groupNo +
                ", groupName='" + groupName + '\'' +
                ", categoryNo=" + categoryNo +
                ", categoryName='" + categoryName + '\'' +
                ", accountbookNo=" + accountbookNo +
                ", accountbookRegdate='" + accountbookRegdate + '\'' +
                ", accountbookUsage='" + accountbookUsage + '\'' +
                ", totalSpend=" + totalSpend +
                ", totalIncome=" + totalIncome +
                ", paymentAmount=" + paymentAmount +
                ", paymentDay='" + paymentDay + '\'' +
                ", si='" + si + '\'' +
                ", gu='" + gu + '\'' +
                ", tagNo=" + tagNo +
                ", tagName='" + tagName + '\'' +
                ", tagDate='" + tagDate + '\'' +
                ", accountbookPlace='" + accountbookPlace + '\'' +
                ", accountbookPersonnel=" + accountbookPersonnel +
                ", listCnt=" + listCnt +
                ", pageBtnCount=" + pageBtnCount +
                ", crtPage=" + crtPage +
                '}'+"\n";
    }
}
