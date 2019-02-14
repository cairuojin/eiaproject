package com.gjsyoung.eiaproject.domain;

import org.springframework.data.annotation.Transient;

import java.util.Date;

public class ProjectRiskAnalysis {
    private Integer id;

    private Integer riskanalysisuserid;

    private Integer eiacategory;

    private Integer companyqualification;

    private String projectinformation;

    private String projectinvestment;

    private Integer natureconstruction;

    private String contentsofconstruction;

    private String processroute;

    private String constructionscale;

    private String geographicalposition;

    private Integer projectcategory;

    private Integer projectgrade;

    private String extension;

    private Integer drainage;

    private Integer environmental;

    private Integer contaminants;

    private Integer entrycriteria;

    private Integer otherpolicies;

    private Integer twohighandonecapital;

    private Integer industry;

    private Integer environmentalprotection;

    private Integer hygiene;

    private Integer park;

    private Integer otherlocation;

    private String involvingprotectedareas;

    private String othersensitivetargets;

    private String otherquestions;

    private String projectgroupcomments;

    private String remarks1;

    private String remarks2;

    private String remarks3;

    private String remarks4;

    private String remarks5;

    private String remarks6;

    private String remarks7;

    private String remarks8;

    private String remarks9;

    private String remarks10;

    private String remarks11;

    private String remarks12;

    private String remarks13;

    private String remarks14;

    private String remarks15;

    private String remarks16;

    private String remarks17;

    private String remarks18;

    private String remarks19;

    private String remarks20;

    private String remarks21;

    private String remarks22;

    private String remarks23;

    private String remarks24;

    private String remarks25;

    private Date createtime;

    @Transient
    private User user;  //风险录入人员

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRiskanalysisuserid() {
        return riskanalysisuserid;
    }

    public void setRiskanalysisuserid(Integer riskanalysisuserid) {
        this.riskanalysisuserid = riskanalysisuserid;
    }

    public Integer getEiacategory() {
        return eiacategory;
    }

    public void setEiacategory(Integer eiacategory) {
        this.eiacategory = eiacategory;
    }

    public Integer getCompanyqualification() {
        return companyqualification;
    }

    public void setCompanyqualification(Integer companyqualification) {
        this.companyqualification = companyqualification;
    }

    public String getProjectinformation() {
        return projectinformation;
    }

    public void setProjectinformation(String projectinformation) {
        this.projectinformation = projectinformation == null ? null : projectinformation.trim();
    }

    public String getProjectinvestment() {
        return projectinvestment;
    }

    public void setProjectinvestment(String projectinvestment) {
        this.projectinvestment = projectinvestment == null ? null : projectinvestment.trim();
    }

    public Integer getNatureconstruction() {
        return natureconstruction;
    }

    public void setNatureconstruction(Integer natureconstruction) {
        this.natureconstruction = natureconstruction;
    }

    public String getContentsofconstruction() {
        return contentsofconstruction;
    }

    public void setContentsofconstruction(String contentsofconstruction) {
        this.contentsofconstruction = contentsofconstruction == null ? null : contentsofconstruction.trim();
    }

    public String getProcessroute() {
        return processroute;
    }

    public void setProcessroute(String processroute) {
        this.processroute = processroute == null ? null : processroute.trim();
    }

    public String getConstructionscale() {
        return constructionscale;
    }

    public void setConstructionscale(String constructionscale) {
        this.constructionscale = constructionscale == null ? null : constructionscale.trim();
    }

    public String getGeographicalposition() {
        return geographicalposition;
    }

    public void setGeographicalposition(String geographicalposition) {
        this.geographicalposition = geographicalposition == null ? null : geographicalposition.trim();
    }

    public Integer getProjectcategory() {
        return projectcategory;
    }

    public void setProjectcategory(Integer projectcategory) {
        this.projectcategory = projectcategory;
    }

    public Integer getProjectgrade() {
        return projectgrade;
    }

    public void setProjectgrade(Integer projectgrade) {
        this.projectgrade = projectgrade;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension == null ? null : extension.trim();
    }

    public Integer getDrainage() {
        return drainage;
    }

    public void setDrainage(Integer drainage) {
        this.drainage = drainage;
    }

    public Integer getEnvironmental() {
        return environmental;
    }

    public void setEnvironmental(Integer environmental) {
        this.environmental = environmental;
    }

    public Integer getContaminants() {
        return contaminants;
    }

    public void setContaminants(Integer contaminants) {
        this.contaminants = contaminants;
    }

    public Integer getEntrycriteria() {
        return entrycriteria;
    }

    public void setEntrycriteria(Integer entrycriteria) {
        this.entrycriteria = entrycriteria;
    }

    public Integer getOtherpolicies() {
        return otherpolicies;
    }

    public void setOtherpolicies(Integer otherpolicies) {
        this.otherpolicies = otherpolicies;
    }

    public Integer getTwohighandonecapital() {
        return twohighandonecapital;
    }

    public void setTwohighandonecapital(Integer twohighandonecapital) {
        this.twohighandonecapital = twohighandonecapital;
    }

    public Integer getIndustry() {
        return industry;
    }

    public void setIndustry(Integer industry) {
        this.industry = industry;
    }

    public Integer getEnvironmentalprotection() {
        return environmentalprotection;
    }

    public void setEnvironmentalprotection(Integer environmentalprotection) {
        this.environmentalprotection = environmentalprotection;
    }

    public Integer getHygiene() {
        return hygiene;
    }

    public void setHygiene(Integer hygiene) {
        this.hygiene = hygiene;
    }

    public Integer getPark() {
        return park;
    }

    public void setPark(Integer park) {
        this.park = park;
    }

    public Integer getOtherlocation() {
        return otherlocation;
    }

    public void setOtherlocation(Integer otherlocation) {
        this.otherlocation = otherlocation;
    }

    public String getInvolvingprotectedareas() {
        return involvingprotectedareas;
    }

    public void setInvolvingprotectedareas(String involvingprotectedareas) {
        this.involvingprotectedareas = involvingprotectedareas == null ? null : involvingprotectedareas.trim();
    }

    public String getOthersensitivetargets() {
        return othersensitivetargets;
    }

    public void setOthersensitivetargets(String othersensitivetargets) {
        this.othersensitivetargets = othersensitivetargets == null ? null : othersensitivetargets.trim();
    }

    public String getOtherquestions() {
        return otherquestions;
    }

    public void setOtherquestions(String otherquestions) {
        this.otherquestions = otherquestions == null ? null : otherquestions.trim();
    }

    public String getProjectgroupcomments() {
        return projectgroupcomments;
    }

    public void setProjectgroupcomments(String projectgroupcomments) {
        this.projectgroupcomments = projectgroupcomments == null ? null : projectgroupcomments.trim();
    }

    public String getRemarks1() {
        return remarks1;
    }

    public void setRemarks1(String remarks1) {
        this.remarks1 = remarks1 == null ? null : remarks1.trim();
    }

    public String getRemarks2() {
        return remarks2;
    }

    public void setRemarks2(String remarks2) {
        this.remarks2 = remarks2 == null ? null : remarks2.trim();
    }

    public String getRemarks3() {
        return remarks3;
    }

    public void setRemarks3(String remarks3) {
        this.remarks3 = remarks3 == null ? null : remarks3.trim();
    }

    public String getRemarks4() {
        return remarks4;
    }

    public void setRemarks4(String remarks4) {
        this.remarks4 = remarks4 == null ? null : remarks4.trim();
    }

    public String getRemarks5() {
        return remarks5;
    }

    public void setRemarks5(String remarks5) {
        this.remarks5 = remarks5 == null ? null : remarks5.trim();
    }

    public String getRemarks6() {
        return remarks6;
    }

    public void setRemarks6(String remarks6) {
        this.remarks6 = remarks6 == null ? null : remarks6.trim();
    }

    public String getRemarks7() {
        return remarks7;
    }

    public void setRemarks7(String remarks7) {
        this.remarks7 = remarks7 == null ? null : remarks7.trim();
    }

    public String getRemarks8() {
        return remarks8;
    }

    public void setRemarks8(String remarks8) {
        this.remarks8 = remarks8 == null ? null : remarks8.trim();
    }

    public String getRemarks9() {
        return remarks9;
    }

    public void setRemarks9(String remarks9) {
        this.remarks9 = remarks9 == null ? null : remarks9.trim();
    }

    public String getRemarks10() {
        return remarks10;
    }

    public void setRemarks10(String remarks10) {
        this.remarks10 = remarks10 == null ? null : remarks10.trim();
    }

    public String getRemarks11() {
        return remarks11;
    }

    public void setRemarks11(String remarks11) {
        this.remarks11 = remarks11 == null ? null : remarks11.trim();
    }

    public String getRemarks12() {
        return remarks12;
    }

    public void setRemarks12(String remarks12) {
        this.remarks12 = remarks12 == null ? null : remarks12.trim();
    }

    public String getRemarks13() {
        return remarks13;
    }

    public void setRemarks13(String remarks13) {
        this.remarks13 = remarks13 == null ? null : remarks13.trim();
    }

    public String getRemarks14() {
        return remarks14;
    }

    public void setRemarks14(String remarks14) {
        this.remarks14 = remarks14 == null ? null : remarks14.trim();
    }

    public String getRemarks15() {
        return remarks15;
    }

    public void setRemarks15(String remarks15) {
        this.remarks15 = remarks15 == null ? null : remarks15.trim();
    }

    public String getRemarks16() {
        return remarks16;
    }

    public void setRemarks16(String remarks16) {
        this.remarks16 = remarks16 == null ? null : remarks16.trim();
    }

    public String getRemarks17() {
        return remarks17;
    }

    public void setRemarks17(String remarks17) {
        this.remarks17 = remarks17 == null ? null : remarks17.trim();
    }

    public String getRemarks18() {
        return remarks18;
    }

    public void setRemarks18(String remarks18) {
        this.remarks18 = remarks18 == null ? null : remarks18.trim();
    }

    public String getRemarks19() {
        return remarks19;
    }

    public void setRemarks19(String remarks19) {
        this.remarks19 = remarks19 == null ? null : remarks19.trim();
    }

    public String getRemarks20() {
        return remarks20;
    }

    public void setRemarks20(String remarks20) {
        this.remarks20 = remarks20 == null ? null : remarks20.trim();
    }

    public String getRemarks21() {
        return remarks21;
    }

    public void setRemarks21(String remarks21) {
        this.remarks21 = remarks21 == null ? null : remarks21.trim();
    }

    public String getRemarks22() {
        return remarks22;
    }

    public void setRemarks22(String remarks22) {
        this.remarks22 = remarks22 == null ? null : remarks22.trim();
    }

    public String getRemarks23() {
        return remarks23;
    }

    public void setRemarks23(String remarks23) {
        this.remarks23 = remarks23 == null ? null : remarks23.trim();
    }

    public String getRemarks24() {
        return remarks24;
    }

    public void setRemarks24(String remarks24) {
        this.remarks24 = remarks24 == null ? null : remarks24.trim();
    }

    public String getRemarks25() {
        return remarks25;
    }

    public void setRemarks25(String remarks25) {
        this.remarks25 = remarks25 == null ? null : remarks25.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}