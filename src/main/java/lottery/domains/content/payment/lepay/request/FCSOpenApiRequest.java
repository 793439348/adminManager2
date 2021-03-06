package lottery.domains.content.payment.lepay.request;

import java.util.HashMap;
import java.util.Map;

public abstract class FCSOpenApiRequest
{
    protected String partner;
    protected String returnUrl;
    protected String service;
    protected String requestTime;
    
    public String getPartner() {
        return this.partner;
    }
    
    public void setPartner(final String partner) {
        this.partner = partner;
    }
    
    public String getReturnUrl() {
        return this.returnUrl;
    }
    
    public void setReturnUrl(final String returnUrl) {
        this.returnUrl = returnUrl;
    }
    
    public String getService() {
        return this.service;
    }
    
    public void setService(final String service) {
        this.service = service;
    }
    
    public String getRequestTime() {
        return this.requestTime;
    }
    
    public void setRequestTime(final String requestTime) {
        this.requestTime = requestTime;
    }
    
    protected Map<String, String> getBaseTextParams() {
        final Map map = new HashMap();
        map.put("partner", this.partner);
        map.put("return_url", this.returnUrl);
        map.put("service", this.service);
        map.put("request_time", this.requestTime);
        return (Map<String, String>)map;
    }
    
    public abstract Map<String, String> getTextParams();
}
