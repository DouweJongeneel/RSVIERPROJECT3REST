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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "address")
@XmlRootElement
@NamedQueries({
	@NamedQuery(name = "Address.findAll", query = "SELECT a FROM Address a"),
	@NamedQuery(name = "Address.findById", query = "SELECT a FROM Address a WHERE a.id = :id"),
	@NamedQuery(name = "Address.findByStreet", query = "SELECT a FROM Address a WHERE a.street = :street"),
	@NamedQuery(name = "Address.findByNumber", query = "SELECT a FROM Address a WHERE a.number = :number"),
	@NamedQuery(name = "Address.findByAddition", query = "SELECT a FROM Address a WHERE a.addition = :addition"),
	@NamedQuery(name = "Address.findByZipcode", query = "SELECT a FROM Address a WHERE a.zipcode = :zipcode"),
	@NamedQuery(name = "Address.findByCity", query = "SELECT a FROM Address a WHERE a.city = :city"),
	@NamedQuery(name = "Address.findByDateCreated", query = "SELECT a FROM Address a WHERE a.dateCreated = :dateCreated"),
	@NamedQuery(name = "Address.findByDateModified", query = "SELECT a FROM Address a WHERE a.dateModified = :dateModified")})
public class Address implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Long id;

	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 255)
	@Column(name = "street")
	private String street;

	@Basic(optional = false)
	@NotNull
	@Column(name = "number")
	private String number;

	@Size(max = 45)
	@Column(name = "addition")
	private String addition;

	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 45)
	@Column(name = "zipcode")
	private String zipcode;

	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 255)
	@Column(name = "city")
	private String city;

	@Basic(optional = false)
	@NotNull
	@Column(name = "dateCreated")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;

	@Column(name = "dateModified")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateModified;

	@JoinColumn(name = "user_id", referencedColumnName = "id")
	@ManyToOne
	private User userId;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "address")
	private Collection<Activity> activityCollection;

	public Address() {
	}

	public Address(Long id) {
		this.id = id;
	}
	public Address(String street, String number, String zipcode, String city) {
		this.street = street;
		this.number = number;
		this.addition = "";
		this.zipcode = zipcode;
		this.city = city;
		this.dateCreated = new Date(System.currentTimeMillis());
	}

	public Address(String street, String number, String addition, String zipcode, String city) {
		this.street = street;
		this.number = number;
		this.addition = addition;
		this.zipcode = zipcode;
		this.city = city;
		this.dateCreated = new Date(System.currentTimeMillis());
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getAddition() {
		return addition;
	}

	public void setAddition(String addition) {
		this.addition = addition;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Date getDateModified() {
		return dateModified;
	}

	public void setDateModified(Date dateModified) {
		this.dateModified = dateModified;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	@XmlTransient
	public Collection<Activity> getActivityCollection() {
		return activityCollection;
	}

	public void setActivityCollection(Collection<Activity> activityCollection) {
		this.activityCollection = activityCollection;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (id != null ? id.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Address)) {
			return false;
		}
		Address other = (Address) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "beans.entity.Address[ id=" + id + " ]";
	}

}
