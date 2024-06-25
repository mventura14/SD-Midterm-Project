package com.skilldistillery.snowboardswap.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Ride {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@CreationTimestamp
	private LocalDateTime departure;

	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;

	private int active;

	private String detail;

	@Column(name = "vehicle_capacity")
	private int vehicleCapacity;

	@Override
	public String toString() {
		return "Ride [id=" + id + ", departure=" + departure + ", createdAt=" + createdAt + ", active=" + active
				+ ", detail=" + detail + ", vehicleCapacity=" + vehicleCapacity + ", vehicleMake=" + vehicleMake
				+ ", vehicleModel=" + vehicleModel + ", updatedAt=" + updatedAt + ", imageUrl=" + imageUrl + ", resort="
				+ resort + ", departureAddress=" + departureAddress + ", arrivalAddress=" + arrivalAddress + "]";
	}

	@Column(name = "vehicle_make")
	private String vehicleMake;

	@Column(name = "vehicle_model")
	private String vehicleModel;

	@CreationTimestamp
	@Column(name = "updated_at")
	private LocalDateTime updatedAt;

	@Column(name = "image_url")
	private String imageUrl;

	@ManyToOne
	@JoinColumn(name = "resort_id")
	private Resort resort;

	@ManyToOne
	@JoinColumn(name = "departure_address_id")
	private Address departureAddress;

	@ManyToOne
	@JoinColumn(name = "arrival_address_id")
	private Address arrivalAddress;

	@ManyToOne
	@JoinColumn(name = "sponsor_id")
	private User user;

	public Ride() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getDeparture() {
		return departure;
	}

	public void setDeparture(LocalDateTime departure) {
		this.departure = departure;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getVehicleCapacity() {
		return vehicleCapacity;
	}

	public void setVehicleCapacity(int vehicleCapacity) {
		this.vehicleCapacity = vehicleCapacity;
	}

	public String getVehicleMake() {
		return vehicleMake;
	}

	public void setVehicleMake(String vehicleMake) {
		this.vehicleMake = vehicleMake;
	}

	public String getVehicleModel() {
		return vehicleModel;
	}

	public void setVehicleModel(String vehicleModel) {
		this.vehicleModel = vehicleModel;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Resort getResort() {
		return resort;
	}

	public void setResort(Resort resort) {
		this.resort = resort;
	}

	public Address getDepartureAddress() {
		return departureAddress;
	}

	public void setDepartureAddress(Address departureAddress) {
		this.departureAddress = departureAddress;
	}

	public Address getArrivalAddress() {
		return arrivalAddress;
	}

	public void setArrivalAddress(Address arrivalAddress) {
		this.arrivalAddress = arrivalAddress;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
		Ride other = (Ride) obj;
		return id == other.id;
	}
}