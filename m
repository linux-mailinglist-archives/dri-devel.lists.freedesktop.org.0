Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2081035D7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 09:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FDC6E04A;
	Wed, 20 Nov 2019 08:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4346E04A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 08:13:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id d5so26434358ljl.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 00:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Ym/35Yapy2qj5LZhjfpNO/wUzVkiJtYy66ZP3f0Omt0=;
 b=tLWNuArNgwDqQq326/5rUzaxxdFJRq0EDeawE4FLfeF5GTWJEd6kTKTr5Xj8chdMyH
 K1DLUCowoZbyz8tJtnrkXoUtkLHnsg0a1ST57MdxBgZOVcDsLhMcz1NCrMTvhWV74Cmo
 qYkWxeZdY3o4/9jAc6yy92MS0VRgN+INFZM+BJQpuzfchb3y7yCkQrnyUcBGJpf1Vcw9
 dfbQnRifoYmtXi+4Dxv1IiSE/NGlMHOlheeUINisJX1DCLneKuFG+ao8vJIwvbTGMNoW
 eEnWvR7OeRukYcqCoimY+vvQYmL21rUwdbUin/HalKA2wd7oO/Q98Q+YXD3Yv16VudEI
 bXdw==
X-Gm-Message-State: APjAAAWyG6ZBdNqNQipEi6v02EtC4riS2GlgOU5WfVdi2LJmQzQcD94R
 CEL5YiTHCuw0BX7Nm5RaORc=
X-Google-Smtp-Source: APXvYqz7XKyoHXzaAHlpkV3YwE1BKSz8rVWbFhXkB0mJxWDblWC5pqUpbXj0/NWqCQ9pDEwQ28S4cg==
X-Received: by 2002:a2e:8108:: with SMTP id d8mr1519739ljg.158.1574237584551; 
 Wed, 20 Nov 2019 00:13:04 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t28sm11332344ljd.47.2019.11.20.00.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 00:13:04 -0800 (PST)
Date: Wed, 20 Nov 2019 10:12:53 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: John Donnelly <john.p.donnelly@oracle.com>
Subject: Re: Bugzilla to Gitlabs migration - No email updates ?
Message-ID: <20191120101253.17efb124@eldfell.localdomain>
In-Reply-To: <5DE80E82-CE15-4B94-9150-8F474B6F6B59@oracle.com>
References: <5DE80E82-CE15-4B94-9150-8F474B6F6B59@oracle.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=Ym/35Yapy2qj5LZhjfpNO/wUzVkiJtYy66ZP3f0Omt0=;
 b=Paj2PGYQBZ7+QI5hGj7Xv1My954mJ2jmmHzlnwVJpKNSpIa5rHNhCbawo/Xm7y7v6e
 qd6dlSAUHBMOcdqpKWZ8aWx3VTODnJOj/EW31belwN69p6zypnreBELHCcqlq8l/5PAC
 ty/6fD/KJebgkT2UDtXFep7ccPHIWS34BxmzPRXv5VCe7eyAZz7zcWLGmLo/Ohd/Tg5Y
 XoisQ233Ra1G8t3r0SMgQRh1ZH8y2iXCP4qxb8nHcXfqWjJtOAl55B7cvyKvIV7LJ1qQ
 7oxKZyHIH4wpherHdWO5Ruvj9M9kEEcMlkcAJsBYAPZlCpzn3aAnti0qoYl3Eyduezra
 I3Sg==
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2115547094=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2115547094==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DrZnHwfFQODnpGakcAH.rEd"; protocol="application/pgp-signature"

--Sig_/DrZnHwfFQODnpGakcAH.rEd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Nov 2019 09:05:13 -0600
John Donnelly <john.p.donnelly@oracle.com> wrote:

> Does gitlab not generate email when a comment is added to a ticket ?

It does if your Gitlab notification settings are set that way. There
are your global, your per organization, and your per project
notification settings, and also the "notifications" switch in each
issue and MR individually.


Thanks,
pq

--Sig_/DrZnHwfFQODnpGakcAH.rEd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl3U9YUACgkQI1/ltBGq
qqeBHw/9E893k1tv+KYy+WKPnB54RYpFYxivDPThwP8jxODJnEc/fhLdSUbcAi8A
Bj7hziihlRYu91Fi+ZnEwKGIt5SF8bxYbLfTLv4DVHzO1pNaZrdt7qt5Qt7kS2Rd
QhWB9v3/gF/8IQjiH7kR7FB5g8DpY9+vqrlq5tIrvAL7dBRj/Iu1bHtW7WGJZrgO
Cy/j19xk4EEf4eMZtyWUON4VFCiglmIFtNYVekOBad3ROo9f89+KVlGxCFFN71Wt
NzI51T6BepecY7JyzCnYj1N25p64V7Xn8i7JffkCsezLfQZNDPGnpWDe7b7ckACh
HrCN5KcQSjjxxVY6cO1tUtK7teDmxTxCQ5JXuxrxbBWKgNi0DyuNTKxHsqcFGciO
Ec9a3PwFtdN1WuZqMVXa9StMcwp45A4QisH5cBIMImMsdlR6t0rhvxqg3AodXAOX
S4Z2mwZ+rH+1PQ9VZiUjCqy22FccG6MLlL09onv9qwo2bsbcDBetvUz55nw8Uxlq
FqzTapYKtJUVB76nygOX1Q+JZ46lYPjZ9nkfT/X6LxDiBxAMXKqKLRNicy4NQ0SN
tQEjZ4TPSPE0zq0t9V1yq8c1KMT4x45MUZ0cTkxEOLJlHDyZiyUe0drKJ5+Q15PZ
wKljfsxMYXhRv586yfXcR4457pOytgfoDtuFNwb1MPTWR4EOVQM=
=tcQV
-----END PGP SIGNATURE-----

--Sig_/DrZnHwfFQODnpGakcAH.rEd--

--===============2115547094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2115547094==--
