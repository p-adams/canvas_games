import "./style.css";

function load() {
  const canvas = document.querySelector<HTMLCanvasElement>("#canvas")!;
  const ctx = canvas.getContext("2d");
  ctx?.fillRect(0, 0, 20, 20);
}
window.onload = load;
