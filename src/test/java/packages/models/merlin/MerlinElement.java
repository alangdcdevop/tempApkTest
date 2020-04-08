package packages.models.merlin;

public class MerlinElement {

    private String name;
    private String label;
    private String value;
    private String index;
    private String dataType;

    public MerlinElement(String name, String label, String value, String index, String dataType) {
        this.name = name;
        this.label = label;
        this.value = value;
        this.index = index;
        this.dataType = dataType;
    }

    public MerlinElement() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }
}
