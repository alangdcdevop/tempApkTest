package packages.models.accessToken;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class AccessTokenJWT {

    private String jti;
    private Integer exp;
    private Integer nbf;
    private Integer iat;
    private String iss;
    private String sub;
    private String typ;
    private String azp;
    private Integer auth_time;
    private String session_state;
    private String coreClientId;
    private String name;
    private String preferred_username;
    private String given_name;
    private String idNumber;
    private String userId;
    private String family_name;
    private String deviceId;
    private String email;

    @JsonCreator
    public AccessTokenJWT(@JsonProperty("jti") String jti,
                          @JsonProperty("exp") Integer exp,
                          @JsonProperty("nbf") Integer nbf,
                          @JsonProperty("iat") Integer iat,
                          @JsonProperty("iss") String iss,
                          @JsonProperty("sub") String sub,
                          @JsonProperty("typ") String typ,
                          @JsonProperty("azp") String azp,
                          @JsonProperty("auth_time") Integer auth_time,
                          @JsonProperty("session_state") String session_state,
                          @JsonProperty("coreClientId") String coreClientId,
                          @JsonProperty("name") String name,
                          @JsonProperty("preferred_username") String preferred_username,
                          @JsonProperty("given_name") String given_name,
                          @JsonProperty("idNumber") String idNumber,
                          @JsonProperty("userId") String userId,
                          @JsonProperty("family_name") String family_name,
                          @JsonProperty("deviceId") String deviceId,
                          @JsonProperty("email") String email) {
        this.jti = jti;
        this.exp = exp;
        this.nbf = nbf;
        this.iat = iat;
        this.iss = iss;
        this.sub = sub;
        this.typ = typ;
        this.azp = azp;
        this.auth_time = auth_time;
        this.session_state = session_state;
        this.coreClientId = coreClientId;
        this.name = name;
        this.preferred_username = preferred_username;
        this.given_name = given_name;
        this.idNumber = idNumber;
        this.userId = userId;
        this.family_name = family_name;
        this.deviceId = deviceId;
        this.email = email;
    }

    public String getJti() {
        return jti;
    }

    public void setJti(String jti) {
        this.jti = jti;
    }

    public Integer getExp() {
        return exp;
    }

    public void setExp(Integer exp) {
        this.exp = exp;
    }

    public Integer getNbf() {
        return nbf;
    }

    public void setNbf(Integer nbf) {
        this.nbf = nbf;
    }

    public Integer getIat() {
        return iat;
    }

    public void setIat(Integer iat) {
        this.iat = iat;
    }

    public String getIss() {
        return iss;
    }

    public void setIss(String iss) {
        this.iss = iss;
    }

    public String getSub() {
        return sub;
    }

    public void setSub(String sub) {
        this.sub = sub;
    }

    public String getTyp() {
        return typ;
    }

    public void setTyp(String typ) {
        this.typ = typ;
    }

    public String getAzp() {
        return azp;
    }

    public void setAzp(String azp) {
        this.azp = azp;
    }

    public Integer getAuth_time() {
        return auth_time;
    }

    public void setAuth_time(Integer auth_time) {
        this.auth_time = auth_time;
    }

    public String getSession_state() {
        return session_state;
    }

    public void setSession_state(String session_state) {
        this.session_state = session_state;
    }

    public String getCoreClientId() {
        return coreClientId;
    }

    public void setCoreClientId(String coreClientId) {
        this.coreClientId = coreClientId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPreferred_username() {
        return preferred_username;
    }

    public void setPreferred_username(String preferred_username) {
        this.preferred_username = preferred_username;
    }

    public String getGiven_name() {
        return given_name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFamily_name() {
        return family_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
