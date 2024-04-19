package org.wyttenbach.dale.almanac;

import org.influxdb.InfluxDB;
import org.influxdb.InfluxDBFactory;
import org.influxdb.dto.Pong;
import org.yaml.snakeyaml.Yaml;

public class MyInflux {

//  public static final Calendar HOUSE_END = new GregorianCalendar(2011,
//      OCTOBER, 20); // sold, stopped renting out

	public static void main(String argv[]) {
		String databaseURL = argv[0];
		String userName = argv[1];
		String password = argv[2];
		InfluxDB influxDB = InfluxDBFactory.connect(databaseURL, userName, password);
		Pong response = influxDB.ping();
		Yaml yaml = new Yaml();
		System.out.println(yaml.dump(response));
		if (response.getVersion().equalsIgnoreCase("unknown")) {
		    System.err.println("Error pinging server.");
		    return;
		} 
	}


}
