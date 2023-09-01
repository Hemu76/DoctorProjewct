package doctorsAppointment;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Mapper implements RowMapper<Doctors> {
	public Doctors mapRow(ResultSet rs, int i) throws SQLException {
		Doctors d = new Doctors();
		d.setDoctorid(rs.getInt(1));
		d.setFullname(rs.getString(2));
		d.setSpecializationid(rs.getInt(3));
		d.setQualification(rs.getString(4));
		d.setExperience(rs.getInt(5));
		d.setDesignation(rs.getString(6));
		d.setPhoto(rs.getString(7));
		return d;
	}

}