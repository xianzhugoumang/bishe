package model;

public class Login {
    private String account;

    private String password;
    private int type;
    public String getAccount() {
        return account;
    }

    @Override
	public String toString() {
		return "Login [account=" + account + ", password=" + password + ", type=" + type + "]";
	}

	public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}