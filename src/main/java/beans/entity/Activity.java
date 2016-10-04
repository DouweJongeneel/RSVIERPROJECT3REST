package beans.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author douwejongeneel
 */
@Entity
@Table(name = "activity")
@XmlRootElement
@NamedQueries({
	@NamedQuery(name = "Activity.findAll", query = "SELECT a FROM Activity a"),
	@NamedQuery(name = "Activity.findByName", query = "SELECT a FROM Activity a WHERE a.name = :name"),
	@NamedQuery(name = "Activity.findByDescription", query = "SELECT a FROM Activity a WHERE a.description = :description"),
	@NamedQuery(name = "Activity.findByPrice", query = "SELECT a FROM Activity a WHERE a.price = :price"),
	@NamedQuery(name = "Activity.findByDateCreated", query = "SELECT a FROM Activity a WHERE a.dateCreated = :dateCreated"),
	@NamedQuery(name = "Activity.findByDateModified", query = "SELECT a FROM Activity a WHERE a.dateModified = :dateModified")})
public class Activity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id")
	private Long id;

	@Basic(optional = false)
	@NotNull
	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;

	@Basic(optional = false)
	@NotNull
	@DecimalMin(value = "2")
	@Column(name = "price", columnDefinition="Decimal(10,2)")
	private BigDecimal price;

	@Column
	private Date startDate;

	@Column
	private Date endDate;

	@Column
	private String startTime;

	@Column
	private String endTime;

	@Column
	private String website;

	@ManyToMany
	private Collection<Category> categoryCollection;

	@JoinColumn(name = "address_id", referencedColumnName = "id", insertable = false, updatable = false)
	@ManyToOne(optional = false)
	private Address address;

	@JoinColumn(name = "organiser_id", referencedColumnName = "id", insertable = false, updatable = false)
	@ManyToOne(optional = false)
	private User organiser;

	@OneToMany
	private Collection<Invoice> invoiceCollection;

	@OneToMany
	private Collection<User> userCollection;

	@Basic(optional = false)
	@Column(name = "dateCreated")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;

	@Column(name = "dateModified")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateModified;

	public Activity() {
	}

	public Activity(Long id) {
		this.id = id;
	}

	public Activity(Long id, String name, BigDecimal price) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.dateCreated = new Date(System.currentTimeMillis());
	}



	public Collection<Invoice> getInvoiceCollection() {
		return invoiceCollection;
	}

	public void setInvoiceCollection(Collection<Invoice> invoiceCollection) {
		this.invoiceCollection = invoiceCollection;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public Collection<Category> getCategoryCollection() {
		return categoryCollection;
	}

	public void setCategoryCollection(Collection<Category> categoryCollection) {
		this.categoryCollection = categoryCollection;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
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

	@XmlTransient
	public Collection<User> getUserCollection() {
		return userCollection;
	}

	public void setUserCollection(Collection<User> userCollection) {
		this.userCollection = userCollection;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public User getOrganiser() {
		return organiser;
	}

	public void setOrganiser(User organiser) {
		this.organiser = organiser;
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
		if (!(object instanceof Activity)) {
			return false;
		}
		Activity other = (Activity) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "beans.entity.Activity[ id=" + id + " ]";
	}

}
