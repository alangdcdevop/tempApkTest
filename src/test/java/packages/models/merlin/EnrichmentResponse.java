package packages.models.merlin;

public class EnrichmentResponse {

    private String status;
    private String statusReason;
    private String remainingCredits;
    private String transactionId;
    private NPersonEnrichment nPersonEnrichment;

    public EnrichmentResponse(String status, String statusReason, String remainingCredits, String transactionId, NPersonEnrichment nPersonEnrichment) {
        this.status = status;
        this.statusReason = statusReason;
        this.remainingCredits = remainingCredits;
        this.transactionId = transactionId;
        this.nPersonEnrichment = nPersonEnrichment;
    }

    public EnrichmentResponse() {
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

    public NPersonEnrichment getnPersonEnrichment() {
        return nPersonEnrichment;
    }

    public void setnPersonEnrichment(NPersonEnrichment nPersonEnrichment) {
        this.nPersonEnrichment = nPersonEnrichment;
    }
}
