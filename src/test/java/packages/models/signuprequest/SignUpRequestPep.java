package packages.models.signuprequest;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class SignUpRequestPep {
    private String relation;
    private String relationType;
    private String charge;

    @JsonCreator
    public SignUpRequestPep(@JsonProperty String relation, @JsonProperty String relationType, @JsonProperty String charge) {
        this.relation = relation;
        this.relationType = relationType;
        this.charge = charge;
    }

    public SignUpRequestPep() {
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getRelationType() {
        return relationType;
    }

    public void setRelationType(String relationType) {
        this.relationType = relationType;
    }

    public String getCharge() {
        return charge;
    }

    public void setCharge(String charge) {
        this.charge = charge;
    }
}
