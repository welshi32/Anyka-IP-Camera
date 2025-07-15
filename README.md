# Anyka-IP-Camera
Reverse engineering a cheap Anyka chipset IP cma
> _This repository documents the internal details, firmware behavior, and misleading claims of a commonly sold low-cost AliExpress/Alibaba "4K AI PTZ" IP camera using the AK3918EN088V200 SoC._

---
<img width="795" height="795" alt="Screenshot 2025-07-15 at 10-30-15 2025 Hot Dual Antenna Wifi Camera 1080p Hd 360 Degree Wireless Security Webcam Ptz System Outdoor Home Nightvision - Buy Smart Home Indoor 2mp Wifi Ip Camera camera Surveillance Security Syste" src="https://github.com/user-attachments/assets/49f962ce-381f-483f-80d8-c12a58734ddb" />

## Summary

Despite being advertised as a **Linux-based 4K ONVIF-capable IP camera**, this device is in reality a **cloud-locked 1MP AliOS Things appliance** with:

- No RTSP or ONVIF support  
- Misrepresented hardware  
- Hardcoded dependence on **V380/YIIOT** cloud apps  
- Minimal local configurability or access  
- Useless shell with no meaningful commands  
- 2.4MB of wasted flash memory

---

## Claimed Specs (From Listing)

| Feature                | Claimed                     |
|------------------------|-----------------------------|
| CPU                    | AK3918 V300 / V330          |
| OS                     | Embedded Linux              |
| Resolution             | 8MP (4K)                    |
| Video Format           | H.265 / 20FPS               |
| PTZ                    | 355° H, 90° V               |
| Protocols              | RTSP, ONVIF, HTTP, FTP      |
| Audio                  | 2-way, ADPCM                |
| Storage                | TF Card + Cloud             |

## Actual Details (Confirmed)

| Feature                | Actual                                |
|------------------------|---------------------------------------|
| CPU                    | **AK3918EN088V200** (AliOS)           |
| OS                     | **AliOS Things 3.2**                  |
| Resolution             | 1MP sensor output (software upscaled) |
| PTZ                    | Works via app only                    |
| Video Access           | **No RTSP**, no open stream           |
| Protocols              | Proprietary app-only                  |
| Shell                  | `>` prompt, no BusyBox, no commands   |
| Web Interface          |  None                                 |
| Flash Chip             | XM25QH32C (4MB)                       |
| Wasted Space           | ~2.4MB of empty space                 |

<img width="795" height="795" alt="Screenshot 2025-07-15 at 10-30-15 2025 Hot Dual Antenna Wifi Camera 1080p Hd 360 Degree Wireless Security Webcam Ptz System Outdoor Home Nightvision - Buy Smart Home Indoor 2mp Wifi Ip Camera camera Surveillance Security Syste" src="https://github.com/user-attachments/assets/cf7e5329-2273-4771-93fd-bb631bab2a33" />

## Discovery Process

- Accessed UART via exposed headers
- Serial output confirmed bootloader into **AliOS Things**
- DHCP hostname reported as `aliosthings`
- Reverse engineered filesystem and confirmed:
  - No BusyBox
  - No RTSP server binary
  - Stripped-down root loop
  - Disabled telnet/ssh

---

## Manufacturer Response

When contacted, the seller/manufacturer replied:

> "This model does not support RTSP/ONVIF. Thank you for your understanding."

They later changed the listed CPU from **AK3918 V300** to **V330**, without explanation. No public firmware or recovery tools are available.

---

## Why This Matters

This is a growing trend in the low-cost camera market:
- Devices are falsely advertised as ONVIF-compatible Linux devices
- In reality, they are **cloud-dependent** and **intentionally closed off**
- Even when the hardware is capable, firmware is neutered
- Developers and users are locked out of their own devices

## Should You Buy This Camera?

No.  
Unless you want a camera that only works via a single cloud app (V380 Pro), offers no interoperability, and is hostile to inspection or modification.

---

## Contribute / Compare

If you've received a similar camera (AK3918, EN088, etc), feel free to contribute:
- Full or partial firmware dumps
- Board photos
- UART logs
- Disassembly guides
- Feature compatibility matrix

---

##  Final Notes

This camera is a great example of anti-user firmware design:  
It runs a locked RTOS instead of Linux, disables local streaming, and hides behind marketing buzzwords like "AI" and "4K".

The hardware has potential. The firmware kills it.
