package packages.models.signuprequest;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class SignUpRequestContactInfo {

    private String procedure;
    private String name;
    private String lastName;
    private String gender;
    private String dni;
    private String cuit;
    private String cuil;
    private String type;
    private String birthDate;
    private String createdAt;

    @JsonCreator
    public SignUpRequestContactInfo(@JsonProperty("procedure") String procedure,
                                    @JsonProperty("name") String name,
                                    @JsonProperty("lastName") String lastName,
                                    @JsonProperty("gender") String gender,
                                    @JsonProperty("dni") String dni,
                                    @JsonProperty("cuit") String cuit,
                                    @JsonProperty("cuil") String cuil,
                                    @JsonProperty("type") String type,
                                    @JsonProperty("birthDate") String birthDate,
                                    @JsonProperty("createdAt") String createdAt) {
        this.procedure = procedure;
        this.name = name;
        this.lastName = lastName;
        this.gender = gender;
        this.dni = dni;
        this.cuit = cuit;
        this.cuil = cuil;
        this.type = type;
        this.birthDate = birthDate;
        this.createdAt = createdAt;
    }

    public SignUpRequestContactInfo() {
    }

    public String getProcedure() {
        return procedure;
    }

    public void setProcedure(String procedure) {
        this.procedure = procedure;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCuit() {
        return cuit;
    }

    public void setCuit(String cuit) {
        this.cuit = cuit;
    }

    public String getCuil() {
        return cuil;
    }

    public void setCuil(String cuil) {
        this.cuil = cuil;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
