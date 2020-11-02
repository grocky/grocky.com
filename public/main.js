// Copyright 2020 Gray Designs. All Rights Reserved.
/*
 * @author rocky.grayjr@gmail.com (Rocky Gray)
 * @date November 2, 2020
 */

window.onload = () => {

  const R = ['#logo-top'];
  const G = ['#logo-top', '#logo-middle', '#logo-bottom'];
  const J = ['#logo-middle', '#logo-bottom'];

  const tl = new TimelineMax();

  tl.set(R, { autoAlpha: 0 });
  tl.to(R, { duration: .5, autoAlpha: 1 });
  tl.to(R, { duration: .5, autoAlpha: 0 });
  tl.to(G, { duration: .5, autoAlpha: 1 });
  tl.to(G, { duration: .5, autoAlpha: 0 });
  tl.to(J, { duration: .5, autoAlpha: 1 });
  tl.to(J, { duration: .5, autoAlpha: 0 });

  tl.to(G, { duration: 1, autoAlpha: 1 });
};
