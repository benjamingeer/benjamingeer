---
title: Maths Example
date: 2024-11-15
categories:
  - Tutorials
tags:
  - Maths
draft: true
---

## Question

Determine the intervals on which the following function is increasing
and decreasing:

$$
f(x) = (x - 1)(x - 2)(x - 3)
$$

## Answer

First,

$$
f(x) = x^3 - 6x^2 + 11x - 6
$$

Then, to find the critical points, we take the derivative $f'(x)$ and
solve for $f'(x) = 0$:

$$
f'(x) = 3x^2 - 12x + 11 = 0
$$

Using the quadratic formula, we get

$$
\begin{align}
x &= \frac{12 \pm \sqrt{12^2 - 4 \cdot 3 \cdot 11}}{2 \cdot 3} \\
  &= \frac{12 \pm \sqrt{12}}{6} \\
  &= \frac{12}{6} \pm \frac{\sqrt{12}}{6} \\
  &= 2 \pm \frac{\sqrt{4 \cdot 3}}{6} \\
  &= 2 \pm \frac{2\sqrt{3}}{6} \\
  &= 2 \pm \frac{\sqrt{3}}{3} \\
  &= 2 \pm 3^{\frac{1}{2}} \cdot 3^{-1} \\
  &= 2 \pm 3^{-\frac{1}{2}} \\
  &= 2 \pm \frac{1}{\sqrt{3}}
\end{align}
$$

So we have two critical points: $2 + 1/\sqrt{3}$ and $2 - 1/\sqrt{3}$.
By experimenting with values of $f'(x)$ near the critical points, we
can see that $f(x)$ is decreasing when

$$
2 - \frac{1}{\sqrt{3}} \leq x \leq 2 + \frac{1}{\sqrt{3}}
$$

and increasing when

$$
x \leq 2 - \frac{1}{\sqrt{3}}
$$

or

$$
x \geq 2 + \frac{1}{\sqrt{3}}
$$

{{< figure file="test-curve.svg" caption="The graph of $f(x)$" >}}
