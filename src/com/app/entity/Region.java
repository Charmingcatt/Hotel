package com.app.entity;

public class Region {
	public int id;
	public String parent_id;

	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}

	public String getParent_id() {
		return parent_id;
	}

	public String region_name;

	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}

	public String getRegion_name() {
		return region_name;
	}

	public String region_type;

	public void setRegion_type(String region_type) {
		this.region_type = region_type;
	}

	public String getRegion_type() {
		return region_type;
	}

	public String agency_id;

	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}

	public String getAgency_id() {
		return agency_id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

}