package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class DocumentRepertoire {
    private Integer id;

    private Integer applicantuserid;

    private Date applicanttime;

    private String keyword;

    private String summary;

    private String archivedescription;

    private String finalreportannex;

    private Integer leaderuserid;

    private Date leadertime;

    private String leadershipopinion;

    private Integer documentuserid;

    private Date documenttime;

    private String filenumber;

    private String filelocation;

    private String archivistopinion;

    private User applicantuser;

    public User getApplicantuser() {
        return applicantuser;
    }

    public void setApplicantuser(User applicantuser) {
        this.applicantuser = applicantuser;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApplicantuserid() {
        return applicantuserid;
    }

    public void setApplicantuserid(Integer applicantuserid) {
        this.applicantuserid = applicantuserid;
    }

    public Date getApplicanttime() {
        return applicanttime;
    }

    public void setApplicanttime(Date applicanttime) {
        this.applicanttime = applicanttime;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary == null ? null : summary.trim();
    }

    public String getArchivedescription() {
        return archivedescription;
    }

    public void setArchivedescription(String archivedescription) {
        this.archivedescription = archivedescription == null ? null : archivedescription.trim();
    }

    public String getFinalreportannex() {
        return finalreportannex;
    }

    public void setFinalreportannex(String finalreportannex) {
        this.finalreportannex = finalreportannex == null ? null : finalreportannex.trim();
    }

    public Integer getLeaderuserid() {
        return leaderuserid;
    }

    public void setLeaderuserid(Integer leaderuserid) {
        this.leaderuserid = leaderuserid;
    }

    public Date getLeadertime() {
        return leadertime;
    }

    public void setLeadertime(Date leadertime) {
        this.leadertime = leadertime;
    }

    public String getLeadershipopinion() {
        return leadershipopinion;
    }

    public void setLeadershipopinion(String leadershipopinion) {
        this.leadershipopinion = leadershipopinion == null ? null : leadershipopinion.trim();
    }

    public Integer getDocumentuserid() {
        return documentuserid;
    }

    public void setDocumentuserid(Integer documentuserid) {
        this.documentuserid = documentuserid;
    }

    public Date getDocumenttime() {
        return documenttime;
    }

    public void setDocumenttime(Date documenttime) {
        this.documenttime = documenttime;
    }

    public String getFilenumber() {
        return filenumber;
    }

    public void setFilenumber(String filenumber) {
        this.filenumber = filenumber == null ? null : filenumber.trim();
    }

    public String getFilelocation() {
        return filelocation;
    }

    public void setFilelocation(String filelocation) {
        this.filelocation = filelocation == null ? null : filelocation.trim();
    }

    public String getArchivistopinion() {
        return archivistopinion;
    }

    public void setArchivistopinion(String archivistopinion) {
        this.archivistopinion = archivistopinion == null ? null : archivistopinion.trim();
    }
}