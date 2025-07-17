import numpy as np
from datetime import datetime, timezone

class fd_const:
    # Constants for the Earth
    EARTH_RADIUS = 6378.137  # in kilometers
    EARTH_ROTATION_RATE = 2 * np.pi / (86164.1) # radians per second

    @staticmethod
    def mean_solar_time(utc_time):
        """"Convert UTC time to mean solar days since J2000 Epoch."""
        # J2000
        j2000 = datetime(2000, 1, 1, 12, tzinfo=timezone.utc)
        # Convert UTC time to mean solar time by dividing by mean solar day seconds
        return (utc_time.timestamp() -  j2000.timestamp()) / 86400
    
    @staticmethod
    def earth_rotation_angle(Tu):
        """Calculate the Earth rotation angle in radians."""
        return 2 * np.pi * (0.779057273264 + 1.00273781191135448 * Tu)

class ENZ:
    pass

class ECEF:
    rCGEarth = 0
    vCGEarth = 0
    EARTH_ROTATION_RATE = np.array([0, 0, fd_const.EARTH_ROTATION_RATE])  # Earth rotation velocity in ECEF frame

    def __str__(self):
        return f"""ECEF.rCGEarth = \n{self.rCGEarth}\n
ECEF.vCGEarth = \n{self.vCGEarth}\n
ECEF.earth_rotation_velocity = \n{self.EARTH_ROTATION_RATE}"""

    @staticmethod
    def coordinates_to_ECEF(lat_rad, lon_rad, elevation) -> np.array:
        """Convert ENZ coordinates to ECEF."""
        # Calculate ECEF coordinates
        x = (fd_const.EARTH_RADIUS + elevation) * np.cos(lat_rad) * np.cos(lon_rad)
        y = (fd_const.EARTH_RADIUS + elevation) * np.cos(lat_rad) * np.sin(lon_rad)
        z = (fd_const.EARTH_RADIUS + elevation) * np.sin(lat_rad)
        
        return np.atleast_2d([
            [x], 
            [y], 
            [z]
            ])
    
    @staticmethod
    def ECEF_to_NED(ECEF_velocity, lat_rad, lon_rad) -> np.array:
        """Convert ECEF velocity to NED."""
        return np.matmul(ECEF.tNED(lat_rad=lat_rad, lon_rad=lon_rad), ECEF_velocity)
    @staticmethod
    def tNED(lat_rad, lon_rad):
        """Transformation matrix from ECEF to NED."""
        # Transformation matrix from ECEF to NED
        return np.array([
            [-np.sin(lat_rad) * np.cos(lon_rad), -np.sin(lat_rad) * np.sin(lon_rad), np.cos(lat_rad)],
            [-np.sin(lon_rad), np.cos(lon_rad), 0],
            [-np.cos(lat_rad) * np.cos(lon_rad), -np.cos(lat_rad) * np.sin(lon_rad), -np.sin(lat_rad)]
        ])
    
    

class ECI:
    pass

class NED:
    vCGCG = 0

    def __str__(self):
        return f"NED.vCGCG = \n{self.vCGCG}"

    @staticmethod
    def NED_to_ECEF(NED_velocity, lat_rad, lon_rad) -> np.array:
        """Convert NED velocity to ECEF."""
        return np.matmul(NED.tECEF(lat_rad=lat_rad, lon_rad=lon_rad), NED_velocity)
    @staticmethod
    def tECEF(lat_rad, lon_rad):
        """Transformation matrix from NED to ECEF."""
        # Transformation matrix from NED to ECEF
        return np.array([
            [-np.sin(lat_rad) * np.cos(lon_rad), -np.sin(lon_rad), -np.cos(lat_rad) * np.cos(lon_rad)],
            [-np.sin(lat_rad) * np.sin(lon_rad), np.cos(lon_rad), -np.cos(lat_rad) * np.sin(lon_rad)],
            [np.cos(lat_rad), 0, -np.sin(lat_rad)]
        ])
    

def main():
    # ----- Formatting -----
    np.set_printoptions(precision=2, suppress=True, floatmode='fixed')
    # ----- Given values -----
    utc_time = datetime(2025, 12, 13, 14, 15, 16, tzinfo=timezone.utc)
    lat = 32 + (42/60) + (57.5/3600)  # degrees
    lon = -(96 + (57/60) + (51.5/3600))  # degrees
    elevation = 0.171 # km

    # ----- Calculated values -----
    # Mean solar days since J2000 Epoch
    Tu = fd_const.mean_solar_time(utc_time)
    # Earth rotation angle
    ERA = fd_const.earth_rotation_angle(Tu)
    # Convert latitude and longitude to radians
    lat_rad = np.radians(lat)
    lon_rad = np.radians(lon)

    ecef = ECEF()
    ned = NED()

    ecef.rCGEarth = ECEF.coordinates_to_ECEF(lat_rad, lon_rad, elevation)
    ned.vCGCG = np.atleast_2d(
        [[0], 
         [0], 
         [0]]
    )  # Assuming no velocity for this example
    ecef.vCGEarth = NED.NED_to_ECEF(ned.vCGCG, lat_rad, lon_rad)

    print(ecef)

if __name__ == "__main__":
    main()