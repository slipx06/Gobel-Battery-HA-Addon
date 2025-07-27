# Gobel Battery Monitor - Standalone Version

This is a standalone version of the Gobel Battery Monitor that can run independently of Home Assistant.

## Features

- Supports multiple BMS types: PACE_LV, JK_PB, TDT
- Supports both RS232 and RS485 connections
- MQTT integration for data publishing
- Cross-platform compatibility (Windows, Linux, macOS)

## Quick Start

### 1. Setup

**Linux/macOS:**
```bash
chmod +x setup.sh
./setup.sh
```

**Windows:**
```cmd
setup.bat
```

**Manual Setup:**
```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
# Linux/macOS:
source venv/bin/activate
# Windows:
venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### 2. Configuration

1. Copy the example configuration:
   ```bash
   cp config.json.example config.json
   ```

2. Edit `config.json` with your settings:
   ```json
   {
     "mqtt_broker": "localhost",
     "mqtt_port": 1883,
     "mqtt_username": "",
     "mqtt_password": "",
     "device_name": "Gobel Monitor",
     "battery_manufacturer": "Gobel Power",
     "battery_model": "GP-SR1-PC200",
     "connection_type": "serial",
     "battery_port": "rs232",
     "bms_type": "PACE_LV",
     "bms_usb_port": "/dev/ttyUSB0",
     "bms_baud_rate": 115200,
     "data_refresh_interval": 5,
     "debug": 1
   }
   ```

### 3. Run the Application

```bash
# Activate virtual environment (if not already activated)
source venv/bin/activate  # Linux/macOS
# or
venv\Scripts\activate     # Windows

# Run the application
python main.py
```

## Configuration Options

| Option | Description | Default |
|--------|-------------|---------|
| `mqtt_broker` | MQTT broker address | `localhost` |
| `mqtt_port` | MQTT broker port | `1883` |
| `mqtt_username` | MQTT username | `""` |
| `mqtt_password` | MQTT password | `""` |
| `device_name` | Device name for MQTT | `"Gobel Monitor"` |
| `battery_manufacturer` | Battery manufacturer | `"Gobel Power"` |
| `battery_model` | Battery model | `"GP-SR1-PC200"` |
| `connection_type` | Connection type: `serial`, `ethernet`, `wifi` | `"serial"` |
| `battery_port` | Port type: `rs232`, `rs485` | `"rs232"` |
| `bms_type` | BMS type: `PACE_LV`, `JK_PB`, `TDT` | `"PACE_LV"` |
| `bms_usb_port` | Serial port (auto-detected if empty) | Platform specific |
| `bms_baud_rate` | Serial baud rate | `115200` |
| `data_refresh_interval` | Data refresh interval in seconds | `5` |
| `debug` | Enable debug logging (0/1) | `1` |

## Command Line Options

```bash
python main.py --help
python main.py --config my_config.json
python main.py --debug
```

## Platform-Specific Notes

### Windows
- Serial ports are named `COM1`, `COM2`, etc.
- Use `COM3` for USB serial adapters

### Linux
- Serial ports are typically `/dev/ttyUSB0`, `/dev/ttyUSB1`, etc.
- You may need to add your user to the `dialout` group:
  ```bash
  sudo usermod -a -G dialout $USER
  ```

### macOS
- Serial ports are typically `/dev/tty.usbserial-*`
- No additional setup required

## Troubleshooting

### Missing Dependencies
If you see import errors, install the dependencies:
```bash
pip install -r requirements.txt
```

### Serial Port Access Denied
**Linux:** Add your user to the dialout group and restart:
```bash
sudo usermod -a -G dialout $USER
# Log out and back in, or restart
```

**Windows:** Run as administrator or check device manager for correct COM port.

### MQTT Connection Failed
- Check that your MQTT broker is running
- Verify the broker address and port in `config.json`
- Check username/password if authentication is enabled

### BMS Connection Failed
- Verify the serial port name in `config.json`
- Check that the baud rate matches your BMS
- Ensure the BMS is powered on and connected

## Development

To run in development mode with debug logging:
```bash
python main.py --debug
```

To use a custom configuration file:
```bash
python main.py --config my_config.json
```
```

## 7. Create config.json.example

```json:config.json.example
{
  "mqtt_broker": "localhost",
  "mqtt_port": 1883,
  "mqtt_username": "",
  "mqtt_password": "",
  "host_name": "homeassistant",
  "mqtt_discovery_topic": "homeassistant",
  "device_name": "Gobel Monitor",
  "battery_manufacturer": "Gobel Power",
  "battery_model": "GP-SR1-PC200",
  "max_parallel_allowed": 16,
  "connection_type": "serial",
  "battery_port": "rs232",
  "bms_type": "PACE_LV",
  "bms_ip_address": "10.0.0.5",
  "bms_ip_port": 9999,
  "bms_usb_port": "",
  "bms_baud_rate": 115200,
  "data_refresh_interval": 5,
  "debug": 1,
  "if_random": 0
}
```

## Summary

I've created all the necessary files to convert your Home Assistant addon to a standalone Python application:

1. **`requirements.txt`** - Dependencies list
2. **`config.json`** - Configuration file
3. **`main.py`** - Entry point
4. **`setup.sh`** / **`setup.bat`** - Setup scripts for different platforms
5. **Modified `sensor.py`** - Updated with standalone configuration loading
6. **`README_STANDALONE.md`** - Documentation for standalone usage
7. **`config.json.example`** - Example configuration

The key changes made to `sensor.py`:
- Added dependency checking
- Added command line argument parsing
- Modified configuration loading to support multiple file locations
- Added platform-specific serial port detection
- Made the `run()` function accept parameters
- Added better error handling

To use this standalone version:

1. Run the setup script for your platform
2. Copy `config.json.example` to `config.json` and edit it
3. Run `python main.py`

The application will now work independently of Home Assistant while maintaining all the original functionality! 