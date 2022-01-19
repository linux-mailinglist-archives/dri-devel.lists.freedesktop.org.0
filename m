Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B73493672
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 09:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6685110E860;
	Wed, 19 Jan 2022 08:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F5710E858
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 08:40:06 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id e3so6305685lfc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 00:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=SXQq9rN5zBUkQKNE0Ivp3Pzg3xcm4M4u40k+sMdUxTA=;
 b=fhc0hK1/WnEzeZqe7BKS8KCMrfuRKaA+bBGmof8JOE9+6GMUmkvTZgBVPmfSf5c1D9
 rQg8D0i7Rqz4NFAewNNakJ7w0oDxbJk7l/Z+B4yetE5iyMYPwRxZjnlfc0csJmsgzrpN
 Uikj9y79xNJZYEvwNs8ctv9mO6YCzruThn1OlFMkpJ7pXRaau9pYeBoC0KmJIAmZWgQl
 6pC4QyFi+b2/5PNP3niAP/0Gh8VTGVECB1zxNH3xw0f5sViQ+nO+AD1DfriZ74Lj+wXW
 vCfkd0D5RYfRiQqLjoCQbXen4jXTUdaksg2/R1ndVjxLzPVedPs9DeZ27zCm4CFB6huU
 +deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=SXQq9rN5zBUkQKNE0Ivp3Pzg3xcm4M4u40k+sMdUxTA=;
 b=abVu+Q7S0gnTH9WqGJqFOaohKjM2pIdC+OxasL5bDuABM3LCjL5Krq2gOGQhPELAI5
 rSAenShrn3Z3reuVm/bhjeZiG+2QDNXEon5ERFsbibWEeIK8uL+GILM35u2aVoau0w5c
 wU/TZzlrVO7kOPrfc5FEjYR5fW49TJ7BH+DNX3Rmf9ck5yl4MluQ6c93HpTfEu5zMCPR
 rTClaZ4LWqyP+Fzi+uG5QrF5GpCVP4meZDbTQzgIobzNvzbjuOz4oXcUDgg5tZus/1vS
 S/7Qkm8TCvhsl5BDHVWiX57z8Oib2nVxWgyW+aTSgv7xSWu95nRrnp4b1fS/6UyCXKcO
 ndJQ==
X-Gm-Message-State: AOAM533r7nznZnlufMGmoHFF+UwPyoELZ08dcD3d7J2/kBcJqmkrmdfq
 lScr0keB291OYQvlpBdMriw=
X-Google-Smtp-Source: ABdhPJwxq0qLxjcvHPejq/3Va1n4aFFKdh6SzZ39AvI96pEeJFP1ic33G48wGqCvRn5McCgtLxEgIg==
X-Received: by 2002:a2e:5801:: with SMTP id m1mr12246227ljb.164.1642581604046; 
 Wed, 19 Jan 2022 00:40:04 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k21sm1451287lfu.24.2022.01.19.00.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 00:40:03 -0800 (PST)
Date: Wed, 19 Jan 2022 10:39:53 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <20220119103953.75138bac@eldfell>
In-Reply-To: <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org>
 <20220118103323.4bae3a7d@eldfell>
 <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bND91UWGGOh_7.dIQvYk7JE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/bND91UWGGOh_7.dIQvYk7JE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Jan 2022 10:53:52 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Tue, Jan 18, 2022 at 10:33:23AM +0200, Pekka Paalanen wrote:
> > On Mon, 17 Jan 2022 19:47:39 +0100
> > Sven Schnelle <svens@stackframe.org> wrote:
> >  =20
> > > I also tested the speed on my Thinkpad X1 with Intel graphics, and th=
ere
> > > a dmesg with 919 lines one the text console took about 2s to display.=
 In
> > > x11, i measure 22ms. This might be unfair because encoding might be
> > > different, but i cannot confirm the 'memcpy' is faster than hardware
> > > blitting' point. I think if that would be the case, no-one would care
> > > about 2D acceleration. =20
> >=20
> > I think that is an extremely unfair comparison, because a graphical
> > terminal app is not going to render every line of text streamed to it.
> > It probably renders only the final view alone if you simply run
> > 'dmesg', skipping the first 800-900 lines completely. =20
>=20
> Probably more like "render on every vblank", but yes, unlike fbcon it
> surely wouldn't render every single character sent to the terminal.

Yes, and since 1k lines of dmesg is such little data, I would guess
even an old machine can chew that up in much less than one refresh
period until it needs to draw, so there is only going to be one or two
screen updates to be drawn.

Also, since X11 does not have vblank or frame boundaries in the
protocol, a terminal emulator app will do render throttling somehow
else. Maybe when it temporarily exhausts input and a timer as a
deadline in case input just keeps on flooding, would be my wild guess.


Thanks,
pq

--Sig_/bND91UWGGOh_7.dIQvYk7JE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmHnzlkACgkQI1/ltBGq
qqeVcQ//b/3acJqaOlvPPa2ubpvE2sLqP9JGlaV2ADN6X12IuC9N8dxIvV/Wt5J7
XrK47knUS0THSys+KigeUJa5bVTwquZLkfWp+eBECsyNulcv0PMFIoWHSCQBWHfO
smfyj0Do0UIPPUc0dG0Gawf1ye0oJPuo4xfwu5k2SE6fJa/Tm8ofIG3pq5GJo5a5
zUp9rIzDN7BclCKi/xQyXL+adyy7Mbe9/Ww6R0jFreMA4IBcNsDHqtGqI+OwIAEr
LHmZHG3QwA/rrBl+lO8AkoW3+2ym43IQESV0qDWHKeT9LNw3ua2N2loNUjarNaom
oxjzjyCII8o7ftiVdgeYJyYnaBcQP8NiOWOjWIXG8IrJwWp3nXEkvkeQMeQ5eqSP
ZbErx/2IPgbGKpS6PrMaSKeJWdkGq7xlnb8aSOmFdpmjvH7dHvHfR2ouhts028p8
f9PP7JqnIkPDaM0VDrdS1/m2v8N7gzwvDR3B5k0YHSHl2jtZbZmifStakeC8Emzu
A5XDQVgy1BjJw99cICtbZOhNkdOQQmmoLozN4vWgU2sm2axE9SnOMXh9QGVzja0N
CBbhu+mnNi51jtrBb8pfQV2sKhxaMtNi57hEaChcQbLFENbkXkjPgYdjVc4Ybsyq
BBeklMjSeiIvc/pdux9iykReqh6VzE1MR8OdB1OTs+b91fWBBSo=
=npdH
-----END PGP SIGNATURE-----

--Sig_/bND91UWGGOh_7.dIQvYk7JE--
