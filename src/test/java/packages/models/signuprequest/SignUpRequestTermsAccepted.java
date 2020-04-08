package packages.models.signuprequest;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class SignUpRequestTermsAccepted {
    private String termsVersion;
    private String acceptanceDate;

    public SignUpRequestTermsAccepted() {
    }

    @JsonCreator
    public SignUpRequestTermsAccepted(@JsonProperty String termsVersion,
                                      @JsonProperty String acceptanceDate) {
        this.termsVersion = termsVersion;
        this.acceptanceDate = acceptanceDate;
    }

    public String getTermsVersion() {
        return termsVersion;
    }

    public void setTermsVersion(String termsVersion) {
        this.termsVersion = termsVersion;
    }

    public String getAcceptanceDate() {
        return acceptanceDate;
    }

    public void setAcceptanceDate(String acceptanceDate) {
        this.acceptanceDate = acceptanceDate;
    }
}
