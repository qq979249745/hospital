package bean;

public class Patient{
    /*create table if not exists patient (id int primary key auto_increment,
                                        account char(16),
    email char(32) ,
    password char(32),
    name char(16),
    integrity.jsp tinyint);*/
    private String id;
    private String account;
    private String email;
    private String password;
    private String name;
    private String integrity;

    public Patient() {
    }

    public Patient(String id, String account, String email, String password, String name, String integrity) {
        this.id = id;
        this.account = account;
        this.email = email;
        this.password = password;
        this.name = name;
        this.integrity = integrity;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntegrity() {
        return integrity;
    }

    public void setIntegrity(String integrity) {
        this.integrity = integrity;
    }
}
