/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mss.ediscv.tpOnboarding;

import java.sql.Timestamp;

/**
 * @author raja
 */
public class TpOnboardingBean {

    private String partnerName;
    private String pwd;
    private String loginId;
    private String contactName;
    private String contactEmail;
    private String phoneNo;
    private String country;
    private Timestamp lastLoginTS;
    private Timestamp lastLogoutTS;
    private int userId;
    private String address1;
    private String city;
    private String state;
    private String zipCode;
    private String commnProtocol;
    private String transferMode;
    //private boolean transferMode2;
    private String ftp_conn_method;
    private String ftp_method;
    private String ftp_recv_protocol;
    private int ftp_resp_time;
    private String ftp_host;
    private String ftp_port;
    private String ftp_userId;
    private String ftp_pwd;
    private String ftp_directory;
    private boolean ftp_ssl_req;
    private String as2_sysCert;
    private String as2_part_cert;
    private String as2_myOrgName;
    private String as2_partOrgName;
    private String as2_myPartname;
    private String as2_yourPartname;
    private String as2_myEndPoint;
    private String as2_partendpoint;
    private String as2_strMsg;
    private String as2_waitForSync;
    private String as2_ssl_req;
    private String sftp_conn_method;
    private String sftp_auth_method;
    private String sftp_public_key;
    private String sftp_upload_public_key;
    private String sftp_host_ip;
    private String sftp_remote_port;
    private String sftp_remote_userId;
    private String sftp_remote_pwd;
    private String sftp_method;
    private String sftp_directory;
    private String http_recv_protocol;
    private int http_resp_time;
    private String http_endpoint;
    private int http_port;
    private String http_protocol_mode;
    private String http_url;
    private String http_ssl_req;
    private String smtp_recv_protocol;
    private String smtp_server_protocol;
    private int smtp_server_port;
    private String smtp_from_email;
    private String smtp_to_email;
    private boolean ib850;
    private boolean ib855;
    private boolean ib856;
    private boolean ib810;
    private boolean ob850;
    private boolean ob855;
    private boolean ob856;
    private boolean ob810;
    private String isa850senderIdIB;
    private String gs850senderIdIB;
    private String st850senderIdIB;
    private String isa850RecIdIB;
    private String gs850RecIdIB;
    private String st850RecIdIB;
    private String isa850VersionIB;
    private String gs850VersionIB;
    private String st850VersionIB;
    private String fun850GroupIdIB;
    private String res850AgecodeIB;
    private boolean gen850AckIB;
    private String trans850IdcodeIB;
    private String isa855senderIdIB;
    private String gs855senderIdIB;
    private String st855senderIdIB;
    private String isa855RecIdIB;
    private String gs855RecIdIB;
    private String st855RecIdIB;
    private String isa855VersionIB;
    private String gs855VersionIB;
    private String st855VersionIB;
    private String fun855GroupIdIB;
    private String res855AgecodeIB;
    private boolean gen855AckIB;
    private String trans855IdcodeIB;
    private String isa856senderIdIB;
    private String gs856senderIdIB;
    private String st856senderIdIB;
    private String isa856RecIdIB;
    private String gs856RecIdIB;
    private String st856RecIdIB;
    private String isa856VersionIB;
    private String gs856VersionIB;
    private String st856VersionIB;
    private String fun856GroupIdIB;
    private String res856AgecodeIB;
    private boolean gen856AckIB;
    private String trans856IdcodeIB;
    private String isa810senderIdIB;
    private String gs810senderIdIB;
    private String st810senderIdIB;
    private String isa810RecIdIB;
    private String gs810RecIdIB;
    private String st810RecIdIB;
    private String isa810VersionIB;
    private String gs810VersionIB;
    private String st810VersionIB;
    private String fun810GroupIdIB;
    private String res810AgecodeIB;
    private boolean gen810AckIB;
    private String trans810IdcodeIB;
    private String isa850senderIdOB;
    private String gs850senderIdOB;
    private String st850senderIdOB;
    private String isa850RecIdOB;
    private String gs850RecIdOB;
    private String st850RecIdOB;
    private String isa850VersionOB;
    private String gs850VersionOB;
    private String st850VersionOB;
    private String fun850GroupIdOB;
    private String res850AgecodeOB;
    private boolean gen850AckOB;
    private String trans850IdcodeOB;
    private String isa855senderIdOB;
    private String gs855senderIdOB;
    private String st855senderIdOB;
    private String isa855RecIdOB;
    private String gs855RecIdOB;
    private String st855RecIdOB;
    private String isa855VersionOB;
    private String gs855VersionOB;
    private String st855VersionOB;
    private String fun855GroupIdOB;
    private String res855AgecodeOB;
    private boolean gen855AckOB;
    private String trans855IdcodeOB;
    private String isa856senderIdOB;
    private String gs856senderIdOB;
    private String st856senderIdOB;
    private String isa856RecIdOB;
    private String gs856RecIdOB;
    private String st856RecIdOB;
    private String isa856VersionOB;
    private String gs856VersionOB;
    private String st856VersionOB;
    private String fun856GroupIdOB;
    private String res856AgecodeOB;
    private boolean gen856AckOB;
    private String trans856IdcodeOB;
    private String isa810senderIdOB;
    private String gs810senderIdOB;
    private String st810senderIdOB;
    private String isa810RecIdOB;
    private String gs810RecIdOB;
    private String st810RecIdOB;
    private String isa810VersionOB;
    private String gs810VersionOB;
    private String st810VersionOB;
    private String fun810GroupIdOB;
    private String res810AgecodeOB;
    private boolean gen810AckOB;
    private String trans810IdcodeOB;
    private String ibvalue850;
    private String ibdirection;
    private String ibvalue855;
    private String ibdirection855;
    private String ibvalue856;
    private String ibdirection856;
    private String ibvalue810;
    private String ibdirection810;
    private String obvalue850;
    private String obdirection;
    private String obvalue855;
    private String obdirection855;
    private String obvalue856;
    private String obdirection856;
    private String obvalue810;
    private String obdirection810;
    private int id;
    private String creayed_by;
    private Timestamp creayed_ts;

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAs2_myEndPoint() {
        return as2_myEndPoint;
    }

    public void setAs2_myEndPoint(String as2_myEndPoint) {
        this.as2_myEndPoint = as2_myEndPoint;
    }

    public String getAs2_myOrgName() {
        return as2_myOrgName;
    }

    public void setAs2_myOrgName(String as2_myOrgName) {
        this.as2_myOrgName = as2_myOrgName;
    }

    public String getAs2_myPartname() {
        return as2_myPartname;
    }

    public void setAs2_myPartname(String as2_myPartname) {
        this.as2_myPartname = as2_myPartname;
    }

    public String getAs2_partOrgName() {
        return as2_partOrgName;
    }

    public void setAs2_partOrgName(String as2_partOrgName) {
        this.as2_partOrgName = as2_partOrgName;
    }

    public String getAs2_part_cert() {
        return as2_part_cert;
    }

    public void setAs2_part_cert(String as2_part_cert) {
        this.as2_part_cert = as2_part_cert;
    }

    public String getAs2_partendpoint() {
        return as2_partendpoint;
    }

    public void setAs2_partendpoint(String as2_partendpoint) {
        this.as2_partendpoint = as2_partendpoint;
    }

    public String getAs2_ssl_req() {
        return as2_ssl_req;
    }

    public void setAs2_ssl_req(String as2_ssl_req) {
        this.as2_ssl_req = as2_ssl_req;
    }

    public String getAs2_strMsg() {
        return as2_strMsg;
    }

    public void setAs2_strMsg(String as2_strMsg) {
        this.as2_strMsg = as2_strMsg;
    }

    public String getAs2_sysCert() {
        return as2_sysCert;
    }

    public void setAs2_sysCert(String as2_sysCert) {
        this.as2_sysCert = as2_sysCert;
    }

    public String getAs2_waitForSync() {
        return as2_waitForSync;
    }

    public void setAs2_waitForSync(String as2_waitForSync) {
        this.as2_waitForSync = as2_waitForSync;
    }

    public String getAs2_yourPartname() {
        return as2_yourPartname;
    }

    public void setAs2_yourPartname(String as2_yourPartname) {
        this.as2_yourPartname = as2_yourPartname;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCommnProtocol() {
        return commnProtocol;
    }

    public void setCommnProtocol(String commnProtocol) {
        this.commnProtocol = commnProtocol;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getFtp_conn_method() {
        return ftp_conn_method;
    }

    public void setFtp_conn_method(String ftp_conn_method) {
        this.ftp_conn_method = ftp_conn_method;
    }

    public String getFtp_directory() {
        return ftp_directory;
    }

    public void setFtp_directory(String ftp_directory) {
        this.ftp_directory = ftp_directory;
    }

    public String getFtp_host() {
        return ftp_host;
    }

    public void setFtp_host(String ftp_host) {
        this.ftp_host = ftp_host;
    }

    public String getFtp_method() {
        return ftp_method;
    }

    public void setFtp_method(String ftp_method) {
        this.ftp_method = ftp_method;
    }

    public String getFtp_port() {
        return ftp_port;
    }

    public void setFtp_port(String ftp_port) {
        this.ftp_port = ftp_port;
    }

    public String getFtp_pwd() {
        return ftp_pwd;
    }

    public void setFtp_pwd(String ftp_pwd) {
        this.ftp_pwd = ftp_pwd;
    }

    public String getFtp_recv_protocol() {
        return ftp_recv_protocol;
    }

    public void setFtp_recv_protocol(String ftp_recv_protocol) {
        this.ftp_recv_protocol = ftp_recv_protocol;
    }

    public int getFtp_resp_time() {
        return ftp_resp_time;
    }

    public void setFtp_resp_time(int ftp_resp_time) {
        this.ftp_resp_time = ftp_resp_time;
    }

    public boolean isFtp_ssl_req() {
        return ftp_ssl_req;
    }

    public void setFtp_ssl_req(boolean ftp_ssl_req) {
        this.ftp_ssl_req = ftp_ssl_req;
    }

    public String getFtp_userId() {
        return ftp_userId;
    }

    public void setFtp_userId(String ftp_userId) {
        this.ftp_userId = ftp_userId;
    }

    public String getFun810GroupIdIB() {
        return fun810GroupIdIB;
    }

    public void setFun810GroupIdIB(String fun810GroupIdIB) {
        this.fun810GroupIdIB = fun810GroupIdIB;
    }

    public String getFun810GroupIdOB() {
        return fun810GroupIdOB;
    }

    public void setFun810GroupIdOB(String fun810GroupIdOB) {
        this.fun810GroupIdOB = fun810GroupIdOB;
    }

    public String getFun850GroupIdIB() {
        return fun850GroupIdIB;
    }

    public void setFun850GroupIdIB(String fun850GroupIdIB) {
        this.fun850GroupIdIB = fun850GroupIdIB;
    }

    public String getFun850GroupIdOB() {
        return fun850GroupIdOB;
    }

    public void setFun850GroupIdOB(String fun850GroupIdOB) {
        this.fun850GroupIdOB = fun850GroupIdOB;
    }

    public String getFun855GroupIdIB() {
        return fun855GroupIdIB;
    }

    public void setFun855GroupIdIB(String fun855GroupIdIB) {
        this.fun855GroupIdIB = fun855GroupIdIB;
    }

    public String getFun855GroupIdOB() {
        return fun855GroupIdOB;
    }

    public void setFun855GroupIdOB(String fun855GroupIdOB) {
        this.fun855GroupIdOB = fun855GroupIdOB;
    }

    public String getFun856GroupIdIB() {
        return fun856GroupIdIB;
    }

    public void setFun856GroupIdIB(String fun856GroupIdIB) {
        this.fun856GroupIdIB = fun856GroupIdIB;
    }

    public String getFun856GroupIdOB() {
        return fun856GroupIdOB;
    }

    public void setFun856GroupIdOB(String fun856GroupIdOB) {
        this.fun856GroupIdOB = fun856GroupIdOB;
    }

    public boolean isGen810AckIB() {
        return gen810AckIB;
    }

    public void setGen810AckIB(boolean gen810AckIB) {
        this.gen810AckIB = gen810AckIB;
    }

    public boolean isGen810AckOB() {
        return gen810AckOB;
    }

    public void setGen810AckOB(boolean gen810AckOB) {
        this.gen810AckOB = gen810AckOB;
    }

    public boolean isGen850AckIB() {
        return gen850AckIB;
    }

    public void setGen850AckIB(boolean gen850AckIB) {
        this.gen850AckIB = gen850AckIB;
    }

    public boolean isGen850AckOB() {
        return gen850AckOB;
    }

    public void setGen850AckOB(boolean gen850AckOB) {
        this.gen850AckOB = gen850AckOB;
    }

    public boolean isGen855AckIB() {
        return gen855AckIB;
    }

    public void setGen855AckIB(boolean gen855AckIB) {
        this.gen855AckIB = gen855AckIB;
    }

    public boolean isGen855AckOB() {
        return gen855AckOB;
    }

    public void setGen855AckOB(boolean gen855AckOB) {
        this.gen855AckOB = gen855AckOB;
    }

    public boolean isGen856AckIB() {
        return gen856AckIB;
    }

    public void setGen856AckIB(boolean gen856AckIB) {
        this.gen856AckIB = gen856AckIB;
    }

    public boolean isGen856AckOB() {
        return gen856AckOB;
    }

    public void setGen856AckOB(boolean gen856AckOB) {
        this.gen856AckOB = gen856AckOB;
    }

    public String getGs810RecIdIB() {
        return gs810RecIdIB;
    }

    public void setGs810RecIdIB(String gs810RecIdIB) {
        this.gs810RecIdIB = gs810RecIdIB;
    }

    public String getGs810RecIdOB() {
        return gs810RecIdOB;
    }

    public void setGs810RecIdOB(String gs810RecIdOB) {
        this.gs810RecIdOB = gs810RecIdOB;
    }

    public String getGs810VersionIB() {
        return gs810VersionIB;
    }

    public void setGs810VersionIB(String gs810VersionIB) {
        this.gs810VersionIB = gs810VersionIB;
    }

    public String getGs810VersionOB() {
        return gs810VersionOB;
    }

    public void setGs810VersionOB(String gs810VersionOB) {
        this.gs810VersionOB = gs810VersionOB;
    }

    public String getGs810senderIdIB() {
        return gs810senderIdIB;
    }

    public void setGs810senderIdIB(String gs810senderIdIB) {
        this.gs810senderIdIB = gs810senderIdIB;
    }

    public String getGs810senderIdOB() {
        return gs810senderIdOB;
    }

    public void setGs810senderIdOB(String gs810senderIdOB) {
        this.gs810senderIdOB = gs810senderIdOB;
    }

    public String getGs850RecIdIB() {
        return gs850RecIdIB;
    }

    public void setGs850RecIdIB(String gs850RecIdIB) {
        this.gs850RecIdIB = gs850RecIdIB;
    }

    public String getGs850RecIdOB() {
        return gs850RecIdOB;
    }

    public void setGs850RecIdOB(String gs850RecIdOB) {
        this.gs850RecIdOB = gs850RecIdOB;
    }

    public String getGs850VersionIB() {
        return gs850VersionIB;
    }

    public void setGs850VersionIB(String gs850VersionIB) {
        this.gs850VersionIB = gs850VersionIB;
    }

    public String getGs850VersionOB() {
        return gs850VersionOB;
    }

    public void setGs850VersionOB(String gs850VersionOB) {
        this.gs850VersionOB = gs850VersionOB;
    }

    public String getGs850senderIdIB() {
        return gs850senderIdIB;
    }

    public void setGs850senderIdIB(String gs850senderIdIB) {
        this.gs850senderIdIB = gs850senderIdIB;
    }

    public String getGs850senderIdOB() {
        return gs850senderIdOB;
    }

    public void setGs850senderIdOB(String gs850senderIdOB) {
        this.gs850senderIdOB = gs850senderIdOB;
    }

    public String getGs855RecIdIB() {
        return gs855RecIdIB;
    }

    public void setGs855RecIdIB(String gs855RecIdIB) {
        this.gs855RecIdIB = gs855RecIdIB;
    }

    public String getGs855RecIdOB() {
        return gs855RecIdOB;
    }

    public void setGs855RecIdOB(String gs855RecIdOB) {
        this.gs855RecIdOB = gs855RecIdOB;
    }

    public String getGs855VersionIB() {
        return gs855VersionIB;
    }

    public void setGs855VersionIB(String gs855VersionIB) {
        this.gs855VersionIB = gs855VersionIB;
    }

    public String getGs855VersionOB() {
        return gs855VersionOB;
    }

    public void setGs855VersionOB(String gs855VersionOB) {
        this.gs855VersionOB = gs855VersionOB;
    }

    public String getGs855senderIdIB() {
        return gs855senderIdIB;
    }

    public void setGs855senderIdIB(String gs855senderIdIB) {
        this.gs855senderIdIB = gs855senderIdIB;
    }

    public String getGs855senderIdOB() {
        return gs855senderIdOB;
    }

    public void setGs855senderIdOB(String gs855senderIdOB) {
        this.gs855senderIdOB = gs855senderIdOB;
    }

    public String getGs856RecIdIB() {
        return gs856RecIdIB;
    }

    public void setGs856RecIdIB(String gs856RecIdIB) {
        this.gs856RecIdIB = gs856RecIdIB;
    }

    public String getGs856RecIdOB() {
        return gs856RecIdOB;
    }

    public void setGs856RecIdOB(String gs856RecIdOB) {
        this.gs856RecIdOB = gs856RecIdOB;
    }

    public String getGs856VersionIB() {
        return gs856VersionIB;
    }

    public void setGs856VersionIB(String gs856VersionIB) {
        this.gs856VersionIB = gs856VersionIB;
    }

    public String getGs856VersionOB() {
        return gs856VersionOB;
    }

    public void setGs856VersionOB(String gs856VersionOB) {
        this.gs856VersionOB = gs856VersionOB;
    }

    public String getGs856senderIdIB() {
        return gs856senderIdIB;
    }

    public void setGs856senderIdIB(String gs856senderIdIB) {
        this.gs856senderIdIB = gs856senderIdIB;
    }

    public String getGs856senderIdOB() {
        return gs856senderIdOB;
    }

    public void setGs856senderIdOB(String gs856senderIdOB) {
        this.gs856senderIdOB = gs856senderIdOB;
    }

    public String getHttp_endpoint() {
        return http_endpoint;
    }

    public void setHttp_endpoint(String http_endpoint) {
        this.http_endpoint = http_endpoint;
    }

    public int getHttp_port() {
        return http_port;
    }

    public void setHttp_port(int http_port) {
        this.http_port = http_port;
    }

    public String getHttp_protocol_mode() {
        return http_protocol_mode;
    }

    public void setHttp_protocol_mode(String http_protocol_mode) {
        this.http_protocol_mode = http_protocol_mode;
    }

    public String getHttp_recv_protocol() {
        return http_recv_protocol;
    }

    public void setHttp_recv_protocol(String http_recv_protocol) {
        this.http_recv_protocol = http_recv_protocol;
    }

    public int getHttp_resp_time() {
        return http_resp_time;
    }

    public void setHttp_resp_time(int http_resp_time) {
        this.http_resp_time = http_resp_time;
    }

    public String getHttp_ssl_req() {
        return http_ssl_req;
    }

    public void setHttp_ssl_req(String http_ssl_req) {
        this.http_ssl_req = http_ssl_req;
    }

    public boolean isIb810() {
        return ib810;
    }

    public void setIb810(boolean ib810) {
        this.ib810 = ib810;
    }

    public boolean isIb850() {
        return ib850;
    }

    public void setIb850(boolean ib850) {
        this.ib850 = ib850;
    }

    public boolean isIb855() {
        return ib855;
    }

    public void setIb855(boolean ib855) {
        this.ib855 = ib855;
    }

    public boolean isIb856() {
        return ib856;
    }

    public void setIb856(boolean ib856) {
        this.ib856 = ib856;
    }

    public String getIsa810RecIdIB() {
        return isa810RecIdIB;
    }

    public void setIsa810RecIdIB(String isa810RecIdIB) {
        this.isa810RecIdIB = isa810RecIdIB;
    }

    public String getIsa810RecIdOB() {
        return isa810RecIdOB;
    }

    public void setIsa810RecIdOB(String isa810RecIdOB) {
        this.isa810RecIdOB = isa810RecIdOB;
    }

    public String getIsa810VersionIB() {
        return isa810VersionIB;
    }

    public void setIsa810VersionIB(String isa810VersionIB) {
        this.isa810VersionIB = isa810VersionIB;
    }

    public String getIsa810VersionOB() {
        return isa810VersionOB;
    }

    public void setIsa810VersionOB(String isa810VersionOB) {
        this.isa810VersionOB = isa810VersionOB;
    }

    public String getIsa810senderIdIB() {
        return isa810senderIdIB;
    }

    public void setIsa810senderIdIB(String isa810senderIdIB) {
        this.isa810senderIdIB = isa810senderIdIB;
    }

    public String getIsa810senderIdOB() {
        return isa810senderIdOB;
    }

    public void setIsa810senderIdOB(String isa810senderIdOB) {
        this.isa810senderIdOB = isa810senderIdOB;
    }

    public String getIsa850RecIdIB() {
        return isa850RecIdIB;
    }

    public void setIsa850RecIdIB(String isa850RecIdIB) {
        this.isa850RecIdIB = isa850RecIdIB;
    }

    public String getIsa850RecIdOB() {
        return isa850RecIdOB;
    }

    public void setIsa850RecIdOB(String isa850RecIdOB) {
        this.isa850RecIdOB = isa850RecIdOB;
    }

    public String getIsa850VersionIB() {
        return isa850VersionIB;
    }

    public void setIsa850VersionIB(String isa850VersionIB) {
        this.isa850VersionIB = isa850VersionIB;
    }

    public String getIsa850VersionOB() {
        return isa850VersionOB;
    }

    public void setIsa850VersionOB(String isa850VersionOB) {
        this.isa850VersionOB = isa850VersionOB;
    }

    public String getIsa850senderIdIB() {
        return isa850senderIdIB;
    }

    public void setIsa850senderIdIB(String isa850senderIdIB) {
        this.isa850senderIdIB = isa850senderIdIB;
    }

    public String getIsa850senderIdOB() {
        return isa850senderIdOB;
    }

    public void setIsa850senderIdOB(String isa850senderIdOB) {
        this.isa850senderIdOB = isa850senderIdOB;
    }

    public String getIsa855RecIdIB() {
        return isa855RecIdIB;
    }

    public void setIsa855RecIdIB(String isa855RecIdIB) {
        this.isa855RecIdIB = isa855RecIdIB;
    }

    public String getIsa855RecIdOB() {
        return isa855RecIdOB;
    }

    public void setIsa855RecIdOB(String isa855RecIdOB) {
        this.isa855RecIdOB = isa855RecIdOB;
    }

    public String getIsa855VersionIB() {
        return isa855VersionIB;
    }

    public void setIsa855VersionIB(String isa855VersionIB) {
        this.isa855VersionIB = isa855VersionIB;
    }

    public String getIsa855VersionOB() {
        return isa855VersionOB;
    }

    public void setIsa855VersionOB(String isa855VersionOB) {
        this.isa855VersionOB = isa855VersionOB;
    }

    public String getIsa855senderIdIB() {
        return isa855senderIdIB;
    }

    public void setIsa855senderIdIB(String isa855senderIdIB) {
        this.isa855senderIdIB = isa855senderIdIB;
    }

    public String getIsa855senderIdOB() {
        return isa855senderIdOB;
    }

    public void setIsa855senderIdOB(String isa855senderIdOB) {
        this.isa855senderIdOB = isa855senderIdOB;
    }

    public String getIsa856RecIdIB() {
        return isa856RecIdIB;
    }

    public void setIsa856RecIdIB(String isa856RecIdIB) {
        this.isa856RecIdIB = isa856RecIdIB;
    }

    public String getIsa856RecIdOB() {
        return isa856RecIdOB;
    }

    public void setIsa856RecIdOB(String isa856RecIdOB) {
        this.isa856RecIdOB = isa856RecIdOB;
    }

    public String getIsa856VersionIB() {
        return isa856VersionIB;
    }

    public void setIsa856VersionIB(String isa856VersionIB) {
        this.isa856VersionIB = isa856VersionIB;
    }

    public String getIsa856VersionOB() {
        return isa856VersionOB;
    }

    public void setIsa856VersionOB(String isa856VersionOB) {
        this.isa856VersionOB = isa856VersionOB;
    }

    public String getIsa856senderIdIB() {
        return isa856senderIdIB;
    }

    public void setIsa856senderIdIB(String isa856senderIdIB) {
        this.isa856senderIdIB = isa856senderIdIB;
    }

    public String getIsa856senderIdOB() {
        return isa856senderIdOB;
    }

    public void setIsa856senderIdOB(String isa856senderIdOB) {
        this.isa856senderIdOB = isa856senderIdOB;
    }

    public Timestamp getLastLoginTS() {
        return lastLoginTS;
    }

    public void setLastLoginTS(Timestamp lastLoginTS) {
        this.lastLoginTS = lastLoginTS;
    }

    public Timestamp getLastLogoutTS() {
        return lastLogoutTS;
    }

    public void setLastLogoutTS(Timestamp lastLogoutTS) {
        this.lastLogoutTS = lastLogoutTS;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public boolean isOb810() {
        return ob810;
    }

    public void setOb810(boolean ob810) {
        this.ob810 = ob810;
    }

    public boolean isOb850() {
        return ob850;
    }

    public void setOb850(boolean ob850) {
        this.ob850 = ob850;
    }

    public boolean isOb855() {
        return ob855;
    }

    public void setOb855(boolean ob855) {
        this.ob855 = ob855;
    }

    public boolean isOb856() {
        return ob856;
    }

    public void setOb856(boolean ob856) {
        this.ob856 = ob856;
    }

    public String getPartnerName() {
        return partnerName;
    }

    public void setPartnerName(String partnerName) {
        this.partnerName = partnerName;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getRes810AgecodeIB() {
        return res810AgecodeIB;
    }

    public void setRes810AgecodeIB(String res810AgecodeIB) {
        this.res810AgecodeIB = res810AgecodeIB;
    }

    public String getRes810AgecodeOB() {
        return res810AgecodeOB;
    }

    public void setRes810AgecodeOB(String res810AgecodeOB) {
        this.res810AgecodeOB = res810AgecodeOB;
    }

    public String getRes850AgecodeIB() {
        return res850AgecodeIB;
    }

    public void setRes850AgecodeIB(String res850AgecodeIB) {
        this.res850AgecodeIB = res850AgecodeIB;
    }

    public String getRes850AgecodeOB() {
        return res850AgecodeOB;
    }

    public void setRes850AgecodeOB(String res850AgecodeOB) {
        this.res850AgecodeOB = res850AgecodeOB;
    }

    public String getRes855AgecodeIB() {
        return res855AgecodeIB;
    }

    public void setRes855AgecodeIB(String res855AgecodeIB) {
        this.res855AgecodeIB = res855AgecodeIB;
    }

    public String getRes855AgecodeOB() {
        return res855AgecodeOB;
    }

    public void setRes855AgecodeOB(String res855AgecodeOB) {
        this.res855AgecodeOB = res855AgecodeOB;
    }

    public String getRes856AgecodeIB() {
        return res856AgecodeIB;
    }

    public void setRes856AgecodeIB(String res856AgecodeIB) {
        this.res856AgecodeIB = res856AgecodeIB;
    }

    public String getRes856AgecodeOB() {
        return res856AgecodeOB;
    }

    public void setRes856AgecodeOB(String res856AgecodeOB) {
        this.res856AgecodeOB = res856AgecodeOB;
    }

    public String getSftp_auth_method() {
        return sftp_auth_method;
    }

    public void setSftp_auth_method(String sftp_auth_method) {
        this.sftp_auth_method = sftp_auth_method;
    }

    public String getSftp_conn_method() {
        return sftp_conn_method;
    }

    public void setSftp_conn_method(String sftp_conn_method) {
        this.sftp_conn_method = sftp_conn_method;
    }

    public String getSftp_directory() {
        return sftp_directory;
    }

    public void setSftp_directory(String sftp_directory) {
        this.sftp_directory = sftp_directory;
    }

    public String getSftp_host_ip() {
        return sftp_host_ip;
    }

    public void setSftp_host_ip(String sftp_host_ip) {
        this.sftp_host_ip = sftp_host_ip;
    }

    public String getSftp_method() {
        return sftp_method;
    }

    public void setSftp_method(String sftp_method) {
        this.sftp_method = sftp_method;
    }

    public String getSftp_public_key() {
        return sftp_public_key;
    }

    public void setSftp_public_key(String sftp_public_key) {
        this.sftp_public_key = sftp_public_key;
    }

    public String getSftp_remote_port() {
        return sftp_remote_port;
    }

    public void setSftp_remote_port(String sftp_remote_port) {
        this.sftp_remote_port = sftp_remote_port;
    }

    public String getSftp_remote_pwd() {
        return sftp_remote_pwd;
    }

    public void setSftp_remote_pwd(String sftp_remote_pwd) {
        this.sftp_remote_pwd = sftp_remote_pwd;
    }

    public String getSftp_remote_userId() {
        return sftp_remote_userId;
    }

    public void setSftp_remote_userId(String sftp_remote_userId) {
        this.sftp_remote_userId = sftp_remote_userId;
    }

    public String getSftp_upload_public_key() {
        return sftp_upload_public_key;
    }

    public void setSftp_upload_public_key(String sftp_upload_public_key) {
        this.sftp_upload_public_key = sftp_upload_public_key;
    }

    public String getSmtp_from_email() {
        return smtp_from_email;
    }

    public void setSmtp_from_email(String smtp_from_email) {
        this.smtp_from_email = smtp_from_email;
    }

    public String getSmtp_recv_protocol() {
        return smtp_recv_protocol;
    }

    public void setSmtp_recv_protocol(String smtp_recv_protocol) {
        this.smtp_recv_protocol = smtp_recv_protocol;
    }

    public int getSmtp_server_port() {
        return smtp_server_port;
    }

    public void setSmtp_server_port(int smtp_server_port) {
        this.smtp_server_port = smtp_server_port;
    }

    public String getSmtp_server_protocol() {
        return smtp_server_protocol;
    }

    public void setSmtp_server_protocol(String smtp_server_protocol) {
        this.smtp_server_protocol = smtp_server_protocol;
    }

    public String getSmtp_to_email() {
        return smtp_to_email;
    }

    public void setSmtp_to_email(String smtp_to_email) {
        this.smtp_to_email = smtp_to_email;
    }

    public String getSt810RecIdIB() {
        return st810RecIdIB;
    }

    public void setSt810RecIdIB(String st810RecIdIB) {
        this.st810RecIdIB = st810RecIdIB;
    }

    public String getSt810RecIdOB() {
        return st810RecIdOB;
    }

    public void setSt810RecIdOB(String st810RecIdOB) {
        this.st810RecIdOB = st810RecIdOB;
    }

    public String getSt810VersionIB() {
        return st810VersionIB;
    }

    public void setSt810VersionIB(String st810VersionIB) {
        this.st810VersionIB = st810VersionIB;
    }

    public String getSt810VersionOB() {
        return st810VersionOB;
    }

    public void setSt810VersionOB(String st810VersionOB) {
        this.st810VersionOB = st810VersionOB;
    }

    public String getSt810senderIdIB() {
        return st810senderIdIB;
    }

    public void setSt810senderIdIB(String st810senderIdIB) {
        this.st810senderIdIB = st810senderIdIB;
    }

    public String getSt810senderIdOB() {
        return st810senderIdOB;
    }

    public void setSt810senderIdOB(String st810senderIdOB) {
        this.st810senderIdOB = st810senderIdOB;
    }

    public String getSt850RecIdIB() {
        return st850RecIdIB;
    }

    public void setSt850RecIdIB(String st850RecIdIB) {
        this.st850RecIdIB = st850RecIdIB;
    }

    public String getSt850RecIdOB() {
        return st850RecIdOB;
    }

    public void setSt850RecIdOB(String st850RecIdOB) {
        this.st850RecIdOB = st850RecIdOB;
    }

    public String getSt850VersionIB() {
        return st850VersionIB;
    }

    public void setSt850VersionIB(String st850VersionIB) {
        this.st850VersionIB = st850VersionIB;
    }

    public String getSt850VersionOB() {
        return st850VersionOB;
    }

    public void setSt850VersionOB(String st850VersionOB) {
        this.st850VersionOB = st850VersionOB;
    }

    public String getSt850senderIdIB() {
        return st850senderIdIB;
    }

    public void setSt850senderIdIB(String st850senderIdIB) {
        this.st850senderIdIB = st850senderIdIB;
    }

    public String getSt850senderIdOB() {
        return st850senderIdOB;
    }

    public void setSt850senderIdOB(String st850senderIdOB) {
        this.st850senderIdOB = st850senderIdOB;
    }

    public String getSt855RecIdIB() {
        return st855RecIdIB;
    }

    public void setSt855RecIdIB(String st855RecIdIB) {
        this.st855RecIdIB = st855RecIdIB;
    }

    public String getSt855RecIdOB() {
        return st855RecIdOB;
    }

    public void setSt855RecIdOB(String st855RecIdOB) {
        this.st855RecIdOB = st855RecIdOB;
    }

    public String getSt855VersionIB() {
        return st855VersionIB;
    }

    public void setSt855VersionIB(String st855VersionIB) {
        this.st855VersionIB = st855VersionIB;
    }

    public String getSt855VersionOB() {
        return st855VersionOB;
    }

    public void setSt855VersionOB(String st855VersionOB) {
        this.st855VersionOB = st855VersionOB;
    }

    public String getSt855senderIdIB() {
        return st855senderIdIB;
    }

    public void setSt855senderIdIB(String st855senderIdIB) {
        this.st855senderIdIB = st855senderIdIB;
    }

    public String getSt855senderIdOB() {
        return st855senderIdOB;
    }

    public void setSt855senderIdOB(String st855senderIdOB) {
        this.st855senderIdOB = st855senderIdOB;
    }

    public String getSt856RecIdIB() {
        return st856RecIdIB;
    }

    public void setSt856RecIdIB(String st856RecIdIB) {
        this.st856RecIdIB = st856RecIdIB;
    }

    public String getSt856RecIdOB() {
        return st856RecIdOB;
    }

    public void setSt856RecIdOB(String st856RecIdOB) {
        this.st856RecIdOB = st856RecIdOB;
    }

    public String getSt856VersionIB() {
        return st856VersionIB;
    }

    public void setSt856VersionIB(String st856VersionIB) {
        this.st856VersionIB = st856VersionIB;
    }

    public String getSt856VersionOB() {
        return st856VersionOB;
    }

    public void setSt856VersionOB(String st856VersionOB) {
        this.st856VersionOB = st856VersionOB;
    }

    public String getSt856senderIdIB() {
        return st856senderIdIB;
    }

    public void setSt856senderIdIB(String st856senderIdIB) {
        this.st856senderIdIB = st856senderIdIB;
    }

    public String getSt856senderIdOB() {
        return st856senderIdOB;
    }

    public void setSt856senderIdOB(String st856senderIdOB) {
        this.st856senderIdOB = st856senderIdOB;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getTrans810IdcodeIB() {
        return trans810IdcodeIB;
    }

    public void setTrans810IdcodeIB(String trans810IdcodeIB) {
        this.trans810IdcodeIB = trans810IdcodeIB;
    }

    public String getTrans810IdcodeOB() {
        return trans810IdcodeOB;
    }

    public void setTrans810IdcodeOB(String trans810IdcodeOB) {
        this.trans810IdcodeOB = trans810IdcodeOB;
    }

    public String getTrans850IdcodeIB() {
        return trans850IdcodeIB;
    }

    public void setTrans850IdcodeIB(String trans850IdcodeIB) {
        this.trans850IdcodeIB = trans850IdcodeIB;
    }

    public String getTrans850IdcodeOB() {
        return trans850IdcodeOB;
    }

    public void setTrans850IdcodeOB(String trans850IdcodeOB) {
        this.trans850IdcodeOB = trans850IdcodeOB;
    }

    public String getTrans855IdcodeIB() {
        return trans855IdcodeIB;
    }

    public void setTrans855IdcodeIB(String trans855IdcodeIB) {
        this.trans855IdcodeIB = trans855IdcodeIB;
    }

    public String getTrans855IdcodeOB() {
        return trans855IdcodeOB;
    }

    public void setTrans855IdcodeOB(String trans855IdcodeOB) {
        this.trans855IdcodeOB = trans855IdcodeOB;
    }

    public String getTrans856IdcodeIB() {
        return trans856IdcodeIB;
    }

    public void setTrans856IdcodeIB(String trans856IdcodeIB) {
        this.trans856IdcodeIB = trans856IdcodeIB;
    }

    public String getTrans856IdcodeOB() {
        return trans856IdcodeOB;
    }

    public void setTrans856IdcodeOB(String trans856IdcodeOB) {
        this.trans856IdcodeOB = trans856IdcodeOB;
    }

    public String getTransferMode() {
        return transferMode;
    }

    public void setTransferMode(String transferMode) {
        this.transferMode = transferMode;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getIbdirection() {
        return ibdirection;
    }

    public void setIbdirection(String ibdirection) {
        this.ibdirection = ibdirection;
    }

    public String getIbdirection810() {
        return ibdirection810;
    }

    public void setIbdirection810(String ibdirection810) {
        this.ibdirection810 = ibdirection810;
    }

    public String getIbdirection855() {
        return ibdirection855;
    }

    public void setIbdirection855(String ibdirection855) {
        this.ibdirection855 = ibdirection855;
    }

    public String getIbdirection856() {
        return ibdirection856;
    }

    public void setIbdirection856(String ibdirection856) {
        this.ibdirection856 = ibdirection856;
    }

    public String getIbvalue810() {
        return ibvalue810;
    }

    public void setIbvalue810(String ibvalue810) {
        this.ibvalue810 = ibvalue810;
    }

    public String getIbvalue850() {
        return ibvalue850;
    }

    public void setIbvalue850(String ibvalue850) {
        this.ibvalue850 = ibvalue850;
    }

    public String getIbvalue855() {
        return ibvalue855;
    }

    public void setIbvalue855(String ibvalue855) {
        this.ibvalue855 = ibvalue855;
    }

    public String getIbvalue856() {
        return ibvalue856;
    }

    public void setIbvalue856(String ibvalue856) {
        this.ibvalue856 = ibvalue856;
    }

    public String getObdirection() {
        return obdirection;
    }

    public void setObdirection(String obdirection) {
        this.obdirection = obdirection;
    }

    public String getObdirection810() {
        return obdirection810;
    }

    public void setObdirection810(String obdirection810) {
        this.obdirection810 = obdirection810;
    }

    public String getObdirection855() {
        return obdirection855;
    }

    public void setObdirection855(String obdirection855) {
        this.obdirection855 = obdirection855;
    }

    public String getObdirection856() {
        return obdirection856;
    }

    public void setObdirection856(String obdirection856) {
        this.obdirection856 = obdirection856;
    }

    public String getObvalue810() {
        return obvalue810;
    }

    public void setObvalue810(String obvalue810) {
        this.obvalue810 = obvalue810;
    }

    public String getObvalue850() {
        return obvalue850;
    }

    public void setObvalue850(String obvalue850) {
        this.obvalue850 = obvalue850;
    }

    public String getObvalue855() {
        return obvalue855;
    }

    public void setObvalue855(String obvalue855) {
        this.obvalue855 = obvalue855;
    }

    public String getObvalue856() {
        return obvalue856;
    }

    public void setObvalue856(String obvalue856) {
        this.obvalue856 = obvalue856;
    }

    public String getHttp_url() {
        return http_url;
    }

    public void setHttp_url(String http_url) {
        this.http_url = http_url;
    }

    public String getCreayed_by() {
        return creayed_by;
    }

    public void setCreayed_by(String creayed_by) {
        this.creayed_by = creayed_by;
    }

    public Timestamp getCreayed_ts() {
        return creayed_ts;
    }

    public void setCreayed_ts(Timestamp creayed_ts) {
        this.creayed_ts = creayed_ts;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    
    
}