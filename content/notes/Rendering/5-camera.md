---
title: Camera
date: 2020-04-14
---

## pinhole camera

- near plane - far plane
- NDC: normalized device coordinate space
  - 从 (0,0,0) 到 (1,1,1)
  - 设备无关
- Raster space: NDC 乘以分辨率
- look-at Transformation
- Orthographic projection
- Perspective project
- 坐标系汇总
  - World space：场景坐标系
  - Object space：以物体为中心的坐标系
  - Camera space：(orgin: camera position, z: viewing direction, y: updirection)
  - Normalized device space
  - Raster space: from (0,0,0) to (xRes, yRes, 1)

## thin lens

- 薄透镜：光线只折射一次
- 光线
  - Parallel Ray
  - Focal Ray
  - Chief Ray
- $\frac{1}{f}=\frac{1}{u}+\frac{1}{v}$
- Depth of Field:the range of distances from the lens at which objects appear in focus
- Circle of confusion(coc)
- 五位空间采样
  - x,y 采样
  - u,v 透镜采样
  - 时间采样
- 真实相机特有效果
  - Vignetting 渐晕：亮度不均匀；打到一个透镜后，能量无法全部打到第二个透镜
  - Distortion 镜头畸变（鱼眼镜头）
  - Chromatic Aberration：不同颜色的光的折射率不同
  - Bokeh 散焦：高光由于镜头原因出现散斑
  - Lens Flare：拍特别亮的光源出现多组亮光；透镜出现反射 Interflection
