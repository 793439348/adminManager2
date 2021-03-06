package lottery.domains.content.payment.lepay.response;

public class FCSOpenApiResponse
{
    protected String is_succ;
    protected String fault_code;
    protected String fault_reason;
    protected String response;
    protected String sign;
    protected String charset;
    protected String remark;
    protected String result;
    
    public String getSign() {
        return this.sign;
    }
    
    public void setSign(final String sign) {
        this.sign = sign;
    }
    
    public String getResult() {
        return this.result;
    }
    
    public void setResult(final String result) {
        this.result = result;
    }
    
    public String getResponse() {
        return this.response;
    }
    
    public void setResponse(final String response) {
        this.response = response;
    }
    
    public String getIs_succ() {
        return this.is_succ;
    }
    
    public void setIs_succ(final String is_succ) {
        this.is_succ = is_succ;
    }
    
    public String getFault_code() {
        return this.fault_code;
    }
    
    public void setFault_code(final String fault_code) {
        this.fault_code = fault_code;
    }
    
    public String getFault_reason() {
        return this.fault_reason;
    }
    
    public void setFault_reason(final String fault_reason) {
        this.fault_reason = fault_reason;
    }
    
    public String getCharset() {
        return this.charset;
    }
    
    public void setCharset(final String charset) {
        this.charset = charset;
    }
    
    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(final String remark) {
        this.remark = remark;
    }
}
