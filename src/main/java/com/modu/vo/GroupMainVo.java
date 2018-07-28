package com.modu.vo;

public class GroupMainVo {

    private String title;
    private String roadAddress;
    private String telephone;
    private String category;

    private String country;
    private String sido;
    private String sigugun;
    private String dongmyun;
    private String ri;
    private String rest;

    private int tagNo;
    private String tagName;

    public GroupMainVo() {
    }

    public GroupMainVo(String title, String roadAddress, String telephone, String category, String country, String sido, String sigugun, String dongmyun, String ri, String rest, int tagNo, String tagName) {
        this.title = title;
        this.roadAddress = roadAddress;
        this.telephone = telephone;
        this.category = category;
        this.country = country;
        this.sido = sido;
        this.sigugun = sigugun;
        this.dongmyun = dongmyun;
        this.ri = ri;
        this.rest = rest;
        this.tagNo = tagNo;
        this.tagName = tagName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRoadAddress() {
        return roadAddress;
    }

    public void setRoadAddress(String roadAddress) {
        this.roadAddress = roadAddress;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getSido() {
        return sido;
    }

    public void setSido(String sido) {
        this.sido = sido;
    }

    public String getSigugun() {
        return sigugun;
    }

    public void setSigugun(String sigugun) {
        this.sigugun = sigugun;
    }

    public String getDongmyun() {
        return dongmyun;
    }

    public void setDongmyun(String dongmyun) {
        this.dongmyun = dongmyun;
    }

    public String getRi() {
        return ri;
    }

    public void setRi(String ri) {
        this.ri = ri;
    }

    public String getRest() {
        return rest;
    }

    public void setRest(String rest) {
        this.rest = rest;
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

    @Override
    public String toString() {
        return "GroupMainVo{" +
                "title='" + title + '\'' +
                ", roadAddress='" + roadAddress + '\'' +
                ", telephone='" + telephone + '\'' +
                ", category='" + category + '\'' +
                ", country='" + country + '\'' +
                ", sido='" + sido + '\'' +
                ", sigugun='" + sigugun + '\'' +
                ", dongmyun='" + dongmyun + '\'' +
                ", ri='" + ri + '\'' +
                ", rest='" + rest + '\'' +
                ", tagNo=" + tagNo +
                ", tagName='" + tagName + '\'' +
                '}'+"\n";
    }
}
