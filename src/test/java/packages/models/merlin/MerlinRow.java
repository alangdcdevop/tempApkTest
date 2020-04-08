package packages.models.merlin;

import java.util.List;

public class MerlinRow {

    private String service;
    private List<MerlinElement> element;

    public MerlinRow(String service, List<MerlinElement> element) {
        this.service = service;
        this.element = element;
    }

    public MerlinRow() {
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public List<MerlinElement> getElement() {
        return element;
    }

    public void setElement(List<MerlinElement> element) {
        this.element = element;
    }
}
