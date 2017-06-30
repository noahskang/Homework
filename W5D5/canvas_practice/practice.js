document.addEventListener("DOMContentLoaded", function(){
  const canvas1 = document.getElementById("mycanvas");
  canvas1.height = 500;
  canvas1.width = 500;
  const ctx = canvas1.getContext("2d");

  ctx.fillStyle = "red";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "green";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "blue";
  ctx.fill();
});
