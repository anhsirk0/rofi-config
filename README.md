# My Rofi config

## Styles borrowed from Adi1090x's rofi themes

This repo has my rofi scripts for various menu/launchers  
It has 2 styles and 10 colors (from modus-themes (2) and ef-themes (8))

## Installation
Clone the repo into ~/.config/rofi/
```bash
git clone https://github.com/anhsirk0/rofi-config --depth 1
```

## Usage
<table>
  <tbody>
    <tr>
      <th>Script</th>
      <th >Usage</th>
      <th align="center">Screenshot</th>
    </tr>
    <tr>
      <td>browser/browser_menu.pl</td>
      <td>
          <p>Selected bookmark will be opened in a browser.</p>
          <p>
            If entered text is not in the options, it will search the text on ddg.
          </p>
          <p>Bangs are also supported.
            <br/>
            Format: "bang-key search term"
            <br/>
            Example: <code>yt Linux Distros</code> will search 'Linux distros' on youtube</p>
        <ul>
          <li>yt -> youtube search</li>
          <li>b -> brave search</li>
          <li>i -> Reverse image search by url</li>
          <li>di -> ddg images search</li>
          <li>u -> open url</li>
        </ul>
      </td>
      <td align="center">
        <img alt="browser" src="https://i.postimg.cc/tJwxZXRw/browser.png"/>
      </td>
    </tr>
    <tr>
      <td>helper/brightness_control.pl</td>
      <td>
        <ul>
          <li>Enter any <code>num</code> to set brightness to <code>num</code></li>
          <li>
            Enter <code>a{num}</code> to increase brightness by <code>num</code> (Example: <code>a10</code> will increase by 10)
          </li>
          <li>
            Enter <code>d{num}</code> to decrease brightness by <code>num</code> (Example: <code>d20</code> will decrease by 20)
          </li>
        </ul>
      </td>
      <td align="center">
        <img alt="brightness" src="https://i.postimg.cc/k53vYymz/brightness.png"/>
      </td>
    </tr>
    <tr>
      <td>helper/volume_control.pl</td>
      <td>
        <ul>
          <li>Enter any <code>num</code> to set volume to <code>num</code></li>
          <li>
            Enter <code>a{num}</code> to increase volume by <code>num</code> (Example: <code>a10</code> will increase by 10)
          </li>
          <li>
            Enter <code>d{num}</code> to decrease volume by <code>num</code> (Example: <code>d20</code> will decrease by 20)
          </li>
        </ul>
      </td>
      <td align="center">
        <img alt="volume" src="https://i.postimg.cc/GhfQGCSc/volume.png"/>
      </td>
    </tr>
    <tr>
      <td>screenshot/launcher.sh</td>
      <td>
        <p>Screenshot menu with 3 options (fullscreen, area, window)</p>
        <p>3 bangs are available</p>
        <ul>
          <li>
            <code>f my_screenshot_123</code> will capture fullscreen and save the image as <code>my_screenshot_123.png</code>
          </li>
          <li>
            <code>a my_area_screenshot</code> will capture selected region and save the image as <code>my_area_screenshot.png</code>
          </li>
          <li>
            <code>w my_window_screenshot</code> will capture active window and save the image as <code>my_window_screenshot.png</code>
          </li>
        </ul>
      </td>
      <td align="center">
        <img alt="screenshot" src="https://i.postimg.cc/JzBQQ29j/screenshot.png"/>
      </td>
    </tr>
    <tr>
      <td>emoji/emoji.pl or <code>rofi-emoji mode</code></td>
      <td>
        <p>Selected emoji will be copied to clipboard</p>
      </td>
      <td align="center">
        <img alt="emoji" src="https://i.postimg.cc/QMJ14GSK/emoji.png"/>
      </td>
    </tr>
    <tr>
      <td>powermenu/powermenu.sh</td>
      <td>
        <p>Lockscreen, Sleep, Logout, Reboot, Shutdown</p>
      </td>
      <td align="center">
        <img alt="powermenu" src="https://i.postimg.cc/PxfZ03F3/powermenu.png"/>
      </td>
    </tr>
    <tr>
      <td>lollypop/launcher.pl</td>
      <td>
        <p>Add a song to queue (lollypop music player)</p>
        <strong>This will work only for my version of <a href="https://gitlab.com/anhsirk0/lollypop-music-player">lollypop</a></strong>
      </td>
      <td align="center">
        <img alt="lollypop" src="https://i.postimg.cc/nrCmhsxq/lollypop.png"/>
      </td>
    </tr>
  </tbody>
</table>

## Colors
<table>
  <tbody>
    <tr>
      <th align="center" style="width: 25%;">Available colors</th>
      <th align="center">Screenshot</th>
    </tr>
    <tr>
      <td align="center">ef-spring</td>
      <td align="center">
        <img alt="ef-spring" src="https://i.postimg.cc/Hx30xDy1/ef-spring.png"/>
      </td>
    </tr>
    <tr>
      <td align="center">ef-summer</td>
      <td align="center">
        <img alt="ef-summer" src="https://i.postimg.cc/zGWnhRgj/ef-summer.png"/>
      </td>
    </tr>
    <tr>
      <td align="center">ef-trio-light</td>
      <td align="center">
        <img alt="ef-trio-light" src="https://i.postimg.cc/RV27qTNh/ef-trio-light.png"/>
      </td>
    </tr>
    <tr>
      <td align="center">ef-autumn</td>
      <td align="center">
        <img alt="ef-autumn" src="https://i.postimg.cc/yd7XsYWT/ef-autumn.png"/>
      </td>
    </tr>
    <tr>
      <td align="center">ef-bio</td>
      <td align="center">
        <img alt="ef-bio" src="https://i.postimg.cc/DZCshr92/ef-bio.png"/>
      </td>
    </tr>
    <tr>
      <td align="center">ef-cherie</td>
      <td align="center">
        <img alt="ef-bio" src="https://i.postimg.cc/s2r54DPR/ef-cherie.png"/>
      </td>
    </tr>
    <tr>
      <td align="center">ef-trio-dark</td>
      <td align="center">
        <img alt="ef-trio-dark" src="https://i.postimg.cc/4ySz66P8/ef-trio-dark.png"/>
      </td>
    </tr>
    <tr>
      <td align="center">ef-winter</td>
      <td align="center">
        <img alt="ef-winter" src="https://i.postimg.cc/kX2NnHML/ef-winter.png"/>
      </td>
    </tr>
    <tr>
      <td align="center">modus-operandi</td>
      <td align="center">
        <img alt="operandi" src="https://i.postimg.cc/RCsQxmmc/operandi.png"/>
      </td>
    </tr>
    <tr>
      <td align="center">modus-vivendi</td>
      <td align="center">
        <img alt="vivendi" src="https://i.postimg.cc/wMvXRfXy/vivendi.png"/>
      </td>
    </tr>
  </tbody>
</table>

### use change-theme.pl to change the themes (fzf optionally required)
```bash
$ ~/.config/rofi/change-theme.pl 
```
> This will use fzf to select a theme interactively
```bash
$ ~/.config/rofi/change-theme.pl bio
ef-bio.rasi' rofi theme selected
```
> This will change theme to the first theme that has bio in its name


## Thanks
Rofi styles - https://github.com/adi1090x/rofi  
Modus themes - https://protesilaos.com/emacs/modus-themes-colors  
Ef themes - https://protesilaos.com/emacs/ef-themes  
