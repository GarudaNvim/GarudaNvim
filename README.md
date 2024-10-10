<div align="center">
  <img width="722" alt="GarudaNvim" src="https://github.com/user-attachments/assets/39cdf8f0-c8f4-44e6-845d-a1e0fbbeac8a">
  <p>
    <p>For those ready to transform their Workflow</p>
    <a href="https://github.com/GarudaNvim/GarudaNvim/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/GarudaNvim/GarudaNvim?style=for-the-badge&logo=github&color=FFB3BA&logoColor=D9E0EE&labelColor=302D41&include_prerelease&sort=semver" />
    </a>
    <a href="https://github.com/GarudaNvim/GarudaNvim/releases/latest">
      <img alt="Release Date" src="https://img.shields.io/github/release-date/GarudaNvim/GarudaNvim?style=for-the-badge&logo=calendar&color=FFD1DC&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/GarudaNvim/GarudaNvim/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/GarudaNvim/GarudaNvim?style=for-the-badge&logo=git&color=FFDAC1&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
    <a href="https://github.com/GarudaNvim/GarudaNvim/stargazers">
      <img alt="Stars" src="https://img.shields.io/github/stars/GarudaNvim/GarudaNvim?style=for-the-badge&logo=starship&color=FFF5BA&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    </br>
    <a href="https://github.com/GarudaNvim/GarudaNvim/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/GarudaNvim/GarudaNvim?style=for-the-badge&logo=bilibili&color=FFDFBA&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/GarudaNvim/GarudaNvim/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/GarudaNvim/GarudaNvim?style=for-the-badge&logo=creativecommons&color=FFC3A0&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/GarudaNvim/GarudaNvim">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/GarudaNvim/GarudaNvim?style=for-the-badge&logo=codesandbox&label=SIZE&color=FFE6AA&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    </br>
    <a href="https://github.com/GarudaNvim/GarudaNvim">
      <img alt="Open Source" src="https://img.shields.io/badge/GarudaNvim-orange?style=for-the-badge" />
    </a>
  </p>
</div>

---

## Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Support](#support)
- [Acknowledgements](#acknowledgements)

---

## Introduction

**GarudaNvim** is a blend of **Garuda**, the swift and powerful bird from Indian mythology, and **Neovim**, the highly efficient text editor. Just like Garuda symbolizes speed and agility, GarudaNvim aims to give you a fast, keyboard-centric development experience, allowing you to navigate and code with unparalleled efficiency.

---

## Installation

Installation is super easy! Just copy paste the below command on your terminal, press Enter and you are good to go. GarudaNvim will be installed in your machine!
```
LATEST=$(curl -s https://api.github.com/repos/GarudaNvim/Installer/releases/latest | grep '"tag_name"' | cut -d '"' -f 4)
wget -q https://raw.githubusercontent.com/GarudaNvim/Installer/$LATEST/installGarudaNvim.sh
chmod +x installGarudaNvim.sh && { ./installGarudaNvim.sh } || { echo }
rm -f installGarudaNvim.sh
```

#### Uninstallation

Uninstallion is also easy. Run the following command to remove GarudaNvim and its repositories from your system.
```
LATEST=$(curl -s https://api.github.com/repos/GarudaNvim/Installer/releases/latest | grep '"tag_name"' | cut -d '"' -f 4)
wget -q https://raw.githubusercontent.com/GarudaNvim/Installer/$LATEST/uninstallGarudaNvim.sh
chmod +x uninstallGarudaNvim.sh && { ./uninstallGarudaNvim.sh } || { echo }
rm -f uninstallGarudaNvim.sh
```

For more information on Installation(and Uninstallation), checkout our [Installer](https://github.com/GarudaNvim/Installer) repo.

---

## Support

If you like this project, please consider giving it a star ⭐ on GitHub – it helps the project grow and reach more people! Your support is much appreciated!
</br>

If you're interested in supporting the development of GarudaNvim further, please consider [sponsoring this project](https://github.com/sponsors/prrockzed). Your contributions will help cover expenses and enable more frequent updates and enhancements. Thank you for your support!

---

## Acknowledgements

Thanks to [Neovim](https://github.com/neovim/neovim) for enabling the creation of a powerful and customizable terminal-based code editor.
</br>
A special thank you to all the creators and maintainers of the plugins used in the repo, which have significantly improved the functionality and user experience of GarudaNvim.

---

Happy Coding with **GarudaNvim**! 💻
</br>
P.S. - This project has been started by **Priyanshu Ranjan**, a final year student from **IIT Kharagpur**
