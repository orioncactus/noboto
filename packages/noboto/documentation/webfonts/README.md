# 웹폰트

대표적인 공개 CDN인 jsDelivr를 이용해 Noboto를 사용할 수 있습니다.

## font-family

어디서든 동일한 환경을 가지고자 한다면 아래와 같은 font-family 구성을 추천합니다.

```css
font-family: "Noboto", -apple-system, BlinkMacSystemFont, system-ui, "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
```

## 일반 웹폰트

모든 기능을 포함한 Noboto를 사용하려면 아래 코드를 사용하세요. 사용하는 font-family 이름은 `"Noboto"` 입니다.

#### HTML

```html
<link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/noboto@v1.0.0/packages/noboto/fonts/webfonts/static/complete/Noboto.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/noboto@v1.0.0/packages/noboto/fonts/webfonts/static/complete/Noboto.min.css" />
```

#### CSS

```css
@import url("https://cdn.jsdelivr.net/gh/orioncactus/noboto@v1.0.0/packages/noboto/fonts/webfonts/static/complete/Noboto.min.css");
```
