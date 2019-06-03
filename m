Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEAF3323B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 16:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4601A89244;
	Mon,  3 Jun 2019 14:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057E489244
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 14:34:24 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 16so2852902ljv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 07:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=HO1HAHyYE+7xtqSWRgChgTmfXz1bVrXgGFVgm3aiyq8=;
 b=IIoHhF7EFJUlnmZDzjWa9GTaH+42Qqj26Yx+2AT12GeAjXGkjflDbNZ6n9Qcn9oHn+
 BoSfmtqhdB1d03r1HtFpsfDnFoW/fPcKZqnvEZNXYexhPZkXpfhZIAFoJUGeNAVuap59
 3hI35kcwYo+9SjO3KSGDo34yh7AddOypeBzFG1E/S0ps3ORITMWW3K3ah4pcsO9lnwD3
 KVRixJKYyQFgy1fwEfmhzPpXnESNZBkmdwUtk7v2IbYnU3C22B4MTuoDjXcOpaAPyPhU
 Ipq/hOo+8ScQTZbNnETdcu+O67nDJUx3ou8mbmzQEuKlTRiBVHqIAuNqzCSg30VXOnN6
 KolA==
X-Gm-Message-State: APjAAAU5NBV3ULc84cYqp3BYDkOogggazhSt8U1ZAMA5mGKGs9DmAzaq
 F9vJiknMDWqdrqQMflWg5NJxtD3p
X-Google-Smtp-Source: APXvYqzaYntbBcoCg1D0jhEHZEljm57Nr2CsJNeuce3hGJRx6zK2EywjP4jDK9eEcmxq33FnDquhtA==
X-Received: by 2002:a2e:9bc5:: with SMTP id w5mr14370517ljj.87.1559572462452; 
 Mon, 03 Jun 2019 07:34:22 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h23sm3214843ljf.28.2019.06.03.07.34.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 07:34:22 -0700 (PDT)
Date: Mon, 3 Jun 2019 17:34:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/docs: More links for implicit/explicit fencing.
Message-ID: <20190603173411.12159113@eldfell.localdomain>
In-Reply-To: <20190603142848.26487-1-daniel.vetter@ffwll.ch>
References: <20190603142848.26487-1-daniel.vetter@ffwll.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=HO1HAHyYE+7xtqSWRgChgTmfXz1bVrXgGFVgm3aiyq8=;
 b=kOkmV13bAKrXU/mhd9gTMy1AH+xiExMzNCebXgbCFe0vd70Si0hboZp/MuPanjpuVV
 KFMtAGpYatxG7LCkodXnoh0j7GgOzrbJh4XQz6UwZ8SDaW7ZgCCqcFgGg7lvf4CUIXs2
 VPxmf7PhusRp4o+kyfQxaIdoAME4q27B0stDu2PR6DFflEEVXAKOjYjTPIL223Lz7Sf9
 eyOCO/JrvgXbNSVRTEjAMQEYph4Ky7zA5K4GUVMzpFPhejNh/l694bO9R+3iWgNYuY/5
 Akb1V1gSAu94hxiKAmsGrocEdrKc/S0oFKGt8FVtKkN1UtTBqLUyQBitu5a+hNQ1IrrQ
 drOg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1419447813=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1419447813==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7DTZUI.SQ2NMdeJuY0CeH3f"; protocol="application/pgp-signature"

--Sig_/7DTZUI.SQ2NMdeJuY0CeH3f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  3 Jun 2019 16:28:48 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> drm_atomic_set_fence_for_plane() contains the main discussion from a
> driver pov, link to that from more places.
>=20
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 6 ++++++
>  include/drm/drm_plane.h                      | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/d=
rm/drm_gem_framebuffer_helper.c
> index 6fd48efe288c..6791245963c3 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -284,6 +284,9 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
>   * There is no need for &drm_plane_helper_funcs.cleanup_fb hook for simp=
le
>   * gem based framebuffer drivers which have their buffers always pinned =
in
>   * memory.
> + *
> + * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
> + * explicit fencing in atomic modeset updates.
>   */
>  int drm_gem_fb_prepare_fb(struct drm_plane *plane,
>  			  struct drm_plane_state *state)
> @@ -314,6 +317,9 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_prepare_fb);
>   * &dma_buf attached, extracts the exclusive fence and attaches it to pl=
ane
>   * state for the atomic helper to wait on. Drivers can use this as their
>   * &drm_simple_display_pipe_funcs.prepare_fb callback.
> + *
> + * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
> + * explicit fencing in atomic modeset updates.
>   */
>  int drm_gem_fb_simple_display_pipe_prepare_fb(struct drm_simple_display_=
pipe *pipe,
>  					      struct drm_plane_state *plane_state)
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 6078c700d9ba..cd5903ad33f7 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -69,7 +69,7 @@ struct drm_plane_state {
>  	 *
>  	 * Optional fence to wait for before scanning out @fb. The core atomic
>  	 * code will set this when userspace is using explicit fencing. Do not
> -	 * write this directly for a driver's implicit fence, use
> +	 * write this field directly for a driver's implicit fence, use
>  	 * drm_atomic_set_fence_for_plane() to ensure that an explicit fence is
>  	 * preserved.
>  	 *

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
FWIW

Thanks!
pq

--Sig_/7DTZUI.SQ2NMdeJuY0CeH3f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlz1L+MACgkQI1/ltBGq
qqfYkg//eF44idY67Q5BTsFq48H9PFsOmNOvhcMu7uC6GV7ADvWoAZWT9Mn40beJ
OlCHtL//G2do3f5UG6b2992zO4BPeufos5LAlviRlvu+RzKMejnjCwixRTglpu1P
OSJNTphlYQ/gVRn3LVJvTqmkfgAw/j7pHJmOxrAsYtrTBRxJLloh2GGWCfk7kXjr
xsNceV8Wi9xRPzexqpb1ZOWkuhUbc7ggldplfV2CfDvkq0lx7oUVNRyw0lfAN5CR
OwG8NCKPPFoKH0FDHXzCwDS/Stds0R4RbEPw/XmyOuBXR8GOaX0SMNjwVvzM8CVk
l68tmUPHz5wGrgz6B+AlVRH6fuKbFVQs/hwU86uzMjFO9s311LGEaJz4/ZYFstVa
+WGkhY0HTbMitU1e2hofxxL4cWFMyjstxS33YoxZBtLMns//uV83YIkJr2+T8TL1
AVzHc27AwxkESOtOfIqX8nfe9jFTZXHrv/no3agd8h+ey3u9/GkiRT4t3EDgnkUN
lA3EVN839s3pDNUFaR+dbptE0Mh3v4CYfsDVNOeOj4skf/XahjM8u1tIrv+g0KjI
QmC9Y/ZvsDXE9uy82JkAwiB/gOXc1x8nESE4zbzMeVqOxezcJ2/aay/Z31Fxlk3v
/TE6NywJME+7xemqHznCxxohB4EYz8ElyH2f3WiMGDKOwt6/zqI=
=47is
-----END PGP SIGNATURE-----

--Sig_/7DTZUI.SQ2NMdeJuY0CeH3f--

--===============1419447813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1419447813==--
