package packages.models.signuprequest;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class SignUpRequestObligatedSubject {
    private String occupation;

    @JsonCreator
    public SignUpRequestObligatedSubject(@JsonProperty String occupation) {
        this.occupation = occupation;
    }

    public SignUpRequestObligatedSubject() {
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }
}
