package packages.models.signuprequest;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class SignUpRequestAddress {

    private String street;
    private String number;
    private String province;
    private String location;
    private String floor;
    private String department;
    private String notes;

    @JsonCreator
    public SignUpRequestAddress(@JsonProperty("street") String street,
                                @JsonProperty("number") String number,
                                @JsonProperty("province") String province,
                                @JsonProperty("location") String location,
                                @JsonProperty("floor") String floor,
                                @JsonProperty("department") String department,
                                @JsonProperty("notes") String notes) {
        this.street = street;
        this.number = number;
        this.province = province;
        this.location = location;
        this.floor = floor;
        this.department = department;
        this.notes = notes;
    }

    public SignUpRequestAddress() {
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
