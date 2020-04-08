package packages.models.merlin;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class TaxDataValidation {
    private String status;
    private String statusReason;
    private String remainingCredits;
    private String transactionId;
    private NCUIT ncuit;

    @JsonCreator
    public TaxDataValidation(@JsonProperty("status") String status,
                             @JsonProperty("statusReason") String statusReason,
                             @JsonProperty("remainingCredits") String remainingCredits,
                             @JsonProperty("transactionId") String transactionId,
                             @JsonProperty("nCuit") NCUIT ncuit) {
        this.status = status;
        this.statusReason = statusReason;
        this.remainingCredits = remainingCredits;
        this.transactionId = transactionId;
        this.ncuit = ncuit;
    }

    public TaxDataValidation() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatusReason() {
        return statusReason;
    }

    public void setStatusReason(String statusReason) {
        this.statusReason = statusReason;
    }

    public String getRemainingCredits() {
        return remainingCredits;
    }

    public void setRemainingCredits(String remainingCredits) {
        this.remainingCredits = remainingCredits;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public NCUIT getNcuit() {
        return ncuit;
    }

    public void setNcuit(NCUIT ncuit) {
        this.ncuit = ncuit;
    }
}
