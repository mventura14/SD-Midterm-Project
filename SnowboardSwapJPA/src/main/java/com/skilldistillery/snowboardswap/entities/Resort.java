package com.skilldistillery.snowboardswap.entities;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Resort {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String website;

	private String name;

	private String description;

	@Column(name = "image_url")
	private String imageUrl;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@OneToMany(mappedBy = "resort")
	private List<Trail> trails;

	@ManyToOne
	@JoinColumn(name = "address_id")
	private Address address;

	@OneToMany(mappedBy = "resort")
	private List<Ride> rides;

	@OneToMany(mappedBy = "resort")
	private List<Lift> lifts;

	public Resort() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Trail> getTrails() {
		return trails;
	}

	public void setTrails(List<Trail> trails) {
		this.trails = trails;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Ride> getRides() {
		return rides;
	}

	public void setRides(List<Ride> rides) {
		this.rides = rides;
	}

	public List<Lift> getLifts() {
		return lifts;
	}

	public void setLifts(List<Lift> lifts) {
		this.lifts = lifts;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Resort other = (Resort) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Resort [id=" + id + ", website=" + website + ", name=" + name + "]";
	}

	public String getMapURL() {
		String mapURL = "";

		if (address != null) {
			mapURL = address.getStreet() + " " + address.getCity() + " " + address.getState() + " "
					+ address.getPostalCode();

			try {
				mapURL = URLEncoder.encode(mapURL, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return mapURL;
	}

}
