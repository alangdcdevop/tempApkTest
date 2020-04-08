package packages.models.signuprequest;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class SignUpRequest {

    private String state;
    private String deviceId;
    private String appBundleId;
    private SignUpRequestContactInfo contactInfo;
    private String faceUrl;
    private String gestureUrl;
    private String idFrontUrl;
    private String idBackUrl;
    private SignUpRequestAddress address;
    private SignUpRequestTermsAccepted termsAccepted;
    private String faceIdData;
    private SignUpRequestObligatedSubject obligatedSubject;
    private SignUpRequestPep pep;
    private Boolean fatca;
    private String email;
    private String keycloakId;
    private String coreClientId;

    @JsonCreator
    public SignUpRequest(@JsonProperty String state,
                         @JsonProperty String deviceId,
                         @JsonProperty String appBundleId,
                         @JsonProperty SignUpRequestContactInfo contactInfo,
                         @JsonProperty String faceUrl,
                         @JsonProperty String gestureUrl,
                         @JsonProperty String idFrontUrl,
                         @JsonProperty String idBackUrl,
                         @JsonProperty SignUpRequestAddress address,
                         @JsonProperty SignUpRequestTermsAccepted termsAccepted,
                         @JsonProperty String faceIdData,
                         @JsonProperty SignUpRequestObligatedSubject obligatedSubject,
                         @JsonProperty SignUpRequestPep pep,
                         @JsonProperty Boolean fatca,
                         @JsonProperty String email,
                         @JsonProperty String keycloakId,
                         @JsonProperty String coreClientId) {
        this.state = state;
        this.deviceId = deviceId;
        this.appBundleId = appBundleId;
        this.contactInfo = contactInfo;
        this.faceUrl = faceUrl;
        this.gestureUrl = gestureUrl;
        this.idFrontUrl = idFrontUrl;
        this.idBackUrl = idBackUrl;
        this.address = address;
        this.termsAccepted = termsAccepted;
        this.faceIdData = faceIdData;
        this.obligatedSubject = obligatedSubject;
        this.pep = pep;
        this.fatca = fatca;
        this.email = email;
        this.keycloakId = keycloakId;
        this.coreClientId = coreClientId;
    }

    public SignUpRequest() {
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    public String getAppBundleId() {
        return appBundleId;
    }

    public void setAppBundleId(String appBundleId) {
        this.appBundleId = appBundleId;
    }

    public SignUpRequestContactInfo getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(SignUpRequestContactInfo contactInfo) {
        this.contactInfo = contactInfo;
    }

    public String getFaceUrl() {
        return faceUrl;
    }

    public void setFaceUrl(String faceUrl) {
        this.faceUrl = faceUrl;
    }

    public String getGestureUrl() {
        return gestureUrl;
    }

    public void setGestureUrl(String gestureUrl) {
        this.gestureUrl = gestureUrl;
    }

    public String getIdFrontUrl() {
        return idFrontUrl;
    }

    public void setIdFrontUrl(String idFrontUrl) {
        this.idFrontUrl = idFrontUrl;
    }

    public String getIdBackUrl() {
        return idBackUrl;
    }

    public void setIdBackUrl(String idBackUrl) {
        this.idBackUrl = idBackUrl;
    }

    public SignUpRequestAddress getAddress() {
        return address;
    }

    public void setAddress(SignUpRequestAddress address) {
        this.address = address;
    }

    public SignUpRequestTermsAccepted getTermsAccepted() {
        return termsAccepted;
    }

    public void setTermsAccepted(SignUpRequestTermsAccepted termsAccepted) {
        this.termsAccepted = termsAccepted;
    }

    public String getFaceIdData() {
        return faceIdData;
    }

    public void setFaceIdData(String faceIdData) {
        this.faceIdData = faceIdData;
    }

    public SignUpRequestObligatedSubject getObligatedSubject() {
        return obligatedSubject;
    }

    public void setObligatedSubject(SignUpRequestObligatedSubject obligatedSubject) {
        this.obligatedSubject = obligatedSubject;
    }

    public SignUpRequestPep getPep() {
        return pep;
    }

    public void setPep(SignUpRequestPep pep) {
        this.pep = pep;
    }

    public Boolean getFatca() {
        return fatca;
    }

    public void setFatca(Boolean fatca) {
        this.fatca = fatca;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getKeycloakId() {
        return keycloakId;
    }

    public void setKeycloakId(String keycloakId) {
        this.keycloakId = keycloakId;
    }

    public String getCoreClientId() {
        return coreClientId;
    }

    public void setCoreClientId(String coreClientId) {
        this.coreClientId = coreClientId;
    }
}
