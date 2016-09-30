/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author douwejongeneel
 */
@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findById", query = "SELECT u FROM User u WHERE u.id = :id"),
    @NamedQuery(name = "User.findByFirstname", query = "SELECT u FROM User u WHERE u.firstname = :firstname"),
    @NamedQuery(name = "User.findByInsertion", query = "SELECT u FROM User u WHERE u.insertion = :insertion"),
    @NamedQuery(name = "User.findByLastname", query = "SELECT u FROM User u WHERE u.lastname = :lastname"),
    @NamedQuery(name = "User.findByPhone", query = "SELECT u FROM User u WHERE u.phone = :phone"),
    @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email"),
    @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password"),
    @NamedQuery(name = "User.findByRole", query = "SELECT u FROM User u WHERE u.role = :role"),
    @NamedQuery(name = "User.findByDateCreated", query = "SELECT u FROM User u WHERE u.dateCreated = :dateCreated"),
    @NamedQuery(name = "User.findByDateModified", query = "SELECT u FROM User u WHERE u.dateModified = :dateModified")})
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "firstname")
    private String firstname;
    
    @Size(max = 45)
    @Column(name = "insertion")
    private String insertion;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "lastname")
    private String lastname;
    
    @Column(name = "phone")
    private Integer phone;
    
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "email")
    private String email;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "password")
    private String password;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "role")
    private String role;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "dateCreated")
    @Temporal(TemporalType.TIMESTAMP)
    private String dateCreated;
    
    @Column(name = "dateModified")
    @Temporal(TemporalType.TIMESTAMP)
    private String dateModified;
    
    @ManyToMany(mappedBy = "userCollection")
    private Collection<Activity> activityCollection;
    
    @OneToMany(mappedBy = "userId")
    private Collection<ActivityHasOrganiser> activityHasOrganiserCollection;
    
    @OneToMany(mappedBy = "userId")
    private Collection<Address> addressCollection;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<Payment> paymentCollection;

    public User() {
        this.dateCreated = new Date(System.currentTimeMillis()).toString();
    }

    public User(Long id) {
        this.id = id;
        this.dateCreated = new Date(System.currentTimeMillis()).toString();
    }
    
    public User(String firstname, String lastname, String insertion, String email, String password, String role) {
        this.firstname = firstname;
        this.insertion = insertion;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.role = role;
        this.dateCreated = new Date(System.currentTimeMillis()).toString();
    }

    public User(String firstname, String lastname, String email, String password, String role) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.role = role;
        this.dateCreated = new Date(System.currentTimeMillis()).toString();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getInsertion() {
        return insertion;
    }

    public void setInsertion(String insertion) {
        this.insertion = insertion;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getDateModified() {
        return dateModified;
    }

    public void setDateModified(String dateModified) {
        this.dateModified = dateModified;
    }

    @XmlTransient
    public Collection<Activity> getActivityCollection() {
        return activityCollection;
    }

    public void setActivityCollection(Collection<Activity> activityCollection) {
        this.activityCollection = activityCollection;
    }

    @XmlTransient
    public Collection<ActivityHasOrganiser> getActivityHasOrganiserCollection() {
        return activityHasOrganiserCollection;
    }

    public void setActivityHasOrganiserCollection(Collection<ActivityHasOrganiser> activityHasOrganiserCollection) {
        this.activityHasOrganiserCollection = activityHasOrganiserCollection;
    }

    @XmlTransient
    public Collection<Address> getAddressCollection() {
        return addressCollection;
    }

    public void setAddressCollection(Collection<Address> addressCollection) {
        this.addressCollection = addressCollection;
    }

    @XmlTransient
    public Collection<Payment> getPaymentCollection() {
        return paymentCollection;
    }

    public void setPaymentCollection(Collection<Payment> paymentCollection) {
        this.paymentCollection = paymentCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "beans.entity.User[ id=" + id + " ]";
    }
    
}
