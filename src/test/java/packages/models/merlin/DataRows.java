package packages.models.merlin;

import java.util.List;

public class DataRows {

    private List<MerlinRow> row;

    public DataRows(List<MerlinRow> row) {
        this.row = row;
    }

    public DataRows() {
    }

    public List<MerlinRow> getRow() {
        return row;
    }

    public void setRow(List<MerlinRow> row) {
        this.row = row;
    }
}
