package packages.models.merlin;

public class NPersonEnrichment {

    private DataRows dataRows;
    private Object merlinCustomValues;
    private Object clientCustomValues;

    public NPersonEnrichment(DataRows dataRows, Object merlinCustomValues, Object clientCustomValues) {
        this.dataRows = dataRows;
        this.merlinCustomValues = merlinCustomValues;
        this.clientCustomValues = clientCustomValues;
    }

    public NPersonEnrichment() {
    }

    public DataRows getDataRows() {
        return dataRows;
    }

    public void setDataRows(DataRows dataRows) {
        this.dataRows = dataRows;
    }

    public Object getMerlinCustomValues() {
        return merlinCustomValues;
    }

    public void setMerlinCustomValues(Object merlinCustomValues) {
        this.merlinCustomValues = merlinCustomValues;
    }

    public Object getClientCustomValues() {
        return clientCustomValues;
    }

    public void setClientCustomValues(Object clientCustomValues) {
        this.clientCustomValues = clientCustomValues;
    }
}
