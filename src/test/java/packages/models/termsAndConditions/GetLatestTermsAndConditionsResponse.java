package packages.models.termsAndConditions;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class GetLatestTermsAndConditionsResponse {
    private String _id;
    private String url;
    private String createdAt;
    private Integer __v;

    @JsonCreator
    public GetLatestTermsAndConditionsResponse(@JsonProperty("_id") String _id,
                                               @JsonProperty("createdAt") String createdAt,
                                               @JsonProperty("url") String url,
                                               @JsonProperty("__v") Integer __v) {
        this._id = _id;
        this.createdAt = createdAt;
        this.url = url;
        this.__v = __v;
    }

    public GetLatestTermsAndConditionsResponse() {
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public Integer get__v() {
        return __v;
    }

    public void set__v(Integer __v) {
        this.__v = __v;
    }
}

