package p2018.backend.entities;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Version;

import org.springframework.security.crypto.bcrypt.BCrypt;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "XUser")
public class User extends AuditableEntity implements Serializable {


	private static final long serialVersionUID = 5234562641511067060L;
	
	private String firstname;
	private String lastname;
	private String avatarUrl;
	private String dni;
	private Boolean isInternal;
	private Boolean accountConfirmed;
	private Boolean active;
	private Integer orderCount;
	private String username;
	private String password;
	private Boolean emailVerified;
	private String verificationToken;
	private String email;
	
	@Version
	private Integer version;
	
	@Column(name = "institutionId", insertable = false, updatable = false)
	private Long institutionId;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "institutionId")
	@JsonManagedReference
	private Institution institution;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
    @JoinTable(
        name = "XRoleMapping", 
        joinColumns = { @JoinColumn(name = "principalId") }, 
        inverseJoinColumns = { @JoinColumn(name = "roleId")}
    )
	private Set<Role> roles = new HashSet<>();
	
	@OneToMany(mappedBy = "operator")
	@JsonBackReference
	private Set<GeneralComment> coments = new HashSet<>();

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getAvatarUrl() {
		return avatarUrl;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public Boolean getIsInternal() {
		return isInternal;
	}

	public void setIsInternal(Boolean isInternal) {
		this.isInternal = isInternal;
	}

	public Boolean getAccountConfirmed() {
		return accountConfirmed;
	}

	public void setAccountConfirmed(Boolean accountConfirmed) {
		this.accountConfirmed = accountConfirmed;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}
	
	public Long getInstitutionId() {
		return institutionId;
	}

	public void setInstitutionId(Long institutionId) {
		this.institutionId = institutionId;
	}

	public Integer getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(Integer orderCount) {
		this.orderCount = orderCount;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = BCrypt.hashpw(password, BCrypt.gensalt());
	}

	public Boolean getEmailVerified() {
		return emailVerified;
	}

	public void setEmailVerified(Boolean emailVerified) {
		this.emailVerified = emailVerified;
	}

	public String getVerificationToken() {
		return verificationToken;
	}

	public void setVerificationToken(String verificationToken) {
		this.verificationToken = verificationToken;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Institution getInstitution() {
		return institution;
	}

	public void setInstitution(Institution institution) {
		this.institution = institution;
	}
	
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public Set<GeneralComment> getComents() {
		return coments;
	}
	public void setComents(Set<GeneralComment> coments) {
		this.coments = coments;
	}

	@Override
	public String toString() {
		return "User [firstname=" + firstname + ", lastname=" + lastname + ", dni=" + dni + ", active=" + active
				+ ", username=" + username + "]";
	}

	public User(String firstname, String lastname, String dni, Boolean isInternal,
			Boolean accountConfirmed, Boolean active, Integer orderCount, String username, String password,
			Boolean emailVerified, Institution institution, String email) {
		
		this.firstname = firstname;
		this.lastname = lastname;
		this.avatarUrl = "/assets/avatar.svg";
		this.dni = dni;
		this.isInternal = isInternal;
		this.accountConfirmed = accountConfirmed;
		this.active = active;
		this.orderCount = orderCount;
		this.username = username;
		this.password = password;
		this.emailVerified = emailVerified;
		this.institution = institution;
		this.email = email;
	}

	public User() {
		this.avatarUrl = "/assets/avatar.svg";
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}
	
}
