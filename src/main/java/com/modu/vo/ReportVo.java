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
//    private int accountbookNo;
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
//    private int tagNo;
    private String tagName;
    private String tagDate;
    private String tagPlace;
    private int tagPersonnel;

    public ReportVo() {
    }

    public ReportVo(int year, int monthNo, int groupNo, String groupName, int categoryNo, String categoryName, String accountbookRegdate, String accountbookUsage, int totalSpend, int totalIncome, int paymentAmount, String paymentDay, String si, String gu, String tagName, String tagDate, String tagPlace, int tagPersonnel) {
        this.year = year;
        this.monthNo = monthNo;
        this.groupNo = groupNo;
        this.groupName = groupName;
        this.categoryNo = categoryNo;
        this.categoryName = categoryName;
        this.accountbookRegdate = accountbookRegdate;
        this.accountbookUsage = accountbookUsage;
        this.totalSpend = totalSpend;
        this.totalIncome = totalIncome;
        this.paymentAmount = paymentAmount;
        this.paymentDay = paymentDay;
        this.si = si;
        this.gu = gu;
        this.tagName = tagName;
        this.tagDate = tagDate;
        this.tagPlace = tagPlace;
        this.tagPersonnel = tagPersonnel;
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

    public String getTagPlace() {
        return tagPlace;
    }

    public void setTagPlace(String tagPlace) {
        this.tagPlace = tagPlace;
    }

    public int getTagPersonnel() {
        return tagPersonnel;
    }

    public void setTagPersonnel(int tagPersonnel) {
        this.tagPersonnel = tagPersonnel;
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
                ", accountbookRegdate='" + accountbookRegdate + '\'' +
                ", accountbookUsage='" + accountbookUsage + '\'' +
                ", totalSpend=" + totalSpend +
                ", totalIncome=" + totalIncome +
                ", paymentAmount=" + paymentAmount +
                ", paymentDay='" + paymentDay + '\'' +
                ", si='" + si + '\'' +
                ", gu='" + gu + '\'' +
                ", tagName='" + tagName + '\'' +
                ", tagDate='" + tagDate + '\'' +
                ", tagPlace='" + tagPlace + '\'' +
                ", tagPersonnel=" + tagPersonnel +
                '}'+"\n";
    }
}
