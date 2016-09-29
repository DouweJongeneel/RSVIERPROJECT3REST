/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author douwejongeneel
 */
@Entity
@Table(name = "PaymentMethod")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PaymentMethod.findAll", query = "SELECT p FROM PaymentMethod p"),
    @NamedQuery(name = "PaymentMethod.findById", query = "SELECT p FROM PaymentMethod p WHERE p.id.id = :id"),
    @NamedQuery(name = "PaymentMethod.findByPaymentMehtod", query = "SELECT p FROM PaymentMethod p WHERE p.paymentMehtod = :paymentMehtod"),
    @NamedQuery(name = "PaymentMethod.findByPaymentId", query = "SELECT p FROM PaymentMethod p WHERE p.id.paymentId = :paymentId")})
public class PaymentMethod implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id")
    private Long id;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "paymentMehtod")
    private String paymentMehtod;
    @JoinColumn(name = "payment_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Payment payment;

    public PaymentMethod() {
    }

    public PaymentMethod(Long id) {
        this.id = id;
    }

    public PaymentMethod(Long id, String paymentMehtod) {
        this.id = id;
        this.paymentMehtod = paymentMehtod;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPaymentMehtod() {
        return paymentMehtod;
    }

    public void setPaymentMehtod(String paymentMehtod) {
        this.paymentMehtod = paymentMehtod;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
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
        if (!(object instanceof PaymentMethod)) {
            return false;
        }
        PaymentMethod other = (PaymentMethod) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.PaymentMethod[ id=" + id + " ]";
    }
    
}
