package packages.models.merlin;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class NCUIT {

    private String cuit;
    private String denomination;
    private String denominationFlg;
    private String aernings;
    private String iva;
    private String uniqueTribute;
    private String uniqueTributeActivity;
    private String employer;
    private String memberOfSociety;
    private Object merlinCustomValues;


    @JsonCreator
    public NCUIT(@JsonProperty("cuit") String cuit,
                 @JsonProperty("denomination") String denomination,
                 @JsonProperty("denominationFlg") String denominationFlg,
                 @JsonProperty("aernings") String aernings,
                 @JsonProperty("iva") String iva,
                 @JsonProperty("uniqueTribute") String uniqueTribute,
                 @JsonProperty("uniqueTributeActivity") String uniqueTributeActivity,
                 @JsonProperty("employer") String employer,
                 @JsonProperty("memberOfSociety") String memberOfSociety,
                 @JsonProperty("merlinCustomValues") Object merlinCustomValues) {
        this.cuit = cuit;
        this.denomination = denomination;
        this.denominationFlg = denominationFlg;
        this.aernings = aernings;
        this.iva = iva;
        this.uniqueTribute = uniqueTribute;
        this.uniqueTributeActivity = uniqueTributeActivity;
        this.employer = employer;
        this.memberOfSociety = memberOfSociety;
        this.merlinCustomValues = merlinCustomValues;
    }

    public NCUIT() {
    }

    public String getCuit() {
        return cuit;
    }

    public void setCuit(String cuit) {
        this.cuit = cuit;
    }

    public String getDenomination() {
        return denomination;
    }

    public void setDenomination(String denomination) {
        this.denomination = denomination;
    }

    public String getDenominationFlg() {
        return denominationFlg;
    }

    public void setDenominationFlg(String denominationFlg) {
        this.denominationFlg = denominationFlg;
    }

    public String getAernings() {
        return aernings;
    }

    public void setAernings(String aernings) {
        this.aernings = aernings;
    }

    public String getIva() {
        return iva;
    }

    public void setIva(String iva) {
        this.iva = iva;
    }

    public String getUniqueTribute() {
        return uniqueTribute;
    }

    public void setUniqueTribute(String uniqueTribute) {
        this.uniqueTribute = uniqueTribute;
    }

    public String getUniqueTributeActivity() {
        return uniqueTributeActivity;
    }

    public void setUniqueTributeActivity(String uniqueTributeActivity) {
        this.uniqueTributeActivity = uniqueTributeActivity;
    }

    public String getEmployer() {
        return employer;
    }

    public void setEmployer(String employer) {
        this.employer = employer;
    }

    public String getMemberOfSociety() {
        return memberOfSociety;
    }

    public void setMemberOfSociety(String memberOfSociety) {
        this.memberOfSociety = memberOfSociety;
    }

    public Object getMerlinCustomValues() {
        return merlinCustomValues;
    }

    public void setMerlinCustomValues(Object merlinCustomValues) {
        this.merlinCustomValues = merlinCustomValues;
    }
}
